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
 * 参加コミュニティの新着トピック/イベントをJSON形式で出力
 * View出力なし
 */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_com_topic_find_all_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        $type = $requests['type'];
        // ----------

        //バグ回避のため全角空白を半角空白に統一
        $keyword = str_replace("　", " ", $keyword);

        do_common_insert_search_log($u, $keyword);

        $page_size = 20;

        //検索結果
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
         = db_commu_search_c_commu_topic($keyword, $page_size, $page, $type);

        // テンプレート出力
        $arr = array(
            'list' => $result,
            'is_prev' => $is_prev,
            'is_next' => $is_next,
            'total_num' => $total_num,
            'page' => $page,
            'page_size' => $page_size,
            'keyword' => $keyword,
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_com_topic_find_all_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
