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
 * リストビュー
 *--------------------------------------------*/

.ui-li-aside {
	width: 10%;
	padding-right: 5px;
}

.ui-li-desc img {
	padding : 0 10px 0 0;
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
 * ベースレイアウト
 *--------------------------------------------*/
nav#LeftNav {
	overflow: hidden;
	position: absolute;
	top: 42px;
	left: -280px;
	width: 250px; 
	min-height: 100%;
	padding: 0 15px;
	z-index: 99;
}
nav#LeftNav .ui-header .ui-btn {
	z-index: 100;

}

nav .ui-field-contain {
	margin: 0;
}

header {
	height: 40px;
}
header #headerHomeButton {
	margin-left: 48px;
}
header .ui-header .ui-title {
	margin-top: -0.8em;
}
h1#pageTitle {
	margin: 0.6em 10% 0.8em;
}

#commonPageScrollUp {
	position: absolute;
	right: 5px;
}
#commonPageScrollDown {
	display: none;
}
/*
#commonPageScrollUp, 
#commonPageScrollDown {
	opacity: 0.5;
	position: fixed;
	top: 50%;
	z-index: 90;
}
#commonPageScrollUp {
	left: 5px;
}
#commonPageScrollDown {
	right: 5px;
}
*/

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
 * フォーム
 *--------------------------------------------*/
.formDetail {
	display: none;
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

.authorBar .title *,
.authorBar .data *,
.authorBar .memberData .title *,
.authorBar .memberData .data * {
	font-size: 100%;
	display: inline;
}
}

div.photo {
	padding: 5px;
}

/*==============================================================================
 * 3. alertBox（アラートボックス）
 *----------------------------------------------------------------------------*/
.alertBox{
	border-width: 1px;
	color: #FF0000;
	padding: 5px 10px;
}
.alertBox p {
	margin: 5px;
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


/*==============================================================================
 * 22. commentList（コメントリスト）
 *----------------------------------------------------------------------------*/
.commentForm {
	margin-top: 15px;
}

ul.ui-listview li.commentList {
	line-height: 1.3em;
	padding: 0 !important;
}

ul.ui-listview li.commentList .memberData {
	font-size: 16px;
	font-weight: normal;
	padding-left: 46px;
}

ul.ui-listview li.commentList .nameBody,
ul.ui-listview li.commentList .memberData .nameBody {
/*	max-height: 3.0em; */
	text-overflow: ellipsis;
	overflow: hidden;
	width: 83%;
}
ul.ui-listview li.commentList .ui-li-thumb {
	padding: 4px;
}