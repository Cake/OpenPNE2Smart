<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メンバー情報を取得する
 * 
 * @param int $c_member_id
 * @param bool $is_secure `c_member_secure`の項目を取得するかどうか
 * @param bool $with_profile `c_member_profile`の項目を取得するかどうか
 * @param string $public_flag プロフィール項目を取得する場合の公開設定(public, friend, private)
 * @return array メンバー情報
 */
function db_member_c_member4c_member_id($c_member_id, $is_secure = false, $with_profile = false, $public_flag = 'public')
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        return pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
    }

    $is_recurred = false;

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT *,case when access_date = '0001-01-01 00:00:00 BC' THEN '0000-00-00 00:00:00' ELSE to_char(access_date,'YYYY-MM-DD HH24:MI:SS') END as access_date" .
             " FROM c_member WHERE c_member_id = ?";
    } else {
        $sql = 'SELECT * FROM c_member WHERE c_member_id = ?';
    }

    $params = array(intval($c_member_id));
    if (!$c_member = db_get_row($sql, $params))
        return array();

    if ($is_secure) {
        $c_member['secure'] = db_member_c_member_secure4c_member_id($c_member_id);
    }

    if ($with_profile) {
        $c_member['profile'] = db_member_c_member_profile_list4c_member_id($c_member_id, $public_flag);

        // public_flag_birth_year
        switch ($c_member['public_flag_birth_year']) {
        case "friend":
            if ($public_flag == 'public')
                unset($c_member['birth_year']);
            break;
        case "private":
            if ($public_flag == 'public' || $public_flag == 'friend')
                unset($c_member['birth_year']);
            break;
        }
    }
    
    if (IS_SLAVEPNE && $is_secure) {
        $c_member['username'] = db_member_username4c_member_id($c_member_id);
    }

    return $c_member;
}

/**
 * メンバーのプロフィールを取得
 */
function db_member_c_member_profile_list4c_member_id($c_member_id, $public_flag = 'public')
{
    switch ($public_flag) {
    case "private":
        $flags = "'public', 'friend', 'private'";
        break;
    case "friend":
        $flags = "'public', 'friend'";
        break;
    case "public":
    default:
        $flags = "'public'";
        break;
    }

    $sql = 'SELECT cp.name, cp.caption, cp.form_type, cm.value, cm.public_flag' .
        ' FROM c_member_profile as cm, c_profile as cp' .
        ' WHERE cm.c_member_id = ?'.
            " AND cm.public_flag IN ($flags)" .
            ' AND cm.c_profile_id = cp.c_profile_id' .
        ' ORDER BY cp.sort_order, cm.c_member_profile_id';
    $profile = db_get_all($sql, array(intval($c_member_id)));

    $member_profile = array();
    foreach ($profile as $value) {
        $member_profile[$value['name']]['form_type'] = $value['form_type'];
        if ($value['form_type'] == 'checkbox') {
            $member_profile[$value['name']]['value'][] = $value['value'];
        } else {
            $member_profile[$value['name']]['value'] = $value['value'];
        }
        $member_profile[$value['name']]['caption'] = $value['caption'];
        $member_profile[$value['name']]['public_flag'] = $value['public_flag'];
    }

    return $member_profile;
}

/**
 * メンバーの暗号化された情報を復号化して取得
 */
function db_member_c_member_secure4c_member_id($c_member_id)
{
    $sql = 'SELECT pc_address, ktai_address, regist_address, easy_access_id, hashed_password, hashed_password_query_answer FROM c_member_secure WHERE c_member_id = ?';
    $c_member_secure = db_get_row($sql, array(intval($c_member_id)));
    
    if (is_array($c_member_secure)) {
        $c_member_secure['pc_address'] = t_decrypt($c_member_secure['pc_address']);
        $c_member_secure['ktai_address'] = t_decrypt($c_member_secure['ktai_address']);
        $c_member_secure['regist_address'] = t_decrypt($c_member_secure['regist_address']);
    }
    return $c_member_secure;
}

/**
 * メンバー情報をプロフィール付きで取得する
 * (secure情報は取得しない)
 * 
 * @param int $c_member_id
 * @param string $public_flag 取得するプロフィール項目の公開レベル(public, friend, private)
 * @return array メンバー情報
 */
function db_member_c_member_with_profile($c_member_id, $public_flag = 'public')
{
    return db_member_c_member4c_member_id($c_member_id, false, true, $public_flag);
}

/**
 * メンバー情報のよく使う部分のみを取得する
 * 
 * - メンバーID
 * - ニックネーム
 * - メイン画像
 * のみを取得する。
 * 
 * @param int $c_member_id
 * @return array メンバー情報
 */
function db_member_c_member4c_member_id_LIGHT($c_member_id)
{
    static $results;
    if (!isset($results[$c_member_id])) {
        $sql = 'SELECT c_member_id, nickname, image_filename FROM c_member WHERE c_member_id = ?';
        $results[$c_member_id] = db_get_row($sql, array(intval($c_member_id)));
    }
    return $results[$c_member_id];
}

/**
 * PCアドレスからメンバーIDを取得(ログインに必要)
 * 
 * @param   string $pc_address
 * @return  int    $c_member_id
 */
function db_member_c_member_id4pc_address($pc_address)
{
    return _db_c_member_id4pc_address_encrypted(t_encrypt($pc_address));
}

function db_member_c_member_id4pc_address_encrypted($pc_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE pc_address = ?';
    $params = array($pc_address_encoded);
    return db_get_one($sql, $params);
}

function db_member_c_member_id4ktai_address_encrypted($ktai_address_encoded)
{
    $sql = 'SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?';
    $params = array($ktai_address_encoded);
    return db_get_one($sql, $params);
}

