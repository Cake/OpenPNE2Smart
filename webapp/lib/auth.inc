<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Auth.php';

/* OpenPNE2 スマートフォン対応：ここから */
$smartPhone = new OpenPNE_SmartPhoneUA();
/* OpenPNE2 スマートフォン対応：ここまで */

$config = get_auth_config();
$auth = new OpenPNE_Auth($config);
$auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
$auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

/* OpenPNE2 スマートフォン対応：ここから */
/* 【auth.inc認証共通化】OpenPNE2 スマートフォン対応コメントアウト：ここから
if (!$auth->auth()
    || !($u = db_member_c_member_id4username_encrypted($auth->getUsername(), false))
    || db_member_is_login_rejected($u)
    || db_member_is_blacklist($u)
    || !db_member_is_one_session_per_user($u, session_id())) {
   OpenPNE2 スマートフォン対応コメントアウト：ここまで*/

// PCアドレスでまず認証
if (!$u = __auth_inc_check($auth)) { // 認証共通化
    // 失敗の場合
    // スマートフォンなら携帯アドレスで再ログイン
    // slavepneとpneid除く
    if ($smartPhone->is_smart
        && OPENPNE_AUTH_MODE != 'slavepne'
        && OPENPNE_AUTH_MODE != 'pneid'
        ) {
        unset($auth);

        $config['options']['usernamecol'] = 'ktai_address';

        $auth = new OpenPNE_Auth($config);
        $auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

        // 再認証
        if (!$u = __auth_inc_check($auth, true)) {
            // ログアウト
            __auth_inc_logout($auth); // ログアウト共通化
        }

        $smartPhone->set_ktaiaddress(true);
    } else {
        // ログアウト
        __auth_inc_logout($auth);
    }
/* 【auth.incログアウト共通化】OpenPNE2 スマートフォン対応コメントアウト：ここから
    $auth->logout();

    if (LOGIN_URL_PC) {
        client_redirect_absolute(get_login_url());
    } else {
        $parts = explode('/', $_SERVER['SCRIPT_NAME']);
        $_REQUEST['login_params'] = $_SERVER['QUERY_STRING'];
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = array('login_params' => $_SERVER['QUERY_STRING']);
        } else {
            $_GET = array('login_params' => $_SERVER['QUERY_STRING']);
        }
        openpne_forward('pc', 'page', "o_login");
        exit;
    }
   OpenPNE2 スマートフォン対応コメントアウト：ここまで */
    /* OpenPNE2 スマートフォン対応：ここまで */
}

$auth->uid($u);
$GLOBALS['AUTH'] = $auth;

// ログインモードが email でない場合、ログインに必要な情報が入力されているかどうかをチェックする
if (OPENPNE_AUTH_MODE != 'email' && empty($_SESSION['regist_step'])) {
    $current_page = $GLOBALS['__Framework']['current_type'] . '_' . $GLOBALS['__Framework']['current_action'];

    // プロフィールが未登録の場合でもアクセスすることのできるアクション
    $prof_ext_page = array(
        'do_h_regist_prof',
        'page_h_regist_prof',
        'do_inc_page_header_logout',
        'page_h_regist_intro',
    );

    // メールアドレスが未登録の場合でもアクセスすることのできるアクション
    $mail_ext_page = array(
        'do_h_regist_address',
        'page_h_regist_address',
        'do_inc_page_header_logout',
    );

    $is_registered_profile = db_member_is_registered_nickname_birth_day($u);
    $is_registered_profile_action = in_array($current_page, $prof_ext_page);

    $is_registered_address = db_member_is_pc_address_registered($u);
    $is_registered_address_action = in_array($current_page, $mail_ext_page);

    if ($is_registered_profile && $is_registered_address) {
        $_SESSION['regist_step'] = true;
    } elseif ($is_registered_address && OPENPNE_AUTH_MODE == 'pneid') {
        $_SESSION['regist_step'] = true;
    } else {
        $_SESSION['regist_step'] = false;
    }

    if (!$is_registered_profile_action && !$is_registered_address_action) {
        // プロフィールが未登録
        if (!$is_registered_profile && OPENPNE_AUTH_MODE == 'slavepne') {
            openpne_redirect('pc', 'page_h_regist_intro');
        }

        // メールアドレスが未登録
        if (!$is_registered_address) {
            /* OpenPNE2 スマートフォン対応：ここから */
            if ($module == 'pc' && $smartPhone->is_smart) {
                // スマートフォンの場合携帯アドレス登録チェック
                $is_registered_ktai_address = db_member_is_ktai_address_registered($u);
                if (!$is_registered_ktai_address) {
                    openpne_redirect('pc', 'page_h_regist_address');
                }
            } else {
                openpne_redirect('pc', 'page_h_regist_address');
            }
//            openpne_redirect('pc', 'page_h_regist_address');
            /* OpenPNE2 スマートフォン対応：ここまで */
        }

    }

}

// 秘密の質問の設定が有効な状態で、秘密の質問を設定していない場合、秘密の質問の入力をチェックする
if (IS_PASSWORD_QUERY_ANSWER == 2 && OPENPNE_AUTH_MODE != 'slavepne' && empty($_SESSION['is_password_query_answer'])) {
    $current_page = $GLOBALS['__Framework']['current_type'] . '_' . $GLOBALS['__Framework']['current_action'];

    // 秘密の質問が未登録の場合でもアクセスすることのできるアクション
    $password_query_answer_ext_page = array(
        'do_h_config_3',
        'page_h_config',
        'do_inc_page_header_logout',
    );

    $is_registered_password_query_answer = db_member_is_registered_password_query_answer($u);
    $is_registered_password_query_answer_action = in_array($current_page, $password_query_answer_ext_page);

    if ($is_registered_password_query_answer) {
        $_SESSION['is_password_query_answer'] = true;
    } else {
        $_SESSION['is_password_query_answer'] = false;
    }

    if (!$is_registered_password_query_answer_action) {
        // 秘密の質問が未登録
        if (!$is_registered_password_query_answer) {
            $p = array("msg" => "秘密の質問を登録してください");
            openpne_redirect('pc', 'page_h_config', $p);
        }
    }
}

/* 共通関数 */
/* 認証
 引数：$auth
       $is_ktaiaddress_login : 携帯アドレスでのログインか否か
 return : $u(閲覧者の$c_member_id)
 */
function __auth_inc_check(&$auth, $is_ktaiaddress_login = false) {
    if (!$auth->auth()
        || !($u = db_member_c_member_id4username_encrypted($auth->getUsername(), $is_ktaiaddress_login))
        || db_member_is_login_rejected($u)
        || db_member_is_blacklist($u)
        || !db_member_is_one_session_per_user($u, session_id())) {
            return false;
        } else {
            return $u;
        }
}


/* ログアウト処理
 引数：auth
 return : なし(リダイレクト)
 */
function __auth_inc_logout(&$auth) {
    $auth->logout();

    if (LOGIN_URL_PC) {
        client_redirect_absolute(get_login_url());
    } else {
        $parts = explode('/', $_SERVER['SCRIPT_NAME']);
        $_REQUEST['login_params'] = $_SERVER['QUERY_STRING'];
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = array('login_params' => $_SERVER['QUERY_STRING']);
        } else {
            $_GET = array('login_params' => $_SERVER['QUERY_STRING']);
        }
        openpne_forward('pc', 'page', "o_login");
        exit;
    }
}

?>
