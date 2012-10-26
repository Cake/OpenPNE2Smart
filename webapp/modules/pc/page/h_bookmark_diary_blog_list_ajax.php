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
 * お気に入りの日記/Bloc一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_bookmark_diary_blog_list_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        //ブックマークフィードしない
        if (!USE_BOOKMARK_FEED) {
                echo array2json(array('msg' => 'このページにはアクセスできません。'));
                return false;
        }

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $u = $GLOBALS['AUTH']->uid();

        //日記一覧
        $page_size = 50;

        $lst = db_bookmark_diary_list_with_pager($u, $page_size, $page);

        // テンプレート出力
        $arr = array(
            'list' => $lst[0],
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_bookmark_diary_blog_list_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
