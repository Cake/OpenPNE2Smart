<?php
/**
 * OpenPNE2 for Smart Phone
 * @copyright 2012 OpenPNE2 Smart Phone Project
 * @author    Cake
 * @url       http://cake.github.com/OpenPNE2/
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * お気に入り一覧をJSON形式で出力
 * View出力なし
 */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_search_result_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        $birth_year = $requests['birth_year'];
        $birth_month = $requests['birth_month'];
        $birth_day = $requests['birth_day'];
        $image = $requests['image'];
        $nickname = $requests['nickname'];
        // ----------

        $profiles = array();
        if ($_REQUEST['profile']) {
            $profiles = db_member_search_check_profile($_REQUEST['profile']);
        }

        $limit = 20;

        $cond = array(
            'birth_year' => $birth_year,
            'birth_month' => $birth_month,
            'birth_day' => $birth_day,
            'image' => $image,
        );
        $cond_like = array(
            'nickname' => $nickname,
        );

        $result = db_member_search($cond, $cond_like, $limit, $page, $u, $profiles);

        // テンプレート出力
        $arr = array(
            'list' => $result[0],
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_search_result_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
