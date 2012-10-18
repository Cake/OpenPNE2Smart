<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_update_ktai_address extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $password = $requests['password'];
        // ----------

        // セッションが有効かどうか
        if (!$pre = db_member_c_ktai_address_pre4session($ses)) {
            // 無効の場合
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'], $pre['c_member_id'])) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $c_member_id = $pre['c_member_id'];
        $ktai_address = $pre['ktai_address'];

        // パスワードチェック
        if (!db_common_authenticate_password($c_member_id, $password, true)) {
            $msg = "パスワードが違います";
            $p = array('ses' => $ses, 'msg' => $msg);
            openpne_redirect('pc', 'page_o_login2ktai', $p);
        }

        // 携帯の個体識別番号を取得しない

        db_member_update_ktai_address($c_member_id, $ktai_address);
        db_member_delete_ktai_address_pre($pre['c_ktai_address_pre_id']);

        // login ページへリダイレクト
        $p = array('msg_code' => 'regist_mail');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
