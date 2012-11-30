<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * 全日記一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_diary_list_all_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        //日記一覧
        $page_size = 20;

        //検索結果
        $result = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $result[3]) {
            $pager['end'] = $result[3];
        }

        //バグ回避のため半角空白を全角に統一
        $keyword = str_replace(" ", "　", $keyword);

        $search_val_list = array('val_order'=> null, // $val_order,
                                 'search_word'=> null, // $search_word,
                                 'category_id'=> null, // $category_id,
                                 'c_commu_search_list_count'=>$result[3]);


        // テンプレート出力
        $arr = array(
            'list' => $result[0],
            'is_prev' => $result[1],
            'is_next' => $result[2],
        //検索に一致したコミュニティ数
            'c_diary_search_list_count' => $result[3],
            'page' => $page,
            'pager' => $pager,
            'page_size' => $page_size,
            'keyword' => $keyword,
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_diary_list_all_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
    }
}

?>
