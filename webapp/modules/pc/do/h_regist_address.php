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

/**
 * メールアドレス変更
 */
class pc_do_h_regist_address extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];
        // ----------

        $msg_list = array();
        if (!$pc_address)  $msg_list[] = "メールアドレスを入力してください";
        if (!$pc_address2)  $msg_list[] = "メールアドレス(確認)を入力してください";
        if ($pc_address != $pc_address2) $msg_list[] = "メールアドレスが一致しません";
        if (!db_common_is_mailaddress($pc_address)) $msg_list[] = "メールアドレスを正しく入力してください";

        if ($msg_list) {
            $msg = array_shift($msg_list);
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        /* OpenPNE2 スマートフォン対応：ここから */
//        $c_member_id = db_member_c_member_id4pc_address($pc_address);
        $is_ktai_address = false;
        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart && is_ktai_mail_address($pc_address)) {
            $c_member_id = db_member_c_member_id4ktai_address($pc_address);
            $is_ktai_address = true;
        } else {
            $c_member_id = db_member_c_member_id4pc_address($pc_address);
        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        if ($c_member_id == $u) {
            //自分のメールアドレス
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_regist_address', $p);
        } elseif ($c_member_id) {
            //既に使われている
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        if (!db_member_is_limit_domain4mail_address($pc_address)) {
            $msg = "そのメールアドレスでは登録できません";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        /* OpenPNE2 スマートフォン対応：ここから */
//        if (is_ktai_mail_address($pc_address)) {
        if (is_ktai_mail_address($pc_address) && !$is_ktai_address) {
            $p = array('msg' => '携帯メールアドレスは記入できません');
            openpne_redirect('pc', 'page_h_regist_address', $p);
        }

        if ($is_ktai_address) {
            db_member_delete_c_ktai_address_pre4ktai_address($pc_address);

            $session = create_hash();
            db_member_insert_c_ktai_address_pre($u, $session, $pc_address);

            //function cache削除
            cache_drop_c_member_profile($u);

            do_mail_sns_change_ktai_mail_send($u, $session, $pc_address);
        } else {
            db_member_h_regist_mail($u, $pc_address);
        }
//        db_member_h_regist_mail($u, $pc_address);
        /* OpenPNE2 スマートフォン対応：ここまで */

        $GLOBALS['AUTH']->logout();
        openpne_redirect('pc', 'page_o_h_regist_mail');
    }
}

?>
