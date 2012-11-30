<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_SmartPhoneUA
{
    var $is_smart = false;
    var $is_tablet = false;

    var $is_android = false;
    var $is_apple = false;

    var $is_ktaiaddress_login = false;

    /**
     * constructor
     */
    function OpenPNE_SmartPhoneUA($server = null)
    {
        if (is_null($server)) {
            $server = $_SERVER;
        }
        $this->classify($server);
    }

    /**
     * User-Agent の値からキャリア情報を判別する
     */
    function classify($server)
    {
        $ua = $server['HTTP_USER_AGENT'];
        /* Android */
        if (strpos($ua, 'Android', 7) !== false) {
            $this->is_android = true;
        
            if (strpos($ua, 'Mobile', 6) !== false) {
                $this->is_smart = true;
            } else {
                $this->is_tablet = true;
            }
        }

        /* Apple製品 */
        // iPhone/iPod
        if (strpos($ua, 'iPhone', 6) !== false || strpos($ua, 'iPod', 4) !== false) {
            $this->is_apple = true;
            $this->is_smart = true;
        }

        // iPad
        if (strpos($ua, 'iPad', 4) !== false) {
            $this->is_apple = true;
            $this->is_tablet = true;
        }

        /* BlackBerry(Docomo) */
        if (strpos($ua, 'BlackBerry', 10) !== false) {
                $this->is_smart = true;
        }

        /* Windows mobile */
        if (strpos($ua, 'IEMobile', 8) !== false) {
                $this->is_smart = true;
        }
    }

    function is_smart() { return $this->is_smart; }
    function is_tablet() { return $this->is_tablet; }
    function is_android() { return $this->is_android; }
    function is_apple() { return $this->is_apple; }

    function set_ktaiaddress($param = true) {
        $this->is_ktaiaddress_login = $param;
    }
    function is_ktaiaddress() {
        return $this->is_ktaiaddress_login;
    }
}

