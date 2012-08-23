<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="passwordQueryForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>パスワード再設定</h3>
<p>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
登録したメールアドレスと、秘密の質問・答えを入力してください。<br />
パスワードを再設定するためのURLが登録メールアドレス宛に送信されます。
({else})
登録したメールアドレスを入力してください。<br />
パスワードを再設定するためのURLが登録メールアドレス宛に送信されます。
({/if})
</p>
({t_form_block m=pc a=do_o_password_query _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address">メールアドレス</label>
<input type="email" class="input_text" name="pc_address" value="" placeholder="メールアドレス" autocapitalize="off" />
</div>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<div data-role="fieldcontain">
<label for="c_password_query_id">秘密の質問</label>
<select name="c_password_query_id">
<option value="">選択してください</option>
({foreach from=$c_password_query_list key=key item=item})
<option value="({$key})">({$item})</option>
({/foreach})
</select>
<label for="c_password_query_answer">秘密の質問の答え</label>
<input type="text" class="input_text" name="c_password_query_answer" value="" placeholder="" />
<p class="caution">※変更する場合のみ入力してください。</p>
</div>
({/if})
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="captcha">確認キーワード</label>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="確認キーワード" /></p>
<p>※上に表示されているキーワードをご記入下さい。</p>
<input type="text" class="input_text" name="captcha" id="captcha" value="" placeholder="" autocapitalize="off" />
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
