<?php
/* 
  * 参加コミュニティ一覧をJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_fh_com_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
                echo array2json(array('msg' => 'このページにはアクセスできません。'));
                return false;
        }

        $page_size = 12;

        list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($target_c_member_id, $page, $page_size);

	// テンプレート出力
	$arr = array(
        	'list' => $c_commu_list,
        	'page' => $page,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'fh_com_list_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
