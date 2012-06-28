<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */
/* OpenPNE2 スマートフォン対応 */

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

    $html = sprintf(
        "<form action=\"mailto:%s\" method=\"%s\"%s>\n", 
            $params['mailto'], 
            'get',
            $attr
    );
    $html .= "<img src=\"$icon_url\" alt=\"$alt\" />";

    return $html;
}
