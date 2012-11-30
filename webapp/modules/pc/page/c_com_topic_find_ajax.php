<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * 参加コミュニティの新着トピック/イベントをJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_c_com_topic_find_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        $type = $requests['type'];
        $c_commu_id = $requests['c_commu_id'];
        $target_commu = $requests['target_commu'];
        // ----------
        if ($target_commu == 'all') {
            openpne_forward('pc', 'page', 'h_com_topic_find_all_alax');
            exit;
        }

        //--- 権限チェック
        //掲示板閲覧権限
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            echo array2json(array('msg' => 'このページにはアクセスすることができません。'));
            return false;
        }

        //バグ回避のため全角空白を半角空白に統一
        $keyword = str_replace("　", " ", $keyword);

        do_common_insert_search_log($u, $keyword);

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));

        $page_size = 20;

        //検索結果
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
         = db_commu_search_c_commu_topic($keyword, $page_size, $page, $type, $c_commu_id);

        $search_val_list = array(
            'type' => $type,
        );

           // テンプレート出力
        $arr = array(
            'list' => $result,
            'is_prev' => $is_prev,
            'is_next' => $is_next,
            'total_num' => $total_num,
            'search_val_list' => $search_val_list,
            'c_commu_id' => $c_commu_id,
            'page' => $page,
            'page_size' => $page_size,
            'keyword' => $keyword,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'c_com_topic_find_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;    
    }
}

?>
