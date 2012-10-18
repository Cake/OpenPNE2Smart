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
 * マイフレの日記一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_diary_list_friend_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        //日記一覧
        $page_size = 50;

        $lst = p_h_diary_list_friend_h_diary_list_friend4c_member_id($u, $page_size, $page);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }
        $this->set('pager', $pager);

	// テンプレート出力
	$arr = array(
        	'page_size' => $page_size,
        	'list' => $lst[0],
        	'is_prev' => $lst[1],
        	'is_next' => $lst[2],
        	'total_num' => $lst[3],
        	'page' => $page,
        	'pager' => $pager,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_diary_list_friend_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
    }
}

?>
