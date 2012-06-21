<?php

/* 
  * 指定日記のコメントをJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_fh_diary_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $page = $requests['page'];
        // ----------

        // target が指定されていない
        if (!$target_c_diary_id) {
            echo array2json(array('msg' => WORD_DIARY.'を指定してください。'));
            return false;
        }
        // target の日記が存在しない
        if (!p_common_is_active_c_diary_id($target_c_diary_id)) {
            echo array2json(array('msg' => '該当する'.WORD_DIARY.'が見つかりません。'));
            return false;
        }

        $target_c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $target_c_diary['c_member_id'];

        if ($target_c_member_id == $u) {
            $type = 'h';
        } else {
            $type = 'f';
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

            // check public_flag
            if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
                echo array2json(array('msg' => '該当する'.WORD_DIARY.'が見つかりません。'));
                return false;
            }
            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                echo array2json(array('msg' => 'このメンバーのページにはアクセスできません。'));
                return false;
            }
        }

        // 日記コメント
        // コメント取得件数
        $page_size = 5;
        if ($requests['order'] === 'asc') {
            $desc = false;
        } else {
            $desc = true;
        }

        list($c_diary_comment_list, $is_prev, $is_next, $total_num, $total_page_num)
            = k_p_fh_diary_c_diary_comment_list4c_diary_id($target_c_diary_id, $page_size, $page, $desc);
        if (empty($c_diary_comment_list)) {
            echo array2json(array('msg' => 'コメントはありません。'));
            return false;
        }

        // スマートフォンの場合、新着コメント順は上が新しい記事

        $pager = array();
        if ($is_prev) {
            if ($desc) {
                $pager['page_next'] = $page - 1;
            } else {
                $pager['page_prev'] = $page - 1;
            }
        }
        if ($is_next) {
            if ($desc) {
                $pager['page_prev'] = $page + 1;
            } else {
                $pager['page_next'] = $page + 1;
            }
        }

	// テンプレート出力
        $data = openpne_display_ajax(array(
        	'target_diary' => $target_c_diary,
        	'c_diary_comment_list' => $c_diary_comment_list,
        	'total_page_num' => $total_num,
        	'total_page_num' => $total_page_num,
        	'page_size' => $page_size,
        	'page' => $page,
        	'is_writable_comment' => db_diary_is_writable_comment4c_diary_id($target_c_diary_id),
        	'is_comment_input' => $target_c_diary['is_comment_input'],
                'is_prev' => $is_prev,
                'is_next' => $is_next,
                'pager' => $pager,
                'requests' => $requests,
        ), 
        'fh_diary_comment');

	// JSON出力
        $data = array('msg' => '',
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
