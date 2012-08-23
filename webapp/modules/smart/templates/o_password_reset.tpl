<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="passwordQueryForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>パスワード再設定</h3>
<p>新しいパスワードを入力してください</p>
({t_form_block m=pc a=do_o_password_reset _attr='data-ajax="false"'})
<input type="hidden" name="id" value="({$id})">
<input type="hidden" name="session" value="({$session})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="new_password">新しいパスワード</label>
<input type="password" class="input_password" name="new_password" id="new_password" value="" placeholder="新しいパスワード" autocapitalize="off" />
<label for="new_password2">新しいパスワード(確認)</label>
<input type="password" class="input_password" name="new_password2" id="new_password2" value="" placeholder="新しいパスワード(確認)" autocapitalize="off" />
<p>※パスワードは6～12文字の半角英数で入力してください。</p>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="変更" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
