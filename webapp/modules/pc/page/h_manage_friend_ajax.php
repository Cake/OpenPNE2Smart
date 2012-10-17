<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * マイフレ管理をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_manage_friend_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $page = $requests['page'];
        $size = 20;

        list($c_friend_list, $prev, $next, $total_num) = db_friend_c_friend_list_disp4c_member_id($u, $page, $size);

        $pager = array(
            'prev' => $prev,
            'next' => $next,
            'total_num' => $total_num,
        );
        $pager['start'] = $size * ($page - 1) + 1;
        $pager['end'] = $size * $page;
        if ($pager['end'] > $total_num) {
            $pager['end'] = $total_num;
        }

	// テンプレート出力
	$arr = array(
        	'list' => $c_friend_list,
        	'page' => $page,
        	'pager' => $pager,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_manage_friend_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
