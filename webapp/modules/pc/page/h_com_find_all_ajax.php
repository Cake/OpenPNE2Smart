<?php
/* 
  * 参加コミュニティの新着トピック/イベントをJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_com_find_all_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_category_parent_id = $requests['target_c_commu_category_parent_id'];
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        $val_order = $requests['val_order'];
        $category_id = $requests['category_id'];
        // ----------

        //バグ回避のため全角空白を半角空白に統一
        $keyword = str_replace("　", " ", $keyword);

        do_common_insert_search_log($u, $keyword);

        $page_size = 20;

        //検索結果
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_search_c_commu4c_commu_category(
                $keyword,
                $target_c_commu_category_parent_id,
                $page_size,
                $page,
                $val_order,
                $category_id);

        // テンプレート出力
        $arr = array(
            'list' => $result,
            'is_prev' => $is_prev,
            'is_next' => $is_next,
            'total_num' => $total_num,
            'page' => $page,
            'page_size' => $page_size,
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_com_find_all_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
