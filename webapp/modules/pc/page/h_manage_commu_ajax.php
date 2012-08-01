<?php
/* 
  * お気に入り一覧をJSON形式で出力
  * View出力なし */
require_once OPENPNE_WEBAPP_DIR. '/lib/util/json.php';

class pc_page_h_manage_commu_ajax extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $page = $requests['page'];
        $size = 20;

        list($c_commu_list, $pager) = db_commu_c_commu_list4c_member_id($u, $page, $size);

        $this->set('c_commu_list', $c_commu_list);
        $this->set('pager', $pager);
        $this->set('page', $page);

	// テンプレート出力
	$arr = array(
        	'list' => $c_commu_list,
        	'page' => $page,
        	'pager' => $pager,
                'requests' => $requests,
        );

        $data = openpne_display_ajax($arr, 'h_manage_commu_ajax');

	// JSON出力
        $data = array('msg' => '', 
                'comment_list' => $data,
        );
        echo array2json($data);
        return false;
    }
}

?>
