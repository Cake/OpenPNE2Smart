<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容で送りますか？"})

({* {{{ formTable *})<dl>
<dt>送信先</dt>
({foreach from=$c_mail_member item=item})
({counter assign=_cnt})
<dd>({$item.nickname})</dd>
({/foreach})

<dt>メッセージ</dt>
<dd>({$body|t_url2a|nl2br|t_decoration})</dd>
</dl>
<div class="operation">
({t_form_block m=pc a=do_c_event_mail _attr='data-ajax="false"'})
<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="hidden" name="c_member_ids" value="({$c_member_ids})">
<input type="hidden" name="body" value="({$body})">
({foreach from=$c_mail_member item=c_member})
<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})">
({/foreach})
<input type="submit" class="input_submit" value="送信">
({/t_form_block})
({t_form_block m=pc a=page_c_event_mail _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" class="input_submit" value="キャンセル">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
