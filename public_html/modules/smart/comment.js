function response_comment_format(nickname, num, target_textarea){
	if (nickname && num) {
		var a = document.getElementById(target_textarea);
		a.value += '>>' + num + ' ' + nickname + 'さん' + "\n";
	}
}

function jump_to(target, focus_on){
	$('#'+focus_on).focus();

	var p = $("#"+target).offset().top;
	$('html,body').animate({ scrollTop: p }, 'fast');
}
