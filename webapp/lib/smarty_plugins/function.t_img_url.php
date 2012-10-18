<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @version   version beta
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * サムネイルのトリミング出力：正方形、短辺基準、長辺トリミング
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_img_url($params, &$smarty)
{
    $p = _smarty_function_t_img_url($params);
    $html = true;
    if (isset($params['_html'])) {
        $html = (bool)$params['_html'];
        unset($params['_html']);
    }
    $urlencode = false;
    if (isset($params['_urlencode'])) {
        $urlencode = (bool)$params['_urlencode'];
        unset($params['_urlencode']);
    }

    if (OPENPNE_IMG_URL) {
        $url = OPENPNE_IMG_URL;
    } else {
        $url = './';
    }

    if (!OPENPNE_IMG_CACHE_PUBLIC) {
        $url .= 'img.php';
        if ($q = http_build_query($p)) {
            if ($html) {
                $url .= '?' . htmlspecialchars($q);
            } else {
                $url .= '?' . $q;
            }
        }
    } else {
        include_once 'OpenPNE/Img.php';
        if (!$p['f']) {
            $parts = explode('.', $p['filename']);
            $f = array_pop($parts);
            switch ($f) {
            case 'jpg':
            case 'gif':
            case 'png':
                $p['f'] = $f;
                break;
            default:
                $p['f'] = 'jpg';
                break;
            }
        }
    /* OpenPNE2 スマートフォン対応：ここから */
        $path = OpenPNE_Img::get_cache_path($p['filename'], $p['w'], $p['h'], $p['f'], $p['trim']);
    /* OpenPNE2 スマートフォン対応：ここまで */
        $url .= 'img/' . $path;
    }

    if ($urlencode) {
        $url = urlencode($url);
    }

    return $url;
}

/**
 * validate params
 * @param  array $params
 * @return array
 */
function _smarty_function_t_img_url($params)
{
    $result = array();

    $filename = $params['filename'];
    if (empty($filename) || preg_match('/[^\.\w]/', $filename)) {
        if (!empty($params['noimg'])) {
            $filename = db_get_c_skin_filename4skinname($params['noimg']);
        } else {
            $filename = db_get_c_skin_filename4skinname('no_image');
        }
    }
    $result['filename'] = $filename;

    if (!empty($params['w']) && (intval($params['w']) > 0)) {
        $result['w'] = intval($params['w']);
    }
    if (!empty($params['h']) && (intval($params['h']) > 0)) {
        $result['h'] = intval($params['h']);
    }

    if (!empty($params['f'])) {
        switch ($params['f']) {
        case 'jpg':
        case 'gif':
        case 'png':
            $result['f'] = $params['f'];
    /* OpenPNE2 スマートフォン対応：ここから */
            break;
        }
    }

    if (!empty($params['trim'])) {
        switch ($params['trim']) {
        case 'square':
            $result['trim'] = $params['trim'];
    /* OpenPNE2 スマートフォン対応：ここまで */
            break;
        }
    }

    if ($GLOBALS['__Framework']['current_module'] === 'admin' && ADMIN_MODULE_NAME) {
        $result['m'] = ADMIN_MODULE_NAME;
    } else {
        $result['m'] = $GLOBALS['__Framework']['current_module'];
    }

    if ($GLOBALS['KTAI_URL_TAIL']) {
        $result['ksid'] = session_id();
    }

    return $result;
}

?>
