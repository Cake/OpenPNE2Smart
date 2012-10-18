<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * params mailto : address (required)
 *        _linktxt : link text
 *        _type : link(default), button
 *        _id : Tag Id
 *        _class : Tag Class
 *        _attr : Tag attribute
 */

function smarty_function_t_mail_post($params, &$smarty)
{
    if (!isset($params['mailto']) || empty($params['mailto'])) {
        return null;
    } else {
        $p['mailto'] = $params['mailto'];
        unset($params['mailto']);
    }

    $type = 'link';
    if (isset($params['_type'])) {
        if ($params['_type'] == 'button') {
            $type = 'button';
        }
        unset($params['_type']);
    }

    $p['_linktxt'] = 'メールで投稿';
    if (isset($params['_linktxt'])) {
        $p['_linktxt'] = $params['_linktxt'];
        unset($params['_linktxt']);
    }

    $p['_id'] = '';
    if (isset($params['_id'])) {
        $p['_id']  = $params['_id'];
        unset($params['_id']);
    }

    $p['_class'] = '';
    if (isset($params['_class'])) {
        $p['_class'] = $params['_class'];
        unset($params['_class']);
    }

    $p['_attr'] = '';
    if (isset($params['_attr'])) {
        $p['_attr'] = $params['_attr'];
        unset($params['_attr']);
    }

    if ($type == 'button') {
        return _smarty_function_t_mail_post_button($p);
    } else {
        return _smarty_function_t_mail_post_link($p);
    }
}

function _smarty_function_t_mail_post_button($params) {
    $params = __smarty_function_t_mail_post_perset($params);

    $html = sprintf(
        "<form action=\"mailto:%s\" method=\"%s\"%s>\n", 
            $params['mailto'], 
            'get',
            $attr
    );
    $html .= "<ul class=\"moreInfo button\">\n";
    $html .= sprintf("<li><input type=\"submit\" class=\"input_submit\" value=\"%s\" /></li>\n", $params['_linktxt']);
    $html .= "</ul>\n";

    $html .= "</form>\n";

    return $html;
}

function _smarty_function_t_mail_post_link($params) {
    $params = __smarty_function_t_mail_post_perset($params);

    return sprintf('<a href="mailto:%s"%s>%s</a>', 
        $params['mailto'], 
        $params['_attr'],
        $params['_linktxt']
     );
}

function __smarty_function_t_mail_post_perset($params) {
    $params['mailto'] = htmlspecialchars($params['mailto'], ENT_QUOTES, 'UTF-8');

    $id = sprintf('id = "%s"', $id);

    $attr = '';
    if (!empty($params['_class'])) {
        $attr .= sprintf(' class = "%s"', $p['_class']);
    }
    if (!empty($params['_id'])) {
        $attr .= sprintf(' id = "%s"', $p['_id']);
    }
    if (!empty($params['_attr'])) {
        $attr .= sprintf(' %s', $p['_attr']);
    }
    $params['_attr'] = $attr;

    $params['_linktxt'] = htmlspecialchars($params['_linktxt'], ENT_QUOTES, 'UTF-8');

    return $params;
}

?>
