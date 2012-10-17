<?php
/**
 * OpenPNE2 for SmartPhone
 * @copyright 2012 OpenPNE2 SmartPhone Project
 * @author K.Kudoh
 * @license http://www.php.net/license/3_01.txt PHP License 3.01
 */

/* 
 * PEAR::JSON
 */
require_once 'JSON.php';

/**
 * 配列をJSON形式に変更
 *
 * @param array
 * @return JSON
 */
function array2json($data) {
	if (!is_array($data)) {
		$data = array();
	}

	// UTF-8コンバート
	array_walk_recursive($data,  'convert2utf8');

	$json = new Services_JSON();
	return $json->encode($data);
}
function convert2utf8(&$val) {
	$val = mb_convert_encoding($val, 'utf-8', mb_internal_encoding());
}

?>
