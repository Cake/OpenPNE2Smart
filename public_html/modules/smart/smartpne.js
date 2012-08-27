function readMore(element) {
	$(element).children('.itemBody')
		.css('max-height', 'none');
/*	$(element).children('.gallery')
		.css('display', 'block'); */
	$(element).children('.readMore')
		.css('display', 'none');
}

function setDiaryIdparams(diaryId) {
	return '&target_c_diary_id='+diaryId;
}
function changePage(url, params, direction) {
	$.mobile.changePage(url+params,{ 
		transition: "slide",
		reverse: direction
	});
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
			showDialog('ERROR', errorThrown, 'Dialog');
			return false;
		},
        success: function(response) {
			// 出力
			// エラーの場合
			if (response['msg']) {
				$.mobile.hidePageLoadingMsg();
				showDialog('ERROR', response['msg'], 'Dialog');
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
	submitPagerPageSend(url, order, element, pagerId, totalPageNum, isListview);
}
function submitPagerPageName(url, pageName, order, element, pagerId, totalPageNum, isListview) {
	var url = url+"&"+pageName+"="+page;
	submitPagerPageSend(url, order, element, pagerId, totalPageNum, isListview);
}

function submitPagerPageSend(url, order, element, pagerId, totalPageNum, isListview) {
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
			showDialog('ERROR', errorThrown, 'Dialog');
			return false;
		},
        success: function(response) {
			// 出力
			// エラーの場合
			if (response['msg']) {
				showDialog('ERROR', response['msg'], 'Dialog');
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
				$("#"+pagerId).remove();
			}

			// スタイル更新
			if (isListview) {
				$(element).parent().listview('refresh');
				$(element).trigger("create");
			}
			$("a").filter(".addButton").buttonMarkup('refresh');

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

/* カルーセルスワイプ */
function carrouselSwipeLeft(Id, move){
	if (swipe_num >= 0 && swipe_num < swipe_limit) {
//			$(Id).css('left', '-'+move*(swipe_num + 1)+'px');
		$(Id).animate({ 
			left: '-'+move*(swipe_num + 1)+'px'
		}, 500 );
		swipe_num++;
	}
}
function carrouselSwipeRight(Id, move){
	if (swipe_num > 0) {
//			$(Id).css('left', '-'+move+*(swipe_num -1)+'px');
		$(Id).animate({ 
			left: '-'+move*(swipe_num -1)+'px'
		}, 500);
		swipe_num--;
	}
}

/* メニューの開閉 */
function menuToggle(){
	if ($('div#menu ').css('display') != 'none') {
		menuHide();
	} else {
		menuShow();
	}
}
function menuHide(){
	$('div#menu ').css('display','none');
}
function menuShow(){
	$('div#menu ').css('display','block');
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
function showDialog(header, msg, id) {
	setDialog(header, msg, id);
	// ダイアログを表示
	openDialog(id);
}

function setDialog(header, msg, id) {
	if ($("#"+id).html()) {
		return false;
	}

	// ダイアログの内容
	var dialog_html = [
		'<div data-role="page" id="'+id+'">',
		'<div data-role="header"><h3>'+header+'</h3></div>',
		'<div data-role="content"><p>'+msg+'</p></div>',
		'</div>'
	].join('');

	// DOMに追加
	$('body').append($(dialog_html));
}

function openDialog(id) {
	$.mobile.changePage('#'+id, {
		transition: 'pop',
		role: 'dialog',
	});
}

function setConfirmDialog(header, yes_url, back_url, id) {
	var msg = null;
	// ダイアログの内容
	if (yes_url != undefined) {
		msg = '<div class="operation yesNoButtonBox">'+
		'<ul class="ui-grid-a">'+
		'<li class="ui-block-a"><a href="'+yes_url+'" data-role="button" data-ajax="false">はい</a></li>'+
		'<li class="ui-block-b"><a href="'+back_url+'" data-role="button" data-direction="reverse" onclick="$(\'.ui-dialog\').dialog(\'close\')" data-ajax="true">いいえ</a>'+
			'</li></ul></div>';
	}

	// DOMに追加
	setDialog(header, msg, id);
}
