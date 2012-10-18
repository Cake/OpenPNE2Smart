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
 * 参加コミュ管理をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_manage_commu_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $page = $requests['page'];
        $size = 20;

        list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($u, $page, $size);

	// テンプレート出力
	$arr = array(
        	'list' => $c_commu_list,
        	'page' => $page,
        	'pager' => $pager,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_manage_commu_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
