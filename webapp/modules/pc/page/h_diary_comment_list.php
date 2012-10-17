<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_comment_list extends OpenPNE_Action
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
        $this->set("page_size", $page_size);

        $lst = p_h_diary_comment_list_c_diary_my_comment_list4c_member_id($u, $page, $page_size);
        $this->set("h_diary_comment_list", $lst[0]);
        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);

        $this->set("page", $page);
        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

        /* OpenPNE2 スマートフォン対応：ここから */
        $total_page_num =  ceil($lst[3] / $page_size);
        $this->set("total_page_num", $total_page_num);
        /* OpenPNE2 スマートフォン対応：ここまで */

        return 'success';
    }
}

?>
