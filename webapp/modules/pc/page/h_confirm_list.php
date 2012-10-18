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

class pc_page_h_confirm_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi('h'));

        /* OpenPNE2 スマートフォン対応：ここから */
        // あなたにフレンドリンクを要請しているメンバー
        $anatani_c_friend_confirm_list = db_friend_anatani_c_friend_confirm_list4c_member_id($u);
        $this->set("anatani_c_friend_confirm_list", $anatani_c_friend_confirm_list);
        $this->set("anatani_c_friend_confirm_num", count($anatani_c_friend_confirm_list));

        // あなたに(の)管理コミュニティに参加を希望しているメンバー
        $anatani_c_commu_member_confirm_list = db_commu_anatani_c_commu_member_confirm_list4c_member_id($u);
        $this->set("anatani_c_commu_member_confirm_list", $anatani_c_commu_member_confirm_list);
        $this->set("anatani_c_commu_member_confirm_num", count($anatani_c_commu_member_confirm_list));

        // あなたにコミュニティ管理者交代を希望しているメンバー
        $anatani_c_commu_admin_confirm_list = db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u);
        $this->set("anatani_c_commu_admin_confirm_list", $anatani_c_commu_admin_confirm_list);
        $this->set("anatani_c_commu_admin_confirm_num", count($anatani_c_commu_admin_confirm_list));

        // あなたにコミュニティ副管理者を希望しているメンバー
        $anatani_c_commu_sub_admin_confirm_list = db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($u);
        $this->set("anatani_c_commu_sub_admin_confirm_list", $anatani_c_commu_sub_admin_confirm_list);
        $this->set("anatani_c_commu_sub_admin_confirm_num", count($anatani_c_commu_sub_admin_confirm_list));
        /* OpenPNE2 スマートフォン対応：ここまで */

        //---- ページ表示 ----//
        return 'success';
    }
}

?>
