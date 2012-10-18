<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_com_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        // navi 振り分け用
        if ($target_c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        $page_size = 50;
        /* OpenPNE2 スマートフォン対応：ここから */
        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart) {
            // 3x3面表示
            $page_size = 9;
        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        $this->set("page", $page);

        /* OpenPNE2 スマートフォン対応：ここから */
        if ($smartPhone->is_smart) {
            list($c_commu_list, $pager) = db_commu_all_c_commu_list4c_member_id($target_c_member_id, $page_size);
        } else {
            list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($target_c_member_id, $page, $page_size);
        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        $this->set("fh_com_list_user", $c_commu_list);
        $this->set("pager", $pager);

        for ($i=1; $i <= $pager['total_page']; $i++) {
            $page_list[] = $i;
        }
        $this->set("page_list", $page_list);

        return 'success';
    }
}

?>
