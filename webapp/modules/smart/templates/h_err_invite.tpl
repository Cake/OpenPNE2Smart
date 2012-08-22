<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg=$smarty.const.SNS_NAME|string_format:"%sでは、メンバーによる招待はおこなえません。"})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
