function jump_to(target, focus_on){
	var p = $("#"+target).offset().top;
	$('html,body').animate({ scrollTop: p }, 'fast');
}
