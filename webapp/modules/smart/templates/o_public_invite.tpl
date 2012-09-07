<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({if $is_smart && $smarty.const.IS_GET_EASY_ACCESS_ID == 3})
({ext_include file="common/inc_msg.tpl" msg="スマートフォンでの登録はできません。"})
({else})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="publicInviteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>新規登録</h3>
<p>メールアドレス({if $smarty.const.OPENPNE_USE_CAPTCHA})と確認キーワード({/if})を入力してください。<br>
入力されたメールアドレス宛に ({$SNS_NAME}) の招待状が送信されます。</p>

({t_form_block _enctype=file m=pc a=do_o_public_invite _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address" class="required">メールアドレス</label>
<input type="email" class="input_text" name="pc_address" id="pc_address" value="" placeholder="メールアドレス" autocapitalize="off">
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address2" class="required">メールアドレス(確認)</label>
<input type="email" class="input_text" name="pc_address2" id="pc_address2" value="" placeholder="メールアドレス(確認)" autocapitalize="off">
</div>
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<div data-role="fieldcontain">
<label for="captcha" class="required">確認キーワード</label>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="確認キーワード"></p>
<p>※上に表示されているキーワードをご記入下さい。</p>
<input type="text" class="input_text" name="captcha" id="captcha" value="" placeholder="" autocapitalize="off">
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信">
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
