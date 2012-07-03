function readMore(element) {
	$(element).children('.nameBody')
		.css('max-height', 'none');
	$(element).children('.gallery')
		.css('display', 'block');
	$(element).children('.readMore')
		.css('display', 'none');
}

function setDiaryIdparams(diaryId) {
	return '&target_c_diary_id='+diaryId;
}
function changePage(url, params) {
	$.mobile.changePage(url+params, { transition: "slide"} );
}

function submitPagerAll(url, order, element, pagerId, totalNum, isListview) {
	url = url+"&total_num="+totalNum;

	$.ajax({
        type: "GET",
        url: url,
        dataType: "json",
		cache:  false,
        beforeSend: function(xhr) {
			$.mobile.showPageLoadingMsg();
		},
        error: function(XMLHttpRequest, textStatus, errorThrown) {
			$.mobile.hidePageLoadingMsg();
			showDialog('ERROR', errorThrown);
			return false;
		},
        success: function(response) {
			// 出力
			// エラーの場合
			if (response['msg']) {
				$.mobile.hidePageLoadingMsg();
				showDialog('ERROR', response['msg']);
				return false;
			}

			// 本文
			if (order == 'asc') {
	            $(element+":last").after(response['comment_list']);
			} else {
    	        $(element+":first").before(response['comment_list']);
			}

			// Pager Remove
			$("#"+pagerId).remove();

			// スタイル更新
			if (isListview) {
				$(element).parent().listview('refresh');
				$(element).trigger("create");
			}

			//PhotoSwipe
			$cp = $('.page');
			var pageId = $cp.attr('id');
			var photoSwipeInstance = window.Code.PhotoSwipe.getInstance($cp.attr('id'));
			if(typeof photoSwipeInstance != "undefined" && photoSwipeInstance != null){
				window.Code.PhotoSwipe.detatch(photoSwipeInstance);
			}
			if ($('#'+pageId+' ul.gallery a').size() > 0) {
				   $('#'+pageId+' ul.gallery').each(function(){
						if ($(this).children().size()) {
							var photoBoxId = $(this).attr("id");
							if (photoBoxId != undefined) {
								var myPhotoSwipe = $('ul#'+photoBoxId+' a').photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarShowEmptyCaptions: false });
							}
						}
					});
/* 日記～全コメント一括スライドショー
				var opt = {captionAndToolbarShowEmptyCaptions: false},
					photoSwipeInstance = $('ul.gallery a', '.page').photoSwipe(opt, $cp.attr('id'));
 */
			}

			// 出力完了
			$.mobile.hidePageLoadingMsg();
			return false;
        }
	});
}
function submitPagerPage(url, order, element, pagerId, totalPageNum, isListview) {
	var url = url+"&page="+page;
	
	$.ajax({
        type: "GET",
        url: url,
        dataType: "json",
		cache:  false,
        beforeSend: function(xhr) {
			$.mobile.showPageLoadingMsg();
		},
        error: function(XMLHttpRequest, textStatus, errorThrown) {
			$.mobile.hidePageLoadingMsg();
			showDialog('ERROR', errorThrown);
			return false;
		},
        success: function(response) {
			// 出力
			// エラーの場合
			if (response['msg']) {
				showDialog('ERROR', response['msg']);
				return false;
			}

			// 本文
			if (order == 'asc') {
	            $(element+":last").after(response['comment_list']);
			} else {
    	        $(element+":first").before(response['comment_list']);
			}

			// Pager
			if (totalPageNum > page) {
				page++;
			} else {
				$("#"+pagerId+" span.next").remove();
			}

			// スタイル更新
			if (isListview) {
				$(element).parent().listview('refresh');
			}

			// 出力完了
			$.mobile.hidePageLoadingMsg();
			return false;
        }
	});
}

/* メニューの開閉 */
function menuToggle(){
	if ($('div#menu ').css('height') != '0px') {
		menuHide();
	} else {
		menuShow();
	}
}
function menuHide(){
	$('div#menu ').css('height','0px');
/*	$('div#menu').animate(
		{'height':'0px'},
		{
			duration: "fast", 
			easing: "linear",
			complete: function(){
				$('div.content').click(menuHide);
			}
		}
	);*/
}
function menuShow(){
	$('div#menu ').css('height','auto'); 
/*	$('div#menu').animate(
		{'height':'128px'},
		{
			duration: "fast", 
			easing: "linear",
			complete: function(){
				$('div.content').unbind('click', 'menuHide') ;
			}
		}
	); */
}

/* 指定IDにジャンプ */
function jump_to(target, open){
	if ($("#"+open).attr("id")!==undefined) {
		$("#"+open).children().toggle(true);
	}
	if ($("#"+target).attr("id")!==undefined) {
		var p = $("#"+target).offset().top;
		$('html,body').animate({ scrollTop: p }, 'fast');
		$("#"+target).focus();
	}
}

/* ページトップにジャンプ */
function go_top(){
		var p = $("body").offset().top;
		$('html,body').animate({ scrollTop: p }, 'fast');
}

/* ダイアログの動的生成 */
function showDialog(header, msg) {
	// ダイアログの内容
	var dialog_html = [
		'<div data-role="page" id="Dialog">',
		'<div data-role="header"><h3>'+header+'</h3></div>',
		'<div data-role="content"><p>'+msg+'</p></div>',
		'</div>'
	].join('');

	// DOMに追加
	$('body').append($(dialog_html));
 
	// ダイアログを表示
	$.mobile.changePage('#Dialog', {
		transition: 'pop',
		role: 'dialog',
	});
}
