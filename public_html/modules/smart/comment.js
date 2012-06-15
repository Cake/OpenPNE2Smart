function response_comment_format(nickname, num, target_textarea){
	if (nickname && num) {
		var a = document.getElementById(target_textarea);
		a.value += '>>' + num + ' ' + nickname + 'さん' + "\n";
	}
}
