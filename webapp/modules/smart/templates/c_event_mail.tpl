<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if !$c_event_member_list})
({* {{{ simpleBox *})<section class="simpleBox" id="eventMailNoavailableComment">
<h3>参加者へ一括メッセージ</h3>
<p>送信するメンバーがいません。</p>
</section>({* simpleBox }}} *})

({else})
({* {{{ formTable *})<section class="formTable" id="eventMailForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>参加者へ一括メッセージ</h3>
({t_form_block _enctype=file m=pc a=page_c_event_mail_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">送信先</span></legend>
({foreach from=$c_event_member_list item=item})
<input type="checkbox" class="input_checkbox" id="m({$item.c_member_id})" name="c_member_id[]" value="({$item.c_member_id})" checked="checked">
<label for="m({$item.c_member_id})">({$item.nickname})</label>
({/foreach})
</fieldset>
</div>
<div data-role="fieldcontain">
<label for="eventMailBody" class="required">メッセージ</label>
<textarea name="body" id="eventMailBody" rows="6" cols="50"></textarea>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})

<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})" data-role="button" data-direction="reverse">イベントへ戻る</a>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