/**
 * アクティブメンバーか？
 */
function db_member_is_active_c_member_id($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * セッションからc_member_preを返す
 */
function db_member_c_member_pre4c_member_pre_session($session)
{
    $sql = 'SELECT * FROM c_member_pre WHERE session = ?';
    $params = array($session);
    $c_member = db_get_row($sql, $params);

    //秘密の質問
    $c_password_query_id = $c_member['c_password_query_id'];
    $c_password_query_list = p_common_c_password_query4null();

    $c_member['c_password_query_name'] = $c_password_query_list["$c_password_query_id"];

    $sql = 'SELECT p.name, p.caption, p.form_type, m.value, m.public_flag' .
        ' FROM c_member_pre_profile AS m' .
             ' INNER JOIN c_profile AS p USING (c_profile_id)' .
        ' WHERE m.c_member_pre_id = ?' .
        ' ORDER BY p.sort_order, m.c_member_pre_profile_id';
    $params = array(intval($c_member['c_member_pre_id']));
    $profile = db_get_all($sql, $params);

    $member_profile = array();
    foreach ($profile as $value) {
        $member_profile[$value['name']]['form_type'] = $value['form_type'];
        if ($value['form_type'] == 'checkbox') {
            $member_profile[$value['name']]['value'][] = $value['value'];
        } else {
            $member_profile[$value['name']]['value'] = $value['value'];
        }
        $member_profile[$value['name']]['caption'] = $value['caption'];
        $member_profile[$value['name']]['public_flag'] = $value['public_flag'];
    }

    $c_member['profile'] = $member_profile;
    return $c_member;
}

function db_member_is_active_sid($sid)
{
    $sql = 'SELECT c_member_pre_id FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return (bool)db_get_one($sql, $params);
}

function db_member_search($cond, $cond_like, $page_size, $page, $c_member_id, $profiles)
{
    $page = intval($page);
    $page_size = intval($page_size);

    $where = " WHERE true";
    $params = array();

    foreach ($cond as $key => $value) {
        if ($value) {
            if ($key == 'image') {
                $where .= " AND image_filename <> ''";
            } else {
                $where .= " AND ". db_escapeIdentifier($key) ." = ?";
                $params[] = $value;
                if ($key == 'birth_year') {
                    $where .= " AND public_flag_birth_year = 'public'";
                }
            }
        }
    }
    foreach ($cond_like as $key => $value) {
        if ($value) {
            $where .= " AND " . db_escapeIdentifier($key) . " LIKE ?";
            $params[] = '%'.$value.'%';
        }
    }

    $from = " FROM c_member" . $hint;
    $order = " ORDER BY c_member_id DESC";
    $sql = "SELECT c_member_id" . $from . $where . $order;

    $result_ids = db_get_col($sql, $params);

    foreach ($profiles as $key => $value) {
        $sql = "SELECT c_member_id FROM c_member_profile";
        $sql .= " WHERE c_profile_id = ? AND public_flag = 'public'";
        $params = array(intval($value['c_profile_id']));

        if ($value['form_type'] == "text" || $value['form_type'] == "textlong" || $value['form_type'] == 'textarea') {
            $sql .= " AND value LIKE ?";
            $params[] = '%'.$value['value'].'%';
        } elseif (is_array($value['c_profile_option_id'])) {
            $values = implode(',', array_map('intval', $value['c_profile_option_id']));
            $sql .= " AND c_profile_option_id IN (". $values .")";
        } else {
            $sql .= " AND c_profile_option_id = ?";
            $params[] = intval($value['c_profile_option_id']);
        }
        $sql .= " ORDER BY c_member_id DESC";

        $ids = db_get_col($sql, $params);
        $result_ids = array_values(array_intersect($result_ids, $ids));
    }

    $start = ($page - 1) * $page_size;

    $list = array();
    for ($i = $start; $i < $start + $page_size && $result_ids[$i]; $i++) {
        $c_member = db_member_c_member_with_profile($result_ids[$i], 'public');
        $c_member['last_login'] = p_f_home_last_login4access_date($c_member['access_date']);
        $list[] = $c_member;
    }

    $total_num = count($result_ids);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = $page + 1;
        }
        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = $page - 1;
        }
    }
    return array($list, $prev, $next, $total_num);
}

function db_member_inviting_member4c_member_id($c_member_id)
{
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_id_invite = ? ORDER BY r_date DESC';
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

function db_member_birthday_flag4c_member_id($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id);
    $birthday = $c_member['birth_month'] . "-" . $c_member['birth_day'];

    return (bool)(date("n-j") == $birthday);
}

/**
 * あるメンバーがアクセスブロックしているメンバーIDのリストを取得
 */
function db_member_c_member_id_block4c_member_id($c_member_id)
{
    $sql = 'SELECT c_member_id_block FROM c_access_block WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_col($sql, $params);
}

/**
 * あるメンバーをアクセスブロックしているメンバーIDのリストを取得
 */
function db_member_access_block_list4c_member_id_to($c_member_id_to)
{
    $sql = 'SELECT c_member_id FROM c_access_block WHERE c_member_id_block = ?';
    $params = array(intval($c_member_id_to));
    return db_get_col($sql, $params);
}

/**
 * {c_member_id}が{target_...}にアクセスブロックされているかどうか
 */
