<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_login2ktai extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        $c_member_id = intval($requests['id']);
        // ----------

        $this->set('ses', $ses);

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        // セッションが有効かどうか
        if (!$pre = db_member_c_ktai_address_pre4session($ses)) {
            // 無効の場合
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $this->set('ses', $ses);
        $this->set('pre', $pre);
        return 'success';

    }
}

?>
