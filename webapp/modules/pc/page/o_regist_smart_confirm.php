<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* OpenPNE2 スマートフォン対応：独自アクション */
class pc_page_o_regist_smart_confirm extends OpenPNE_Action
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

        $this->set('inc_page_header', fetch_inc_page_header('regist'));

        $this->set('ses', $ses);
        session_name('OpenPNEpcregist');
        @session_start();
        $this->set('prof', $_REQUEST['prof']);
        $this->set('ktai_address', $pre['ktai_address']);
        $query_list = p_common_c_password_query4null();
        $query_id = $_REQUEST['c_password_query_id'];
        $this->set('password_query_name', $query_list[$query_id]);

        $this->set('profile_list', db_member_c_profile_list4null());

        return 'success';
    }
}

?>
