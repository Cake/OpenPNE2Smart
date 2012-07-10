<?php
/* 
  * コメント履歴をJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_diary_comment_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        //日記一覧
        $page_size = 50;

        $lst = p_h_diary_comment_list_c_diary_my_comment_list4c_member_id($u, $page, $page_size);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

	// テンプレート出力
	$arr = array(
        	'list' => $lst[0],
        	'is_prev' => $lst[1],
        	'is_next' => $lst[2],
        	'total_num' => $lst[3],
        	'page' => $page,
        	'pager' => $pager,
        	'page_size' => $page_size,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_diary_comment_list_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
