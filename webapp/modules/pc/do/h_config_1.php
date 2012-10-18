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

/**
 * メールアドレス変更
 */
class pc_do_h_config_1 extends OpenPNE_Action
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

        if (!db_member_is_limit_domain4mail_address($pc_address)) $msg_list[] = "このメールアドレスでは登録できません";

        if ($msg_list) {
            $msg = array_shift($msg_list);
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_config', $p);
        }

        /* OpenPNE2 スマートフォン対応：ここから */
        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart) {
            // アドレスチェック
            if ($p = check_ktai_address($pc_address)){
                openpne_redirect('pc', 'page_h_config', $p);
            }

            // 携帯アドレス
            if (is_ktai_mail_address($pc_address)) {
                db_member_delete_c_member_ktai_pre4ktai_address($pc_address);
                db_member_delete_c_ktai_address_pre4ktai_address($pc_address);

                $session = create_hash();
                db_member_insert_c_ktai_address_pre($u, $session, $pc_address);

                do_mail_sns_change_ktai_mail_send($u, $session, $pc_address);

            // PCアドレス
            } else {
                db_member_h_config_1($u, $pc_address);
            }

            $GLOBALS['AUTH']->logout();
            openpne_redirect('pc', 'page_o_h_config_mail');
        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        $c_member_id = db_member_c_member_id4pc_address($pc_address);
        if ($c_member_id == $u) {
            //自分のメールアドレス
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_config', $p);
        } elseif ($c_member_id) {
            //既に使われている
            $p = array('msg' => "入力されたメールアドレスは既に登録されています");
            openpne_redirect('pc', 'page_h_config', $p);
        }

        if (is_ktai_mail_address($pc_address)) {
            $p = array('msg' => '携帯メールアドレスは記入できません');
            openpne_redirect('pc', 'page_h_config', $p);
        }

        db_member_h_config_1($u, $pc_address);

        $GLOBALS['AUTH']->logout();
        openpne_redirect('pc', 'page_o_h_config_mail');
    }
}

/* OpenPNE2 スマートフォン対応：ここから */
/* アドレスチェック
    @ 引数：$address
    @ return : 登録可 = null
               登録不可 = array(エラーメッセージ)
 */
function check_ktai_address($address){
    // アドレスとして正しい
    if (!db_common_is_mailaddress($address)) {
        return array('msg' => "メールアドレスを正しく入力してください");
    }

    // 登録済みチェック
        // 自分のメールアドレス
        // 既に使われている
        // pc/ktai両方チェック
    if (db_member_is_sns_join4mail_address($address)) {
        return array('msg' => "入力されたメールアドレスは既に登録されています");
    }

    // ドメイン制限
    if (!db_member_is_limit_domain4mail_address($address)) {
        return array('msg' => "このメールアドレスでは登録できません");
    }

    return null;
}
/* OpenPNE2 スマートフォン対応：ここまで */

?>