function db_member_is_access_block($c_member_id, $target_c_member_id)
{
    $sql = 'SELECT c_access_block_id FROM c_access_block' .
            ' WHERE c_member_id = ? AND c_member_id_block = ?';
    $params = array(intval($target_c_member_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * 次の誕生日まであと何日？
 * 
 * @param int $c_member_id
 * @return int 日数(当日は0)
 */
function db_member_count_days_birthday4c_member_id($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id);
    return getCountdownDays($c_member['birth_month'], $c_member['birth_day']);
}

function db_member_search_check_profile($profile)
{
    $result_list = array();

    foreach ($profile as $key => $v) {
        if (!$v) continue;

        $sql = 'SELECT * FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);
        if (!($c_profile && $c_profile['disp_search'])) continue;

        $public_flags = array('public', 'friend', 'private');
        if (!$c_profile['public_flag_edit']
            && $c_profile['public_flag_default'] != 'public') {
            // 公開項目以外は除外
            continue;
        }

        switch ($c_profile['form_type']) {
        case "text":
        case "textarea":
            $value = $v;
            $c_profile_option_id = 0;
            break;
        case "select":
        case "radio":
            $value = "";
            $c_profile_option_id = $v;
            break;
        case "checkbox":
            $value = array();
            $c_profile_option_id = $v;
            break;
        default:
            break;
        }

        $result_list[$c_profile['name']] = array(
            "c_profile_id" => $c_profile['c_profile_id'],
            "c_profile_option_id" => $c_profile_option_id,
            "value" => $value,
            "form_type" => $c_profile['form_type'],
        );
    }

    return $result_list;
}

function db_member_count_c_member_profile()
{
    $sql = 'SELECT c_profile_option_id, COUNT(DISTINCT c_member_id)' .
        ' FROM c_member_profile' .
        ' WHERE public_flag = \'public\'' .
        ' AND c_profile_option_id > 0' .
        ' GROUP BY c_profile_option_id';
    return db_get_assoc($sql);
}

function db_member_birth4c_member_id($month, $day, $c_member_id)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        return pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
    }

    $is_recurred = false;


    $sql = "SELECT c_member_id_to FROM c_friend WHERE c_member_id_from = ?";
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids[] = $c_member_id;
    $ids = implode(", ", $ids);

    $sql = "SELECT * FROM c_member" .
        " WHERE c_member_id IN (". $ids . ")" .
        " AND birth_day = ?" .
        " AND birth_month = ?";
    $params = array(intval($day), intval($month));
    return db_get_all($sql, $params);
}

function db_member_c_member_list4exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss <> ''";
    return db_get_all($sql);
}

function db_member_c_member_list4no_exists_rss()
{
    $sql = "SELECT * FROM c_member WHERE rss = ''";
    return db_get_all($sql);
}

function db_member_c_profile_list4null()
{
    $hint = db_mysql_hint('FORCE INDEX (sort_order)');
    $sql = 'SELECT * FROM c_profile' . $hint . ' ORDER BY sort_order';
    return db_get_all($sql);
}

function db_member_c_profile_option_list4c_profile_id($c_profile_id)
{
    $sql = 'SELECT * FROM c_profile_option WHERE c_profile_id = ? ORDER BY sort_order';
    $params = array(intval($c_profile_id));
    return db_get_all($sql, $params);
}

function db_member_c_profile_list()
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        return pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
    }

    $is_recurred = false;

    $list = db_member_c_profile_list4null();

    $profile_list = array();
    foreach ($list as $value) {
        $profile_list[$value['name']] = $value;
        $profile_list[$value['name']]['options'] = db_member_c_profile_option_list4c_profile_id($value['c_profile_id']);
    }
    return $profile_list;
}

function db_member_main_image_filename_number($c_member_id)
{
    $c_member = db_member_c_member4c_member_id($c_member_id);
    if (empty($c_member['image_filename'])) {
        return 0;
    }

    if ($c_member['image_filename'] == $c_member['image_filename_1'])
        return 1;
    elseif ($c_member['image_filename'] == $c_member['image_filename_2'])
        return 2;
    elseif ($c_member['image_filename'] == $c_member['image_filename_3'])
        return 3;
    else
        return 0;
}

function db_member_c_member_pre4sid($sid)
{
    $sql = 'SELECT * FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_get_row($sql, $params);
}

function db_member_c_member_pre4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_pre WHERE pc_address = ?';
    $params = array($pc_address);
    return db_get_row($sql, $params);
}

function db_member_c_member4pc_address($pc_address)
{
    $sql = 'SELECT * FROM c_member_secure WHERE pc_address = ?';
    $params = array(t_encrypt($pc_address));
    return db_get_row($sql, $params);
}

function db_member_c_member_list4daily_news()
{
    $sql = 'SELECT c_member_id, is_receive_daily_news FROM c_member' .
            ' WHERE is_receive_daily_news > 0';
    return db_get_all($sql);
}

function db_member_c_member_list4birthday_mail()
{
    // この日が誕生日の人を対称にする
    $target_date = "+1 week";

    $timestamp = strtotime($target_date);
    $month = date("n", $timestamp);
    $day   = date("j", $timestamp);

    $sql = 'SELECT * FROM c_member WHERE birth_month = ? AND birth_day = ?';
    $params = array(intval($month), intval($day));
    return db_get_all($sql, $params);
}

/**
 * パスワードクエリが合っているか判定
 */
function db_member_is_password_query_complete($pc_address, $query_id, $query_answer)
{
    $sql = "SELECT c_member.c_member_id" .
        " FROM c_member, c_member_secure" .
        " WHERE c_member_secure.pc_address = ?" .
        " AND c_member.c_password_query_id = ?" .
        " AND c_member_secure.hashed_password_query_answer = ?" .
        " AND c_member.c_member_id = c_member_secure.c_member_id";
    $params = array(
        t_encrypt($pc_address),
        intval($query_id),
        md5($query_answer)
    );
    if ($c_member_id = db_get_one($sql, $params)) {
        return $c_member_id;
    }

    // 1.8以前との互換性を保つため、SJISでのチェックも行う
    $params = array(
        t_encrypt($pc_address),
        intval($query_id),
        md5(mb_convert_encoding($query_answer, 'SJIS-win', 'UTF-8'))
    );
    return db_get_one($sql, $params);
}

