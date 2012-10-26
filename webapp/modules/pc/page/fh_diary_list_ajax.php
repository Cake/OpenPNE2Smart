<?php
/* 
  * 指定メンバーの日記一覧をJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_fh_diary_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        $year = $requests['year'];
        $month = $requests['month'];
        $day = $requests['day'];
        $category_id = $requests['category_id'];
        $keyword = $requests['keyword'];
        // ----------

        if (!$target_c_member_id || !is_null($keyword)) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_diary_admin = true;
        } else {
            $type = 'f';
            $is_diary_admin = false;
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);
            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                echo array2json(array('msg' => 'このメンバーのページにはアクセスできません。'));
                return false;
            }
        }

        $page_size = 20;

        $target_member = db_member_c_member4c_member_id($target_c_member_id);
        $this->set('target_member', $target_member);
        //年月日で一覧表示、日記数に制限なし
        if ($year && $month) {
            $list_set = p_fh_diary_list_diary_list_date4c_member_id($target_c_member_id, $page_size, $page ,$year, $month, $day, $u);
        } elseif($category_id) {
            $year = date('Y');
            $month = date('n');
            $list_set = db_diary_list4c_diary_category_id($target_c_member_id, $category_id, $u, $page_size, $page);
        } else {
            $year = date('Y');
            $month = date('n');
            $this->set('all', 1);

            //検索する場合
            if ($keyword) {
                $list_set = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page, $u);
            } else {
                $list_set = p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $page_size, $page, $u);
            }
        }

        // テンプレート出力
        $arr = array(
            'type' => $type,
            'list' => $list_set[0],
            'target_member' => $target_member,
            'page' => $page,
            'page_size' => $page_size,
            'is_prev' => $list_set[1],
            'is_next' => $list_set[2],
            'total_num' => $list_set[3],
            'diary_list_count' => count($list_set[0]),
            'keyword' => $keyword,
            'url_keyword' => urlencode($keyword),
            'is_writable_comment' => db_diary_is_writable_comment4c_diary_id($target_c_diary_id),
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'fh_diary_list_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
