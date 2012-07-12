<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_comment_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi("h"));

        //日記一覧
        $page_size = 50;
        /* OpenPNE2 スマートフォン対応：ここから */
        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart) {
             // 取得件数
             $page_size = 5;
        }
        /* OpenPNE2 スマートフォン対応：ここまで */
        $this->set("page_size", $page_size);

        $lst = db_commu_c_commu_topic_comment_list4c_member_id_2($u, $page_size, $page);
        $this->set("h_com_comment_list", $lst[0]);

        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);
        $this->set("page", $page);

        /* OpenPNE2 スマートフォン対応：ここから */
        $total_page_num = ceil($lst[3] / $page_size);
        $this->set("total_page_num", $total_page_num);
        /* OpenPNE2 スマートフォン対応：ここまで */

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

        return 'success';
    }
}

?>
