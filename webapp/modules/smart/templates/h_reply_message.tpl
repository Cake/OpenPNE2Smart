({if $msg == 1})
({assign var=_msg value="送信完了しました。"})
({elseif $msg == 2})
({assign var=_msg value="下書きメッセージを保存しました。"})
({/if})
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg=$_msg})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
