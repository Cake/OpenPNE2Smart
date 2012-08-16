<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="登録が完了しました。"})

({* {{{ simpleBox *})<section class="simpleBox" id="registEnd" data-role="">
<p>以下のページからログインしてください。</p>
<a href="({$login_url})" data-role="button" data-inline="false" data-mini="false" data-ajax="false">ログインページへ</a>
</section>({* simpleBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
