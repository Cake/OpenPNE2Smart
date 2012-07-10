<?php
/* 
  * 指定コミュのトピック一覧をJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_c_topic_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        $page_size = 20;
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);

        //コミュニティの存在の有無
        if (!$c_commu) {
                echo array2json(array('msg' => 'コミュニティが存在しません。'));
                return false;
        }

        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_c_topic_list4target_c_commu_id($c_commu_id, $u, $page, $page_size, 0, 1);

        //--- 権限チェック
        $is_c_commu_member = db_commu_is_c_commu_member($c_commu_id, $u);

        if (!$is_c_commu_member && $c_commu['is_open'] == "member") {
            $is_warning = true;
        } else {
            $is_warning = false;
        }
        //---

	// テンプレート出力
	$arr = array(
        	'c_commu' => $c_commu,
        	'list' => $result,
        	'is_next' => $is_prev,
        	'page' => $page,
        	'page_size' => $page_size,
        	'total_num' => $total_num,
        	'is_warning' => $is_warning,
        	'is_c_commu_admin' => db_commu_is_c_commu_admin($c_commu_id, $u),
        	'is_c_commu_member' => $is_c_commu_member,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'c_topic_list_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
