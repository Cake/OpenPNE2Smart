<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* OpenPNE2 スマートフォン対応：独自アクション */
class pc_do_o_set_view extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $value = $requests['value'];
        // ----------

        if ($value == 'pc') {
            set_cookie_pc_view();
        } else {
            delete_cookie_pc_view();
        }

        // ホームに戻る
        openpne_redirect('pc');
    }
}
?>
