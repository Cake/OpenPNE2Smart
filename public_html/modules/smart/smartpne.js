function jump_to(target, open){
	if ($("#"+open).attr("id")!==undefined) {
		$("#"+open).children().toggle(true);
	}

	if ($("#"+target).attr("id")!==undefined) {
		var p = $("#"+target).offset().top;
		$('html,body').animate({ scrollTop: p }, 'fast');
	}
}
