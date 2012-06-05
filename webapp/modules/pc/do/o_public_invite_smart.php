<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_public_invite_smart extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // オープン制のSNS以外では無効
        if (IS_CLOSED_SNS) {
            client_redirect_login();
        }
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];
        // ----------

        $smartPhone = new OpenPNE_SmartPhoneUA();
        if (!$smartPhone->is_smart) {
            openpne_forward('pc', 'do', "o_public_invite");
            exit;
        }
        if (IS_GET_EASY_ACCESS_ID == 3) {
                openpne_redirect('pc', 'page_o_regist_error');
        }

        //新規登録時の招待者（c_member_id=1）
        $c_member_id_invite = 1;

        if (OPENPNE_USE_CAPTCHA) {
            @session_start();
            if (empty($_SESSION['captcha_keystring']) || $_SESSION['captcha_keystring'] !=  $requests['captcha']) {
                unset($_SESSION['captcha_keystring']);
                $msg = "確認キーワードが誤っています";
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_o_public_invite', $p);
            }
            unset($_SESSION['captcha_keystring']);
        }
        if (!db_common_is_mailaddress($pc_address)) {
            $msg = 'メールアドレスを正しく入力してください';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        // 携帯アドレスのみ
        if (!is_ktai_mail_address($pc_address)) {
            $_SESSION['captcha_keystring'] = $requests['captcha'];
            openpne_forward('pc', 'do', "o_public_invite");
            exit;
        }
        if ($pc_address != $pc_address2) {
            $msg = 'メールアドレスが一致していません';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        if (db_member_c_member_id4ktai_address2($pc_address)) {
            $msg = 'そのメールアドレスは既に登録されています';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        if (!db_member_is_limit_domain4mail_address($pc_address)) {
            $msg = 'そのメールアドレスでは登録できません';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }

        $session = create_hash();

        if (db_member_c_member_ktai_pre4ktai_address($pc_address)) {
            db_member_update_c_member_ktai_pre($session, $pc_address, $c_member_id_invite);
        } else {
            db_member_insert_c_member_ktai_pre($session, $pc_address, $c_member_id_invite);
        }

        h_invite_insert_c_invite_mail_send($session, $c_member_id_invite, $pc_address);

        // delete cookie
        setcookie(session_name(), '', time() - 3600, ini_get('session.cookie_path'));

        openpne_redirect('pc', 'page_o_public_invite_end');
    }
}

?>
