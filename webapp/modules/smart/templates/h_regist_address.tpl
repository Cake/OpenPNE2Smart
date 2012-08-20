<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="registAddressForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>メールアドレス登録</h3>
<p>ご利用にはメールアドレスのご登録が必要となります。<br />
以下のフォームにメールアドレスを入れていただくと確認のメールが送信されますので、それに従いご登録を行ってください。</p>

({t_form_block _enctype=file m=pc a=do_h_regist_address _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address" class="required">メールアドレス</label>
<input type="email" class="input_text" name="pc_address" id="pc_address" value="" placeholder="メールアドレス" autocapitalize="off" />
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address2" class="required">メールアドレス(確認)</label>
<input type="email" class="input_text" name="pc_address2" id="pc_address2" value="" placeholder="メールアドレス(確認)" autocapitalize="off" />
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
