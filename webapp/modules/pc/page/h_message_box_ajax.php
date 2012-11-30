<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * メッセージ一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_message_box_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $box = $requests['box'];
        $ru_page = $requests['ru_page'];
        $s_page = $requests['s_page'];
        $save_page = $requests['save_page'];
        $trash_page = $requests['trash_page'];
        $keyword = $requests['keyword'];
        $target_c_member_id = $requests['target_c_member_id'];
        $year = $requests['year'];
        $month = $requests['month'];
        $day = $requests['day'];
        // ----------

        // 1ページ当たりに表示するメッセージ数
        $page_size = 20;

        //送受信絞り
        $this->set("target_c_member_id", $target_c_member_id);

        switch ($box) {

        //受信リスト
        case 'inbox':
        default:
            //検索
            if ($keyword || $target_c_member_id) {
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_search_c_message($u, $ru_page, $page_size, $keyword, $box, $target_c_member_id);
            } elseif ($year && $month) {
            //年月日絞り
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_c_message_received_list4c_member_id4range($u, $ru_page, $page_size, $year, $month, $day);
            } else {
                list($ru_list,$is_ru_prev,$is_ru_next, $total_num) = db_message_c_message_received_list4c_member_id4range($u, $ru_page, $page_size);
            }
            $result = $ru_list;

            break;

        //送信済みリスト
        case 'outbox':
            //検索
            if ($keyword || $target_c_member_id) {
                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_search_c_message($u, $s_page, $page_size, $keyword, $box, $target_c_member_id);
            } elseif ($year && $month) {

                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_c_message_sent_list4c_member_id4range($u, $s_page, $page_size, $year, $month, $day);
            } else {
                list($s_list,$is_s_prev,$is_s_next, $total_num) = db_message_c_message_sent_list4c_member_id4range($u, $s_page, $page_size);
            }
            $result = $s_list;
            break;

        //下書き保存リスト
        case 'savebox':
            list($save_list,$is_save_prev,$is_save_next, $total_num) = db_message_c_message_save_list4c_member_id4range($u, $save_page, $page_size);
            $result = $save_list;
            break;

        //ごみ箱リスト
        case 'trash':
            list($trash_list,$is_trash_prev,$is_trash_next, $total_num) = db_message_c_message_trash_list4c_member_id4range($u, $trash_page, $page_size);
            $result = $trash_list;
            break;
        }

        // テンプレート出力
        $arr = array(
            'list' => $result,
            'box' => $box,
            'target_c_member_id' => $target_c_member_id,
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_message_box_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
