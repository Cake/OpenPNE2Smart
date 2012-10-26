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
 * お気に入り一覧をJSON形式で出力
 * View出力なし
 */

require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_c_edit_member_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            echo array2json(array('msg' => 'このページにはアクセスできません。'));
            return false;
        }
        //---

        $page_size = 20;

        //コミュニティメンバーリスト
        $list = db_commu_c_member_list4c_commu_id($target_c_commu_id, $page_size, $page);

        // テンプレート出力
        $arr = array(
            'list' => $list[0],
            'c_commu' => db_commu_c_commu4c_commu_id($target_c_commu_id),
            'page' => $page,
            'page_size' => $page_size,
            'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'c_edit_member_ajax');

        // JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;    
    }
}
?>
