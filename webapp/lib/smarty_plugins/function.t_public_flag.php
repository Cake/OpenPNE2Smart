<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_public_flag($params, &$smarty)
{
    if (!isset($params['public_flag']) || empty($params['public_flag'])) {
        return null;
    }

    if ($params['public_flag'] == 'public') {
        return null;
    } elseif ($params['public_flag'] == 'friend') {
        $icon_url = $GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings']['smart-public-friend'];
        $alt = WORD_MY_FRIEND. 'まで公開';
    } elseif ($params['public_flag'] == 'private') {
        $icon_url = $GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings']['smart-public-private'];
        $alt = '公開しない';
    } else {
        return null;
    }

    $html = "<img src=\"$icon_url\" alt=\"$alt\" class=\"icon_public\" />";

    return $html;
}
