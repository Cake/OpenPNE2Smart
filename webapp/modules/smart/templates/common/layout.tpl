<!DOCTYPE html>
<html lang="ja">
<head>
<title>({$INC_HEADER_title})</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="./modules/smart/jquermobile/1.1/jquery.mobile.min.css">
<link rel="stylesheet" href="./modules/smart/photoswipe/photoswipe.css">
<script type="text/javascript" src="./modules/smart/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="./modules/smart/photoswipe/lib/klass.min.js"></script>
<script type="text/javascript" src="./modules/smart/photoswipe/code.photoswipe.jquery-3.0.5.min.js"></script>
<script language="JavaScript">
	<!--
	(function(window, $, PhotoSwipe){
		$(document).bind('mobileinit', function(){
		//	$.mobile.ajaxEnabled = false; // Ajax を使用した遷移を無効にする

			// Swipe
			$.event.special.swipe.horizontalDistanceThreshold = 120;

			$('.page')
				.live('pageinit', function(e){
({literal})
					var $cp = $(e.target);
					var pageId = $cp.attr('id');

					$('#'+pageId+' ul.gallery').each(function(){
						if ($(this).children().size()) {
							var photoBoxId = $(this).attr("id");
							if (photoBoxId != undefined) {
								var myPhotoSwipe = $('ul#'+photoBoxId+' a').photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarShowEmptyCaptions: false });
							}
						}
					});
({/literal})
/* 日記～全コメント一括スライドショー
					var photoSwipeInstance = PhotoSwipe.getInstance($cp.attr('id'));
					if(typeof photoSwipeInstance != "undefined" && photoSwipeInstance != null){
						PhotoSwipe.detatch(photoSwipeInstance);
					}
					if ($('#'+pageId+' ul.gallery a').size() > 0) {
						var opt = {captionAndToolbarShowEmptyCaptions: false},
						photoSwipeInstance = $('ul.gallery a', e.target).photoSwipe(opt, $cp.attr('id'));
					}
					return true;
*/
				})
				.live('pageremove', function(e){
/* 日記～全コメント一括スライドショー
					var $cp = $(e.target);
					var photoSwipeInstance = PhotoSwipe.getInstance($cp.attr('id'));
					if(typeof photoSwipeInstance != "undefined" && photoSwipeInstance != null){
//					if(typeof photoSwipeInstance == 'object'){
						PhotoSwipe.detatch(photoSwipeInstance);
					}
*/
					return true;
				});
		});

	}(window, jQuery, window.Code.PhotoSwipe));
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