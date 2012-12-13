<?php

$request_uri = $_SERVER['REQUEST_URI'];

chdir('../');
require_once './config.inc.php';

    /* OpenPNE2 スマートフォン対応：ここから */
$regexp = '/img\/(jpg|gif|png)\/w(\d+)?_h(\d+)?\/' .
             OPENPNE_IMG_CACHE_PREFIX.'(square_)?(\w+)\.(?:jpe?g|gif|png)$/';
    /* OpenPNE2 スマートフォン対応：ここまで */
if (preg_match($regexp, $request_uri, $matches)) {
    $f = $matches[1];
    $w = $matches[2];
    $h = $matches[3];

    /* OpenPNE2 スマートフォン対応：ここから */
    $filename = preg_replace('/_(jpe?g|gif|png)$/', '.\\1', $matches[5]);
    if ($matches[4] == 'square_') {
        $trim = 'square';
    } else {
        $trim = '';
    }
    $_GET['trim'] = $trim;
    /* OpenPNE2 スマートフォン対応：ここまで */
    $_GET['filename'] = $filename;
    $_GET['w'] = $w;
    $_GET['h'] = $h;
    $_GET['f'] = $f;
    require_once './img.php';
    exit;
} else {
    display_error_404();
}

function display_error_404()
{
    header('HTTP/1.0 404 Not Found');
    echo <<<EOD
<html><head><title>404 Not Found</title></head>
<body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
</body></html>
EOD;
    exit;
}

?>
