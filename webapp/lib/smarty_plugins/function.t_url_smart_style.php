<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_url_smart_style($params, &$smarty)
{
    $result = <<<EOD
	<link rel="stylesheet" href="./modules/smart/jquermobile/1.1/jquery.mobile.min.css">
	<script type="text/javascript" src="./modules/smart/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="./modules/smart/jquermobile/1.1/jquery.mobile.min.js"></script>
<link rel="stylesheet" href="./smart_style.php?hash={$hash}" type="text/css" />
EOD;
EOD;

    return $result;
}

?>
