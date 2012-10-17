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

class pc_page_h_manage_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $page = $requests['page'];
        $size = 20;

        list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($u, $page, $size);

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('c_commu_list', $c_commu_list);
        $this->set('pager', $pager);
        $this->set('page', $page);

        /* OpenPNE2 スマートフォン対応：ここから */
        $total_page_num =  ceil($list[3] / $size);
        $this->set("total_page_num", $total_page_num);
        /* OpenPNE2 スマートフォン対応：ここまで */

        return 'success';
    }
}

?>
