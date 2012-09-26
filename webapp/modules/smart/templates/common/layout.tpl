<!DOCTYPE html>
<html lang="ja">
<head>
<title>({$INC_HEADER_title})</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./modules/smart/jquermobile/1.1/jquery.mobile.min.css">
<link rel="stylesheet" href="./modules/smart/photoswipe/photoswipe.css">
<script type="text/javascript" src="./modules/smart/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="./modules/smart/photoswipe/lib/klass.min.js"></script>
<script type="text/javascript" src="./modules/smart/photoswipe/code.photoswipe.jquery-3.0.5.min.js"></script>
<script language="JavaScript">
	<!--
	var page=2;

	(function(window, $, PhotoSwipe){
		$(document).bind('mobileinit', function(){
			// ページ移動時処理
			// 前のページの処理
			$('.page').live('pagehide', function(event, ui){
				 // 右上メニューを隠す
				 menuHide();
				 // ページャリセット
				 page=2;
			});

			// ページ初期化処理
			$('.page').live('pageinit', function(e){
({literal})
//				$.mobile.ajaxEnabled = false; // Ajax を使用した遷移を無効にする

				// Swipe設定
				$.event.special.swipe.horizontalDistanceThreshold = 120;

				// アップロード画像の拡大表示
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

				// タブ
				$(".tab li").click(function() {
					var id = $(this).attr('id');
					var content = $("#"+id+"-Content");

					content.siblings().hide();
					content.show();
					$(this).siblings().attr('class', 'ui-btn-up-c');
					$(this).attr('class', 'ui-btn-up-b')
				});
			});
		});
	}(window, jQuery, window.Code.PhotoSwipe));
	//-->
</script>

<script type="text/javascript" src="./modules/smart/jquermobile/1.1/jquery.mobile.min.js"></script>
({t_url_smart_style})
</head>
<body id="pc_page_({$INC_HEADER_page_name})" class="Body">
<!-- start of op_content -->
({$op_content|smarty:nodefaults})
<!-- end of op_content -->
</body>
</html>