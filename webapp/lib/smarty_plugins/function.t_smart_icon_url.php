<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_smart_icon_url($params, &$smarty)
{
    if (isset($params['public_flag']) || !empty($params['public_flag'])) {
        if ($params['public_flag'] == 'public') {
            return null;
        } elseif ($params['public_flag'] == 'friend') {
            $params['icon_name'] = 'smart-public-friend';
        } elseif ($params['public_flag'] == 'private') {
            $params['icon_name'] = 'smart-public-private';
        } else {
            return null;
        }
    } elseif (!isset($params['icon_name']) || empty($params['icon_name'])) {
        return null;
    }

    $icon_name = $params['icon_name'];

    if (!isset($GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings'][$icon_name]) || empty($GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings'][$icon_name])) {
        return null;
    }
    $icon_url = $GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings'][$icon_name]['url'];

    if (isset($GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings'][$icon_name]['alt'])) {
        $alt = $GLOBALS['_OPENPNE_SMART_ICON_LIST']['settings'][$icon_name]['alt'];
    } else {
        $alt = '';
    }

    $html = "<img src=\"$icon_url\" alt=\"$alt\" />";

    return $html;
}
