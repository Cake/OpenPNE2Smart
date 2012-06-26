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

/* 左ナビの開閉 */
function leftNavToggleSetting(){
	$('#headerNavButton').bind('click', function(){
		var color = $(this).data('color');
		$('div#'+color).toggle();
	});
}
function leftNavToggle(){
	if ($('div#LeftNav ').css('left') == '0px') {
		leftNavHide();
	} else {
		leftNavShow();
	}
}
function leftNavHide(){
//	$('div#LeftNav ').css('left','-280px'); 
	$('div#LeftNav ').animate(
		{'left':'-280px'},
		{
			duration: "fast", 
			easing: "linear",
			complete: function(){
				$('div.content').click(leftNavHide);
			}
		}
	);
}
function leftNavShow(){
//	$('div#LeftNav ').css('left','0px'); 
	$('div#LeftNav ').animate(
		{'left':'0px'},
		{
			duration: "fast", 
			easing: "linear",
			complete: function(){
				$('div.content').unbind('click', 'leftNavHide') ;
			}
		}
	);
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