function db_member_c_member_id4ktai_address2($ktai_address)
{
    if (!$ktai_address) {
        return null;
    }

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ?";
    $params = array(t_encrypt($ktai_address));
    return db_get_one($sql, $params);
}

function db_member_inviting_member4c_member_id2($c_member_id)
{
    $sql = "SELECT * FROM c_member_ktai_pre WHERE c_member_id_invite = ?";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

/**
 * 対象のアドレスが、登録されてるか否か
 * 
 * @param string $mail_address
 * @param int $c_member_id チェックから除外するメンバーID
 */
function db_member_is_sns_join4mail_address($mail_address, $c_member_id = 0)
{
    $params = array(t_encrypt($mail_address), intval($c_member_id));

    $sql = "SELECT c_member_id FROM c_member_secure WHERE pc_address = ? AND c_member_id <> ?";
    $array = db_get_row($sql, $params);

    $sql = "SELECT c_member_id FROM c_member_secure WHERE ktai_address = ? AND c_member_id <> ?";
    $k_array = db_get_row($sql, $params);

    //対象のアドレスが登録済み
    if ($array['c_member_id'] || $k_array['c_member_id']) {
        return true;
    } else {
        return false;
    }
}

//対象のアドレスが、ドメイン制限に合致しているかどうか
function db_member_is_limit_domain4mail_address($mail_address)
{
    // メールアドレスとして正しくない
    if (!db_common_is_mailaddress($mail_address)) {
        return false;
    }

    // 携帯アドレスは制限しない
    if (is_ktai_mail_address($mail_address)) {
        return true;
    }

    //ドメイン未設定なら無条件でＯＫ
    if (LIMIT_DOMAIN1 == '' &&
        LIMIT_DOMAIN2 == '' &&
        LIMIT_DOMAIN3 == '' &&
        LIMIT_DOMAIN4 == '' &&
        LIMIT_DOMAIN5 == '' 
    ) {
        return true;
    }

    $arr = explode('@', $mail_address);
    $mail_domain = $arr[1];

    $domains = array(LIMIT_DOMAIN1,
                     LIMIT_DOMAIN2,
                     LIMIT_DOMAIN3,
                     LIMIT_DOMAIN4,
                     LIMIT_DOMAIN5,
               );

    foreach ($domains as $domain) {
        if ($domain) {
            $regexp = str_replace('\*', '.*', preg_quote($domain, '/'));
            if (preg_match(sprintf('/%s/', $regexp), $mail_domain)) {
                return true;
            }
        }
    }
    return false;
}
function db_member_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    return db_get_row($sql, $params);
}

/**
 * 携帯認証用
 */
