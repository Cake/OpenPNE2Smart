<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */
 
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_delete_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (IS_GET_EASY_ACCESS_ID == 3 || IS_GET_EASY_ACCESS_ID == 2) {
            handle_kengen_error();
        }

        /* OpenPNE2 スマートフォン対応：ここから */
        $smartPhone = new OpenPNE_SmartPhoneUA();
        if ($smartPhone->is_smart) {
            handle_kengen_error();
        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        db_member_update_ktai_address($u, '');
        openpne_redirect('pc', 'page_h_ktai_delete_end');
    }
}

?>
