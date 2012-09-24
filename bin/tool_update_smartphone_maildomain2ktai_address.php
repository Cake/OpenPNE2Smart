<?php

chdir(dirname(__FILE__));
require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

/**
 * ライブラリ読み込み
 */
require_once 'Log.php';

/* 
 * ktai_addressに登録するメールドメイン
 */
$smartphone_maildomain = array(
    'i.softbank.jp',
);

/* 
 * 変換開始
 */
m_debug_log("Convert Smartphone Maildomain --- Start");

// 全メンバー取得
$c_member_ids = db_member_c_member_id_list4null();

if ($c_member_ids) {
    foreach ($c_member_ids as $c_member_id) {
        $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);

        $pieces = explode('@', $c_member_secure['pc_address']);
        $domain = array_pop($pieces);

        if (in_array($domain, $smartphone_maildomain)) {
            // 対象のアドレスをktai_addressに登録
            db_member_update_ktai_address($c_member_id, $c_member_secure['pc_address']);

            // pc_addressを消す
            db_member_delete_c_member_pc_address4c_member_id($c_member_id);

            // ログ出力
            m_debug_log("Convert Smartphone Maildomain --- c_member_id : $c_member_id, address: ". $c_member_secure['pc_address']. "\n");
        }
    }
}

m_debug_log("Convert Smartphone Maildomain --- END");
exit;



/**
 * ログ
 */
function m_debug_log($msg, $priority =  PEAR_LOG_WARNING)
{
    if (!MAIL_DEBUG_LOG) return;

    $log_path = OPENPNE_VAR_DIR . '/log/mail.log';
    $file =& Log::singleton('file', $log_path, 'MAIL');

    mb_convert_encoding($msg, 'JIS', 'auto');
    $file->log($msg, $priority);
}

/* 
 * pc_address削除
 */
function db_member_delete_c_member_pc_address4c_member_id($c_member_id)
{
    // function cacheを削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('pc_address' => "");
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}
