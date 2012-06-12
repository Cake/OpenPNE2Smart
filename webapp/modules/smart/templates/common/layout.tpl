<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>({$INC_HEADER_title})</title>
<meta charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
</head>
<body id="pc_page_({$INC_HEADER_page_name})">

({* {{{ header *})<div id="header">
<h1><a href="({t_url})">({$smarty.const.SNS_NAME})</a></h1>

({* {{{ nav *})<div id="nav">
({if $before_after == "after"})
({* {{{ globalNav *})<ul id="({if $before_after == "after"})globalNav({else})globalNavBefore({/if})">
({foreach from=$INC_HEADER_global_navi key=key item=item})
({if $item.url})
<li id="globalNav_({$key+1})"><a href="({$item.url})">({$item.caption})</a></li>
({/if})
({/foreach})
<li id="globalNav_9"><a href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})">ログアウト </a></li>
</ul>({* globalNav }}} *})
({/if})
({* {{{ pageNav *})
({if $inc_navi})({$inc_navi|smarty:nodefaults})({* pageNav }}} *})({/if})

</div>({* nav }}} *})
</div>({* header }}} *})

({if !$no_use_alert && ($msg || $msg1 || $msg2 || $msg3 || $err_msg)})
({* {{{ alertBox *})
<div class="alertBox" id="alertBox">
({if $msg})({$msg})<br />({/if})
({if $msg1})({$msg1})<br />({/if})
({if $msg2})({$msg2})<br />({/if})
({if $msg3})({$msg3})<br />({/if})
({foreach from=$err_msg item=item})
({$item})<br />
({/foreach})
</div>
({* }}} *})
({/if})

<!-- start of op_content -->
({$op_content|smarty:nodefaults})
<!-- end of op_content -->

<div id="footer">
({$INC_FOOTER_inc_page_footer|smarty:nodefaults})
</div>

</body>
</html>