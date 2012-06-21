<?php
header('Content-Type: text/css');

header('Cache-Control: max-age=315360000');
header('Expires: ' . gmdate('D, d M Y H:i:s', strtotime('+10 years')) . ' GMT');
?>
@charset "UTF-8";

/**=============================================================================
 * レイアウト設定
 *----------------------------------------------------------------------------*/

/*==============================================================================
 * デフォルトスタイルシートの上書き
 *----------------------------------------------------------------------------*/
ul {
	list-style-position: outside;
	list-style-type: none;
	padding: 0;
}

/*----------------------------------------------
 * セクション
 *--------------------------------------------*/
small {
	font-size: 80% !important;
}

time {
	font-size: 80% !important;
}

/*----------------------------------------------
 * パーツ内上下の部分（1件～20件を表示など）
 *--------------------------------------------*/
.pagerRelative {
	text-align: center;
}
.pagerRelative span {
}

div.operation ul {
	text-align: center;
}

/*----------------------------------------------
 * ユーザ写真＋情報バー
 *--------------------------------------------*/
.authorBar {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.authorBar .memberPhoto76,
.authorBar .memberPhoto36 {
	display: table-cell;
	width: auto;
}

.authorBar .memberPhoto76 {
	width: 81px;
}

.authorBar .memberPhoto36 {
	width: 41px;
}

.authorBar .memberData {
	display: table-cell;
	vertical-align: top;
}

.authorBar .memberData .data,
.authorBar .memberData .title {
	margin: 0 3px;
}

.authorBar .memberData .data *,
.authorBar .memberData .title * {
	font-size: 100%;
	display: inline;
}

.authorBar .memberData .data time {
}


/*==============================================================================
 * 8. diaryDetailBox（日記詳細ボックス）
 *----------------------------------------------------------------------------*/
.diaryDetailBox #diaryBody {
	margin: 0;
}

.diaryDetailBox #diaryCategory {
	float: left;
}

.diaryDetailBox #diaryCategory span {
	font-size: 80%;
	margin-left: 5px;
}

.diaryDetailBox #diaryCategory span:first-child {
	margin-left: 0;
}

.commentWriteButton {
	text-align:right;
}