function db_member_k_auth($c_member_id)
{
    $sql = 'SELECT c_member_id FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_member_k_auth_login($ktai_address, $password)
{
    if (!$ktai_address or !$password) {
        return false;
    }
    
    $c_member_id = db_member_c_member_id4username($ktai_address, true);
    $sql = "SELECT hashed_password FROM c_member_secure " .
            " WHERE c_member_id = ? ";
    if (md5($password) != db_get_one($sql, array($c_member_id))) {
        return false;
    }
    
    return $c_member_id;
}

function db_member_c_ktai_address_pre4session($session)
{
    $sql = 'SELECT * FROM c_ktai_address_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

function db_member_c_member_ktai_pre4session($session)
{
    $sql = 'SELECT * FROM c_member_ktai_pre WHERE session = ?';
    $params = array($session);
    return db_get_row($sql, $params);
}

/**
 * メンバーIDからハッシュ化されたパスワードを取得
 * (携帯の認証に暫定的に用いる)
 * 
 * @param int $c_member_id
 * @return string hashed password
 */
function db_member_hashed_password4c_member_id($c_member_id)
{
    $sql = 'SELECT hashed_password FROM c_member_secure WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_member_is_password_query_complete2($ktai_address, $query_id, $query_answer)
{
    $sql = "SELECT c_member.c_member_id" .
        " FROM c_member, c_member_secure" .
        " WHERE c_member_secure.ktai_address = ?" .
        " AND c_member.c_password_query_id = ?" .
        " AND c_member_secure.hashed_password_query_answer = ?" .
        " AND c_member.c_member_id = c_member_secure.c_member_id";
    $params = array(
        t_encrypt($ktai_address),
        intval($query_id),
        md5($query_answer)
    );
    if ($c_member_id = db_get_one($sql, $params)) {
        return $c_member_id;
    }

    // 1.8以前との互換性を保つため、SJISでのチェックも行う
    $params = array(
        t_encrypt($ktai_address),
        intval($query_id),
        md5(mb_convert_encoding($query_answer, 'SJIS-win', 'UTF-8'))
    );
    return db_get_one($sql, $params);
}

function db_member_c_member_id4easy_access_id($easy_access_id)
{
    if (!$easy_access_id) return false;

    $sql = 'SELECT c_member_id FROM c_member_secure WHERE easy_access_id = ?';
    $params = array(t_encrypt($easy_access_id));
    return db_get_one($sql, $params);
}

function db_member_check_profile($profile_list, $public_flag_list)
{
    $result_list = array();

    foreach ($profile_list as $key => $v) {
        $sql = 'SELECT c_profile_id, is_required, public_flag_edit, public_flag_default, form_type, name' .
                ' FROM c_profile WHERE name = ?';
        $params = array($key);
        $c_profile = db_get_row($sql, $params);

        switch ($c_profile['form_type']) {
        case 'text':
        case 'textlong':
        case 'textarea':
            $value = $v;
            $c_profile_option_id = 0;
            break;
        case 'select':
        case 'radio':
            $sql = 'SELECT value FROM c_profile_option' .
                    ' WHERE c_profile_option_id = ? AND c_profile_id = ?';
            $params = array(intval($v), intval($c_profile['c_profile_id']));
            $value = db_get_one($sql, $params);
            $c_profile_option_id = $v;
            break;
        case 'checkbox':
            $value = array();
            $c_profile_option_id = $v;
            if (!$v) break;

            $sql = "SELECT c_profile_option_id, value FROM c_profile_option" .
                " WHERE c_profile_option_id IN (". implode(",", array_map('intval', $v)). ")" .
                " AND c_profile_id = ?".
                " ORDER BY sort_order";
            $params = array(intval($c_profile['c_profile_id']));
            $list = db_get_all($sql, $params);
            foreach ($list as $item) {
                $value[$item['c_profile_option_id']] = $item['value'];
            }
            break;
        default:
            $value = '';
            $c_profile_option_id = 0;
            break;
        }

        $public_flags = array('public', 'friend', 'private');
        if ($c_profile['public_flag_edit']
            && in_array($public_flag_list[$key], $public_flags)) {
            $public_flag = $public_flag_list[$key];
        } else {
            $public_flag = $c_profile['public_flag_default'];
        }

        $result_list[$c_profile['name']] = array(
            'c_profile_id' => $c_profile['c_profile_id'],
            'c_profile_option_id' => $c_profile_option_id,
            'value' => $value,
            'public_flag' => $public_flag,
        );
    }

    return $result_list;
}

/**
 * すべてのメンバーのメンバーIDを取得
 */
function db_member_c_member_id_list4null()
{
    $sql = 'SELECT c_member_id FROM c_member';

    return db_get_col($sql);
}

function db_member_is_login_rejected($c_member_id)
{
    $sql = 'SELECT is_login_rejected FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * メンバーが忍び足(あしあとをつけない)状態かどうかを取得
 * 
 * @param   int $c_member_id
 * @return  bool
 */
function db_member_is_shinobiashi($c_member_id)
{
    $sql = "SELECT is_shinobiashi FROM c_member WHERE c_member_id = ?";
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/*** write ***/

//--- c_member

/**
 * プロフィール変更(c_memberテーブル分)
 */
function db_member_config_prof_new($c_member_id, $prof_list)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'nickname' => $prof_list['nickname'],
        'birth_year'  => intval($prof_list['birth_year']),
        'birth_month' => intval($prof_list['birth_month']),
        'birth_day'   => intval($prof_list['birth_day']),
        'public_flag_birth_year' => $prof_list['public_flag_birth_year'],
        'u_datetime' => db_now(),
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * アクセス日時を更新
 */
function db_member_do_access($c_member_id)
{
    $data = array('access_date' => db_now());
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

//(image)

/**
 * プロフィール画像の変更
 */
function db_member_config_image_new($c_member_id, $image_filename, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array('image_filename_'.intval($img_num) => $image_filename);
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * プロフィール画像の削除
 */
function db_member_delete_c_member_image_new($c_member_id, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'UPDATE c_member SET';
    if ($img_num == 1) {
        $sql .= ' image_filename_1 = image_filename_2,';
    }
    if ($img_num == 1 || $img_num == 2) {
        $sql .= ' image_filename_2 = image_filename_3,';
    }
    $sql .= ' image_filename_3 = \'\'';
    $sql .= ' WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

/**
 * メイン画像の変更
 */
function db_member_change_c_member_main_image($c_member_id, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $sql = 'UPDATE c_member SET image_filename = image_filename_'.intval($img_num).
        ' WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

/**
 * メイン画像を登録する
 */
function db_member_update_c_member_image($c_member_id, $image_filename, $img_num)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'image_filename' => $image_filename,
        'image_filename_'.intval($img_num) => $image_filename,
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member', $data, $where);
}

/**
 * 一言を更新する
 */
function db_member_update_c_profile_message($c_member_id, $prof_message, $message_datetime)
{
    $sql = 'SELECT c_profile_id FROM c_profile WHERE name = ? ';
    $prof_message_id = db_get_one($sql, array('PNE_MESSAGE'));
    $message_datetime_id = db_get_one($sql, array('PNE_MESSAGE_DATETIME'));
    
	//function cache削除
    cache_drop_c_member_profile($c_member_id);
    
    $sql = 'DELETE FROM c_member_profile' .
            ' WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), $prof_message_id);
    db_query($sql, $params);
    do_config_prof_insert_c_member_profile($c_member_id, $prof_message_id, '', $prof_message, 'private');
    
    $sql = 'DELETE FROM c_member_profile' .
            ' WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), $message_datetime_id);
    db_query($sql, $params);
    do_config_prof_insert_c_member_profile($c_member_id, $message_datetime_id, '', $message_datetime, 'private');
}

//--- c_member_secure

function db_member_insert_c_member($c_member, $c_member_secure)
{
    if ($c_member_secure['pc_address'] && !util_is_regist_mail_address($c_member_secure['pc_address'])) {
        return false;
    }
    if ($c_member_secure['ktai_address'] && !util_is_regist_mail_address($c_member_secure['ktai_address'])) {
        return false;
    }
    if (!util_is_regist_mail_address($c_member_secure['regist_address'])) {
        return false;
    }

    $data = array(
        'nickname'    => $c_member['nickname'],
        'birth_year'  => $c_member['birth_year'],
        'birth_month' => $c_member['birth_month'],
        'birth_day'   => $c_member['birth_day'],
        'public_flag_birth_year' => $c_member['public_flag_birth_year'],
        'c_member_id_invite'  => intval($c_member['c_member_id_invite']),
        'c_password_query_id' => intval($c_member['c_password_query_id']),
        'is_receive_mail' => (bool)$c_member['is_receive_mail'],
        'is_receive_ktai_mail'  => (bool)$c_member['is_receive_ktai_mail'],
        'is_receive_daily_news' => intval($c_member['is_receive_daily_news']),
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id = db_insert('c_member', $data);

    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'hashed_password' => md5($c_member_secure['password']),
        'hashed_password_query_answer' => md5($c_member_secure['password_query_answer']),
        'pc_address'     => t_encrypt($c_member_secure['pc_address']),
        'ktai_address'   => t_encrypt($c_member_secure['ktai_address']),
        'regist_address' => t_encrypt($c_member_secure['regist_address']),
        'easy_access_id' => '',
    );
    db_insert('c_member_secure', $data);

    return $c_member_id;
}

function db_member_ktai_insert_c_member($profs)
{
    if (!util_is_regist_mail_address($profs['ktai_address'])) {
        return false;
    }

    $data = array(
        'nickname' => $profs['nickname'],
        'birth_year' => intval($profs['birth_year']),
        'birth_month' => intval($profs['birth_month']),
        'birth_day' => intval($profs['birth_day']),
        'public_flag_birth_year' => $profs['public_flag_birth_year'],
        'r_date' => db_now(),
        'is_receive_ktai_mail' => 1,
        'c_member_id_invite' => intval($profs['c_member_id_invite']),
        'c_password_query_id' => intval($profs['c_password_query_id']),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id_new = db_insert('c_member', $data);

    $data = array(
        'c_member_id' => intval($c_member_id_new),
        'hashed_password' => md5($profs['password']),
        'hashed_password_query_answer' => md5($profs['password_query_answer']),
        'pc_address' => '',
        'ktai_address' => t_encrypt($profs['ktai_address']),
        'regist_address' => t_encrypt($profs['ktai_address']),
        'easy_access_id' => '',
    );
    db_insert('c_member_secure', $data);

    return $c_member_id_new;
}

function db_member_h_config_3(
                $c_member_id,
                $is_receive_mail,
                $rss,
                $ashiato_mail_num,
                $is_receive_daily_news,
                $c_password_query_id,
                $c_password_query_answer,
                $public_flag_diary,
                $is_shinobiashi,
                $schedule_start_day)
{
    //function cacheの削除
    cache_drop_c_member_profile($c_member_id);
    
    $data = array(
        'is_receive_mail' => (bool)$is_receive_mail,
        'is_receive_daily_news' => intval($is_receive_daily_news),
        'rss' => $rss,
        'ashiato_mail_num' => intval($ashiato_mail_num),
        'c_password_query_id' => intval($c_password_query_id),
        'public_flag_diary' => util_cast_public_flag_diary($public_flag_diary),
        'is_shinobiashi' => $is_shinobiashi,
        'schedule_start_day' => $schedule_start_day,
        'u_datetime' => db_now(),
    );
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    if (!empty($c_password_query_answer)) {
        $data = array(
            'hashed_password_query_answer' => md5($c_password_query_answer)
        );
        db_update('c_member_secure', $data, $where);
    }
}

function db_member_update_easy_access_id($c_member_id, $easy_access_id)
{
    $data = array('easy_access_id' => t_encrypt($easy_access_id));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

function db_member_update_password_query($c_member_id, $c_password_query_id, $password_query_answer)
{
    $data = array('c_password_query_id' => intval($c_password_query_id));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);

    $data = array('hashed_password_query_answer' => md5($password_query_answer));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member_secure', $data, $where);
}

//(pc_address)

function db_member_update_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    $data = array('pc_address' => t_encrypt($pc_address));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

function db_member_regist_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    $data = array(
    'pc_address' => t_encrypt($pc_address),
    'regist_address' => t_encrypt($pc_address),
    );
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(ktai_address)

function db_member_update_ktai_address($c_member_id, $ktai_address)
{
    if ($ktai_address == ''){
        $data = array(
            'ktai_address' => t_encrypt($ktai_address),
            'easy_access_id' => t_encrypt(''),
        );
    } else {
        $data = array('ktai_address' => t_encrypt($ktai_address));
    }
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//(password)

function db_member_update_password($c_member_id, $password)
{
    $data = array('hashed_password' => md5($password));
    $where = array('c_member_id' => intval($c_member_id));
    return db_update('c_member_secure', $data, $where);
}

//--- c_pc_address_pre

function db_member_h_config_1($c_member_id, $pc_address)
{
    $insert_id = 0;
    $session = create_hash();

    // 既にpreに存在するアドレスかどうか
    if (do_common_c_pc_address_pre4pc_address($pc_address)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $where = array('pc_address' => $pc_address);
        db_update('c_pc_address_pre', $data, $where);
    } else {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'pc_address' => $pc_address,
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $insert_id = db_insert('c_pc_address_pre', $data);
    }

    do_h_config_1_mail_send($c_member_id, $session, $pc_address);
    return $insert_id;
}

function db_member_h_regist_mail($c_member_id, $pc_address)
{
    $insert_id = 0;
    $session = create_hash();

    // 既にpreに存在するアドレスかどうか
    if (do_common_c_pc_address_pre4pc_address($pc_address)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $where = array('pc_address' => $pc_address);
        db_update('c_pc_address_pre', $data, $where);
    } else {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'pc_address' => $pc_address,
            'session' => $session,
            'r_datetime' => db_now(),
        );
        $insert_id = db_insert('c_pc_address_pre', $data);
    }

    do_h_regist_mail_mail_send($c_member_id, $session, $pc_address);
    return $insert_id;
}

function db_member_delete_c_pc_address_pre4sid($sid)
{
    $sql = 'DELETE FROM c_pc_address_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

function db_member_change_mail($sid, $password)
{
    if (!$c_pc_address_pre = do_common_c_pc_address_pre4sid($sid)) {
        return false;
    }

    $c_member_id = $c_pc_address_pre['c_member_id'];
    $pc_address = $c_pc_address_pre['pc_address'];

    if (!db_common_authenticate_password($c_member_id, $password)) {
        return false;
    }

    db_member_update_c_member_pc_address4c_member_id($c_member_id, $pc_address);
    db_member_delete_c_pc_address_pre4sid($sid);
    return true;
}

function db_member_regist_mail($sid, $password)
{
    if (!$c_pc_address_pre = do_common_c_pc_address_pre4sid($sid)) {
        return false;
    }

    $c_member_id = $c_pc_address_pre['c_member_id'];
    $pc_address = $c_pc_address_pre['pc_address'];

    if (!db_common_authenticate_password($c_member_id, $password)) {
        return false;
    }

    db_member_regist_c_member_pc_address4c_member_id($c_member_id, $pc_address);
    db_member_delete_c_pc_address_pre4sid($sid);
    return true;
}

//--- c_ktai_address_pre

/**
 * 携帯アドレス変更
 */
function db_member_insert_c_ktai_address_pre($c_member_id, $session, $ktai_address)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'session' => $session,
        'ktai_address' => $ktai_address,
        'r_datetime' => db_now(),
    );
    return db_insert('c_ktai_address_pre', $data);
}

function db_member_delete_ktai_address_pre($c_ktai_address_pre_id)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE c_ktai_address_pre_id = ?';
    $params = array(intval($c_ktai_address_pre_id));
    db_query($sql, $params);
}

function db_member_delete_c_ktai_address_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_ktai_address_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

//--- c_member_pre

/**
 * 招待メール送信
 */
function db_member_insert_c_invite($c_member_id_invite, $pc_address, $message, $session)
{
    $data = array(
        'pc_address' => $pc_address,
        'regist_address' => $pc_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'r_date' => db_now(),
        'nickname' => '',
        'password' => '',
        'ktai_address' => '',
        'easy_access_id' => '',
        'c_password_query_answer' => '',
    );
    return db_insert('c_member_pre', $data);
}

/**
 * 招待メール送信
 */
function db_member_update_c_invite($c_member_id_invite, $pc_address, $message, $session)
{
    $data = array(
        'c_member_id_invite' => intval($c_member_id_invite),
        'session' => $session,
        'regist_address' => $pc_address,
        'r_date' => db_now(),
    );
    $where = array('pc_address' => $pc_address);
    return db_update('c_member_pre', $data, $where);
}

function db_member_delete_c_member_pre($c_member_id, $delete_c_member_ids)
{
    if (!(is_array($delete_c_member_ids) && $delete_c_member_ids)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_pre WHERE c_member_id_invite = ?'.
            ' AND c_member_pre_id IN ('.$ids.')';
    $params =  array(intval($c_member_id));
    db_query($sql, $params);
}

function db_member_delete_c_member_pre4sid($sid)
{
    $sql = 'DELETE FROM c_member_pre WHERE session = ?';
    $params = array($sid);
    return db_query($sql, $params);
}

//--- c_member_ktai_pre

function db_member_delete_c_member_ktai_pre($c_member_id, $delete_c_member_ids)
{
    if (!is_array($delete_c_member_ids) && $delete_c_member_ids) {
        return false;
    }
    $ids = implode(',', array_map('intval', $delete_c_member_ids));

    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_id_invite = ?' .
            ' AND c_member_ktai_pre_id IN ('.$ids.')';
    $params = array(intval($c_member_id));
    db_query($sql, $params);
}

function db_member_delete_c_member_ktai_pre4id($c_member_ktai_pre_id)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_ktai_pre_id = ?';
    $params = array(intval($c_member_ktai_pre_id));
    db_query($sql, $params);
}

/**
 * c_member_ktai_preを更新
 */
function db_member_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    $data = array(
        'session' => $session,
        'r_datetime' => db_now(),
        'c_member_id_invite' => intval($c_member_id_invite),
    );
    $where = array('ktai_address' => $ktai_address);
    return db_update('c_member_ktai_pre', $data, $where);
}

function db_member_delete_c_member_ktai_pre4ktai_address($ktai_address)
{
    $sql = 'DELETE FROM c_member_ktai_pre WHERE ktai_address = ?';
    $params = array($ktai_address);
    db_query($sql, $params);
}

function db_member_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    $data = array(
        'session' => $session,
        'ktai_address' => $ktai_address,
        'c_member_id_invite' => intval($c_member_id_invite),
        'r_datetime' => db_now(),
    );
    return db_insert('c_member_ktai_pre', $data);
}

//--- profile関連

function db_member_c_profile4name($name)
{
    $sql = 'SELECT * FROM c_profile WHERE name = ?';
    return db_get_row($sql, array($name));
}

function db_member_update_c_member_profile($c_member_id, $c_member_profile_list)
{
    //function cache削除
    cache_drop_c_member_profile($c_member_id);

    foreach ($c_member_profile_list as $item) {
        $sql = 'DELETE FROM c_member_profile' .
                ' WHERE c_member_id = ? AND c_profile_id = ?';
        $params = array(intval($c_member_id), intval($item['c_profile_id']));
        db_query($sql, $params);

        if (!(is_null($item['value']) || $item['value'] === '')) {
            if (is_array($item['value'])) {
                foreach ($item['value'] as $key => $value) {
                    do_config_prof_insert_c_member_profile($c_member_id, $item['c_profile_id'], $key, $value, $item['public_flag']);
                }
            } else {
                do_config_prof_insert_c_member_profile($c_member_id, $item['c_profile_id'], $item['c_profile_option_id'], $item['value'], $item['public_flag']);
            }
        }
    }
}

function db_member_insert_c_member_profile($c_member_id, $c_profile_id, $c_profile_option_id, $value, $public_flag)
{
    //function cache削除
    cache_drop_c_member_profile($c_member_id);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_profile_id' => intval($c_profile_id),
        'c_profile_option_id' => intval($c_profile_option_id),
        'value' => $value,
        'public_flag' => $public_flag,
    );
    return db_insert('c_member_profile', $data);
}

//--- c_access_block

function db_member_insert_c_access_block($c_member_id, $c_member_id_block)
{
    // 存在するIDのみを抽出
    $c_member_id_block = db_member_filter_c_access_block_id($c_member_id, $c_member_id_block);

    $sql = 'DELETE FROM c_access_block WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    db_query($sql, $params);

    foreach ($c_member_id_block as $id) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_member_id_block' => intval($id),
            'r_datetime' => db_now(),
        );
        db_insert('c_access_block', $data);
    }
}

function db_member_filter_c_access_block_id($c_member_id, $c_member_id_block)
{
    $c_member_id_block = array_unique(array_map('intval', $c_member_id_block));
    if (!$c_member_id_block) {
        return array();
    }
    $ids = implode(',', $c_member_id_block);
    $sql = 'SELECT c_member_id FROM c_member WHERE (c_member_id IN ('.$ids.')) AND (c_member_id <> ?) ';
    return db_get_col($sql, array($c_member_id));
}

//---

function db_member_update_mail_receive($c_member_id, $is_receive_ktai_mail)
{
    $data = array('is_receive_ktai_mail' => intval($is_receive_ktai_mail));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_update_ashiato_mail_num($c_member_id, $ashiato_mail_num)
{
    $data = array('ashiato_mail_num' => intval($ashiato_mail_num));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_update_public_flag_diary($c_member_id, $public_flag_diary)
{
    $data = array('public_flag_diary' => util_cast_public_flag_diary($public_flag_diary));
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_member', $data, $where);
}

function db_member_insert_username($c_member_id, $username)
{
    $data = array(
    "c_member_id"=>$c_member_id,
    "username"=>$username,
    );
    db_insert('c_username', $data);
}

/**
 * ログインIDからc_member_idを取得
 */
function db_member_c_member_id4username($username, $is_ktai = false)
{
    if (IS_SLAVEPNE) {
        $sql = 'SELECT c_member_id FROM c_username WHERE username = ?';
        $params = array($username);
        $c_member_id = db_get_one($sql, $params);
    } else {
        if ($is_ktai) {
            $c_member_id = db_member_c_member_id4ktai_address2($username);
        } else {
            $c_member_id = db_member_c_member_id4pc_address($username);
        }
    }
    return $c_member_id;
}

/**
 * ログインIDからc_member_idを取得
 * 暗号化されたメールアドレスの場合は復号化する
 */
function db_member_c_member_id4username_encrypted($username, $is_ktai = false)
{
    if (!IS_SLAVEPNE) {
        $username = t_decrypt($username);
    }
    return db_member_c_member_id4username($username, $is_ktai);
}

/**
 * ログインIDからc_member_idを取得
 */
function db_member_username4c_member_id($c_member_id, $is_ktai = false)
{
    if (IS_SLAVEPNE) {
        $sql = 'SELECT username FROM c_username WHERE c_member_id = ?';
        $params = array($c_member_id);
        $username = db_get_one($sql, $params);
    } else {
        $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);
        if ($is_ktai) {
            $username = $c_member_secure['ktai_address'];
        } else {
            $username = $c_member_secure['pc_address'];
        }
    }
    return $username;
}

/**
 * ログインしたメンバーの情報が存在しない場合自動で生成
 */
function db_member_create_member($username)
{
    $data = array(
        'nickname'    => "NO NAME",
        'birth_year'  => 0,
        'birth_month' => 0,
        'birth_day'   => 0,
        'public_flag_birth_year' => "public",
        'c_member_id_invite'  => 1,
        'c_password_query_id' => 0,
        'is_receive_mail' => true,
        'is_receive_ktai_mail'  => true,
        'is_receive_daily_news' => true,
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'image_filename' => '',
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'rss' => '',
    );
    $c_member_id = db_insert('c_member', $data);
    
    $data = array(
        'c_member_id' => intval($c_member_id),
        'hashed_password' => "",
        'hashed_password_query_answer' => "",
        'pc_address'     => "",
        'ktai_address'   => "",
        'regist_address' => "",
        'easy_access_id' => '',
    );
    db_insert('c_member_secure', $data);
    
    $data = array(
        'c_member_id' => intval($c_member_id),
        'username' => $username,
    );
    db_insert('c_username', $data);
}

/**
 * プロフィールに必須項目が入力されているかを返す。
 * 0:入力済み
 * 1:プロフィール未入力
 * 2:メールアドレス未登録
 */
function db_member_check_param_inputed($c_member_id, $is_ktai = false)
{
    $c_member = db_member_c_member4c_member_id($c_member_id, true);
    
    if (($c_member['nickname']==="")
    ||($c_member['birth_year']==="")
    ||($c_member['birth_month']==="")
    ||($c_member['birth_day']==="")
    ||($c_member['c_password_query_id']==="")
    ||($c_member['secure']['hashed_password_query_answer']==="")
    ) {
        return 1;
    }
    
    
    if ($c_member['secure']['pc_address']==="" && !$is_ktai) {
        return 2;
    }
    if ($c_member['secure']['ktai_address']==="" && $is_ktai) {
        return 2;
    }
    
    return 0;
}
            

?>
