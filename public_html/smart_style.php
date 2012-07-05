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
.ui-content {
	margin-top: 42px;
}
.menu-content {
	margin-top: 93px;
}

/* ヘッダー */
div#mainHeader {
	position: fixed;
	top: 0px;
	z-index: 90;
	width: 100%; 
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

/* メニュー */
div#menu {
	overflow: hidden;
	position: fixed;
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
	position: fixed;
	top: 42px;
	z-index: 90;
	width: 100%; 
	padding: 0;
	overflow: hidden;
}
div.topNav ul {
	margin: 0;
}
div.topNav ul li a.ui-btn {
	margin: 0;
	height: 50px;
}
div.topNav ul li a.ui-btn span {
	text-overflow: clip;
}
div#navDiary ul li a.ui-btn span {
	font-size: 11.5px;
	padding: 16px 2px 16px;
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
foreach( $_OPENPNE_SMART_ICON_LIST['settings'] as $icon_name => $icon_url ) {
	if (!empty($icon_name) && !empty($icon_url)) {
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
 * パーツ内上下の部分（ページャー、検索BOXなど）
 *--------------------------------------------*/
.pagerRelative {
	text-align: center;
	margin-top: 25px;
}
.pagerRelative span {
}

div.operation ul {
	text-align: center;
}

.writeBox,
.searchFormBox {
	margin-bottom: 25px;
}


/*----------------------------------------------
 * フォーム
 *--------------------------------------------*/

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

.authorBar .itemData,
.authorBar .itemData_noComNum {
	display: table-cell;
	vertical-align: top;
}

.authorBar .itemData .memberData,
.authorBar .itemData_noComNum .memberData,
.authorBar .itemData .title,
.authorBar .itemData_noComNum .title {
	margin: 0 3px;
}

a .itemData .title *,
a .itemData_noComNum .title *,
.itemData .title *,
.itemData_noComNum .title *,
.itemData .memberData *,
.itemData_noComNum .memberData * {
	font-size: 100%;
	display: inline;
}

.icon_public {
	width: 16px;
	height: 16px;
}

.datetime {
	margin-left: 10px;
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
	max-height: 3.6em;
	text-overflow: ellipsis;
	overflow: hidden;
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


/*============================================================================
 * 22. commentList（コメントリスト）
 * fh_diary(コメント), fh_diary_list, h_diary_list_all
 * 25. recentList（最新書き込みリスト）
 * h_diary_list_friend
 *----------------------------------------------------------------------------*/
.commentListBox {
	margin-bottom: 25px;
}

.commentForm {
	margin-top: 15px;
}

ul.ui-listview li.commentList {
	line-height: 1.3em;
	padding: 0 0 1px 0 !important;
}

ul.ui-listview li.commentList a.ui-link-inherit {
	padding: 0 15px;
}

ul.ui-listview li.commentList .ui-li-thumb {
	padding: 4px;
}
ul.ui-listview li.commentList .memberData {
	font-weight: normal;
	padding-left: 60px;
}

ul.ui-listview li.commentList .nameBody,
ul.ui-listview li.commentList .memberData .nameBody {
	text-overflow: ellipsis;
	overflow: hidden;
}

ul.ui-listview li.commentList .title {
	margin-bottom: 6px;
}

/* 本文＋写真リスト */ 
ul.pictureList li.commentList .nameBody,
ul.pictureList li.commentList .memberData .nameBody {
	max-height: 4.0em;
	min-height: 33px;
}

ul.pictureList li.commentList .gallery {
}

/* 本文＋カメラアイコンリスト */ 
ul.pictureIconList li.commentList {
	height: 70px;
}

ul.pictureIconList li.commentList a.ui-link-inherit {
	height: 68px;
}

ul.pictureIconList li.commentList .title {
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 100%;
}

ul.pictureIconList .itemData .title {
	width: 72%;
}

ul.pictureIconList .itemData_noComNum .title {
	width: 62%;
}

ul.pictureIconList li.commentList .public {
	position: absolute;
	top: 0;
}

ul.pictureIconList .itemData .public {
	right: 43%;
}

ul.pictureIconList .itemData_noComNum .public {
	right: 33%;
}

ul.pictureIconList li.commentList .icon_camera {
	position: absolute;
	top: 0;
}

ul.pictureIconList .itemData .icon_camera {
	right: 38%;
}

ul.pictureIconList .itemData_noComNum .icon_camera {
	right: 28%;
}

ul.pictureIconList li.commentList .authorName {
	position: absolute;
	top: -2px;
	width: 90px;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 80%;
	font-weight: bold;
	z-index: 2;
}

ul.pictureIconList .itemData .authorName {
	right: 10%;
}

ul.pictureIconList .itemData_noComNum .authorName {
	right: -2%;
}

ul.pictureIconList .datetime {
	position: absolute;
	top: -2px;
	font-size: 80%;
	font-weight: normal;
	line-height: 1.5em;
	width: 90px;
	z-index: 2;
}

.authorName + .datetime {
	top: 20px !important;
}

ul.pictureIconList .itemData .datetime {
	right: 10%;
}

ul.pictureIconList .itemData_noComNum .datetime {
	right: -2%;
}

ul.pictureIconList li.commentList .nameBody {
	width: 76%;
	height: 3.6em;
	line-height: 1.2em;
	overflow: hidden;
	white-space: normal;
}

/* ブログリスト */
.blogListBox h2 {
	font-size: 120%;
	margin-bottom: 25px;
}

.blogList h3 {
	display: block !important;
}
