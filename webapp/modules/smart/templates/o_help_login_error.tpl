<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ infoButtonBox *})<section class="infoButtonBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>パスワードを忘れた方</h3>
<p>以下のボタンをクリックし、パスワードの再設定手続きをおこなってください。</p>
({t_form_block _method=get m=pc a=page_o_password_query})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="パスワード再設定ページへ">
</div>
({/t_form_block})
</section>({* infoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
