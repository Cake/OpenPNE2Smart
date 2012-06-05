<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_smart extends OpenPNE_Action
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
        $err_msg = $requests['err_msg'];
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

        $this->set('err_msg', $err_msg);

        session_name('OpenPNEpcregist');
        @session_start();
        $this->set('profs', $_SESSION['prof']);

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));

        $this->set('ses', $ses);
        $this->set('ktai_address', $pre['ktai_address']);


        $public_flags = array(
            'public' => '全員に公開',
            'friend' => WORD_MY_FRIEND.'まで公開',
            'private'=> '公開しない',
        );
        $this->set('public_flags', $public_flags);

        $this->set('month_list', p_regist_prof_c_profile_month_list4null());
        $this->set('day_list', p_regist_prof_c_profile_day_list4null());
        $this->set('query_list', p_common_c_password_query4null());

        $this->set('c_profile_list', db_member_c_profile_list());

        return 'success';
    }
}

?>
