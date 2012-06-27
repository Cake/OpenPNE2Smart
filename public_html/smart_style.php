<?php
require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

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
 * ベースレイアウト
 *--------------------------------------------*/
/* メニュー */
div#menu {
	overflow: hidden;
	position: absolute;
	top: 42px;
	width: 100%; 
	height: 0px; 
	padding: 0;
	z-index: 99;
}
div#menu ul {
	margin: 0;
}
div#menu ul li a.ui-btn {
	margin: 0;
}
div#menu ul li a.ui-btn span {
	text-overflow: clip;
}

div#div#menu .ui-header .ui-btn {
	z-index: 100;
}

/* 個別ナビゲーション */
div.topNav {
	overflow: hidden;
	width: 100%; 
	padding: 0;
	z-index: 90;
}
div.topNav ul {
	margin: 0;
}
div.topNav ul li a.ui-btn {
	margin: 0;
}
div.topNav ul li a.ui-btn span {
	text-overflow: clip;
}
div#navDiary ul li a.ui-btn span {
	font-size: 11.5px;
	padding: 0.55em 2px 0.5em;
}

div#mainHeader {
	height: 40px;
}
div#mainHeader #headerHomeButton {
	margin-left: 48px;
}
div#mainHeader .ui-header .ui-title {
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

/**=============================================================================
 * アイコン
 *----------------------------------------------------------------------------*/

#headerRight {
	float: right;
}
#headerRight a {
	position: relative;

}
a.smartIcon span.ui-icon {
/*	width: 24px !important;
	height: 24px !important;*/
	background-size: 18px !important;
	background-color: rgba(255, 255, 255, 0.6) !important;
}

<?php
foreach( $_OPENPNE_SMART_ICON_LIST['settings'] as $icon_name => $icon_img ) {
	if (!empty($icon_name) && !empty($icon_img)) {
		$icon_url = './modules/smart/icons/'.$icon_img;
		echo ".ui-icon-". $icon_name. " { \n".
			"\t".'background: url("'.$icon_url.'") no-repeat !important;'."\n".
		'}'."\n";
	}
}
?>


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
.authorBar .memberPhoto48,
.authorBar .memberPhoto36 {
	display: table-cell;
	width: auto;
}

.authorBar .memberPhoto76 {
	width: 81px;
}

.authorBar .memberPhoto48 {
	width: 53px;
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
	padding-left: 60px;
}

ul.ui-listview li.commentList .nameBody,
ul.ui-listview li.commentList .memberData .nameBody {
/*	max-height: 3.0em; */
	min-height: 33px;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 83%;
}
ul.ui-listview li.commentList .ui-li-thumb {
	padding: 4px;
}