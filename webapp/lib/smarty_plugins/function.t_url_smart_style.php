<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_url_smart_style($params, &$smarty)
{
    $decoration_config = db_decoration_enable_list();
    $skin_filename_list = db_get_c_skin_filename_list();

    $hash = md5(OPENPNE_VERSION . OPENPNE_SKIN_THEME . serialize($decoration_config) . serialize($skin_filename_list));

    $hash .= 'verb';

    $result = <<<EOD
<script type="text/javascript" src="./modules/smart/smartpne.js"></script>
<script type="text/javascript" src="./js/pne.js"></script>
<link rel="stylesheet" href="./smart_style.php?hash={$hash}" type="text/css" />
EOD;

    return $result;
}

?>
