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

class pc_page_h_com_comment_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        //日記一覧
        $page_size = 20;

        $lst = db_commu_c_commu_topic_comment_list4c_member_id_2($u, $page_size, $page);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $lst[3]) {
            $pager['end'] = $lst[3];
        }

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

        $data = openpne_display_ajax($arr, 'h_com_comment_list_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
