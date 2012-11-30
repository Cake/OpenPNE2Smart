<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* OpenPNE2 スマートフォン対応：独自アクション */
class pc_page_o_regist_error extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $this->set('SNS_NAME', SNS_NAME);

        return 'success';
    }
}
?>
