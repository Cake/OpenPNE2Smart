<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_login extends OpenPNE_Action
{
    var $_auth;
    var $_lc;
    var $_login_params;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $this->_login_params = $requests['login_params'];
        $config = get_auth_config();

        /* OpenPNE2 スマートフォン対応：ここから */
        $smartPhone = new OpenPNE_SmartPhoneUA();

        // 携帯アドレスでのログイン
        if ($smartPhone->is_smart 
            && db_common_is_mailaddress($_POST['username']) && is_ktai_mail_address($_POST['username'])
            && OPENPNE_AUTH_MODE != 'slavepne'
            && OPENPNE_AUTH_MODE != 'pneid'
        ) {
            $smartPhone->set_ktaiaddress(true);
            $config['options']['usernamecol'] = 'ktai_address';

        }
        /* OpenPNE2 スマートフォン対応：ここまで */

        $auth = new OpenPNE_Auth($config);
        $this->_auth =& $auth;
        $auth->setExpire($GLOBALS['OpenPNE']['common']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['common']['session_idletime']);

        // 現在のセッションを削除
        $auth->logout();

        if (LOGIN_CHECK_ENABLE) {
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
                'check_num'   => LOGIN_CHECK_NUM,
                'check_time'  => LOGIN_CHECK_TIME,
                'reject_time' => LOGIN_REJECT_TIME,
            );
            $this->_lc =& new OpenPNE_LoginChecker($options);
        }

        if (!$auth->login($requests['is_save'])) {
            $this->_fail_login();
        }

        if (LOGIN_CHECK_ENABLE && $this->_lc->is_rejected()) {
            $this->_fail_login();
        }

        /* OpenPNE2 スマートフォン対応：ここから */
        $c_member_id = db_member_c_member_id4username_encrypted($auth->getUsername(), $smartPhone->is_ktaiaddress());
//        $c_member_id = db_member_c_member_id4username_encrypted($auth->getUsername(), false);
        /* OpenPNE2 スマートフォン対応：ここまで */
        if (OPENPNE_AUTH_MODE == 'slavepne' && !$c_member_id) {
            $c_member_id = db_member_create_member($_POST['username']);
        }
        if (!$c_member_id) {
            $this->_fail_login();
        }

        if (OPENPNE_ONE_SESSION_PER_USER) {
            db_member_update_c_member_secure_insert_sess_id($c_member_id, session_id());
        }

        if (db_member_is_login_rejected($c_member_id)) {
            $this->_fail_login('login_rejected');
        }
        if (db_member_is_blacklist($c_member_id)) {
            $this->_fail_login('login_rejected');
        }

        db_member_do_access($c_member_id);
        db_api_update_token($c_member_id);

        $url = OPENPNE_URL;
        if ($this->_login_params) {
            $url .= '?' . $this->_login_params;
        }
        client_redirect_absolute($url);
    }

    function _fail_login($msg_code = 'login_failed')
    {
        if (LOGIN_CHECK_ENABLE) {
            $this->_lc->fail_login();
        }
        $this->_auth->logout();
        $p = array('msg_code' => $msg_code, 'login_params' => $this->_login_params);
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
