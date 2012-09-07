<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容で招待メールを送信しますか？"})

({* {{{ formTable *})<dl>
<dt>相手のメールアドレス</dt>
<dd>({$form_val.mail})</dd>
<dt>メッセージ(任意)</dt>
<dd>({$form_val.message|t_url2a|nl2br|t_decoration})</dd>
</dl>
<div class="operation">
({t_form_block m=pc a=do_h_invite_insert_c_invite _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id_to" value="({$target_member.c_member_id})">
<input type="hidden" name="mail" value="({$form_val.mail})">
<input type="hidden" name="message" value="({$form_val.message})">
<input type="hidden" name="captcha_confirm" value="({$captcha_confirm})">
<input type="submit" class="input_submit" value="送信">
({/t_form_block})
({t_form_block m=pc a=page_h_invite _attr='data-ajax="false"'})
<input type="hidden" name="mail" value="({$form_val.mail})">
<input type="hidden" name="message" value="({$form_val.message})">
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
