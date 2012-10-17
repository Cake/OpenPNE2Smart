<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* OpenPNE2 スマートフォン対応：独自アクション */
class pc_page_o_regist_smart_intro extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart && IS_GET_EASY_ACCESS_ID == 3) {
                openpne_redirect('pc', 'page_o_regist_error');
        }

        // --- リクエスト変数
        $ses = $requests['ses'];
        // ----------

        // セッションが有効かどうか
        if (!$pre = db_member_c_member_ktai_pre4session($ses)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'])) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        // 招待者の情報
        $c_member_invite = db_member_c_member_with_profile($pre['c_member_id_invite'], 'friend');
        $this->set('last_login',p_f_home_last_login4access_date($c_member_invite['access_date']));
        $this->set('friend_count',db_friend_count_friends($c_member_invite['c_member_id']));
        $this->set('target_c_member', $c_member_invite);

        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $this->set('ses', $ses);
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_kiyaku'));

        return 'success';
    }
}
?>
