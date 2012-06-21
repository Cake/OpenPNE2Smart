function submitPager(a, id, order, element, pagerId, totalPageNum) {
	var url = "./?m=pc&a="+a+"&"+id+"&page="+page;
	if (order == "asc") {
		url += "&order="+order;
	}

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
            $(element+":last").after(response['comment_list']);

			// Pager
			if (totalPageNum > page) {
				page++;
			} else {
				$("#"+pagerId+" span.next").remove();
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
	if ($('nav#LeftNav ').css('left') == '0px') {
		leftNavHide();
	} else {
		leftNavShow();
	}
}
function leftNavHide(){
//	$('nav#LeftNav ').css('left','-280px'); 
	$('nav#LeftNav ').animate(
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
//	$('nav#LeftNav ').css('left','0px'); 
	$('nav#LeftNav ').animate(
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