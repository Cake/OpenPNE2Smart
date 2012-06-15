<!DOCTYPE html>
<html lang="ja">
<head>
<title>({$INC_HEADER_title})</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="./modules/smart/jquermobile/1.1/jquery.mobile.min.css">
	<script type="text/javascript" src="./modules/smart/jquery/1.7.2/jquery.min.js"></script>
	<script language="JavaScript">
	<!--
	$(document).bind("mobileinit", function(){
	//	$.mobile.ajaxEnabled = false; // Ajax を使用した遷移を無効にする
	});
	//-->
	</script>
	<script type="text/javascript" src="./modules/smart/jquermobile/1.1/jquery.mobile.min.js"></script>
<script type="text/javascript" src="./modules/smart/smartpne.js"></script>
<script type="text/javascript" src="./js/pne.js"></script>
<link rel="stylesheet" href="./smart_style.php?hash={$hash}" type="text/css" />
</head>
<body id="pc_page_({$INC_HEADER_page_name})" class="Body">
<!-- start of op_content -->
({$op_content|smarty:nodefaults})
<!-- end of op_content -->
</body>
</html>