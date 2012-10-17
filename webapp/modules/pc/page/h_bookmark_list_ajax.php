<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * お気に入り一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_bookmark_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $page_size = 20;

        $list = db_bookmark_list($u, $page, $page_size);

	// テンプレート出力
	$arr = array(
        	'list' => $list[0],
        	'c_members' => $list[0],
        	'page' => $page,
        	'page_size' => $page_size,
        	'is_prev' => $list[1],
        	'is_next' => $list[2],
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_bookmark_list_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;    
    }
}

?>
