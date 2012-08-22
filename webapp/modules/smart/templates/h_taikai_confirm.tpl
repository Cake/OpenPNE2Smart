<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="registPcMailConfirmForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$smarty.const.SNS_NAME}) 退会</h3>
({t_form_block m=pc a=do_h_taikai _attr='data-ajax="false"'})
<p>
本当に退会してもよろしいですか？<br />
退会する場合は、確認のためパスワードを入力してください。<br />
<br />
管理者になっている({$WORD_COMMUNITY})があれば、副管理者に管理権限が移管されます。また、副管理者がいない場合は参加日時のもっとも早いメンバーに権限が移管されます。
</p>

<div data-role="fieldcontain" class="ui-hide-label">
<label for="password" class="required">パスワード</label>
<input type="password" class="input_password" name="password" value="" placeholder="パスワード" autocapitalize="off" />
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="reason" class="required">退会理由</label>
<textarea name="reason" id="reason"></textarea>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="退会する" />
</div>
({/t_form_block})

({* {{{ linkLine *})
<div data-role="fieldcontain">
<a href="({t_url m=pc a=page_h_home})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">キャンセルしてホームへ</a>
</div>
({* }}} *})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
