<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容でよろしいですか？"})

({* {{{ formTable *})<dl>
<dt>タイトル</dt>
<dd>({$event.title})</dd>
<dt>開催日時</dt>
<dd>({$event.open_date_year})年({$event.open_date_month})月({$event.open_date_day})日 ({$event.open_date_comment})</dd>
<dt>開催場所</dt>
<dd>({$event.open_pref_value}) ({$event.open_pref_comment})</dd>
<dt>詳細</dt>
<dd>({$event.detail|t_url2a|nl2br|t_decoration})</dd>
<dt>募集期限</dt>
<dd>({if $event.invite_period_year&&$event.invite_period_month&&$event.invite_period_day})
({$event.invite_period_year})年({$event.invite_period_month})月({$event.invite_period_day})日
({/if})</dd>
<dt>募集人数</dt>
<dd>({if $event.capacity})({$event.capacity})人({else})無制限({/if})</dd>
({if $event.image_filename1})
<dt>写真1</dt>
<dd>({$event.image_filename1})</dd>
({/if})
({if $event.image_filename2})
<dt>写真2</dt>
<dd>({$event.image_filename2})</dd>
({/if})
({if $event.image_filename3})
<dt>写真3</dt>
<dd>({$event.image_filename3})</dd>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $event.filename4_original_filename})
<dt>ファイル</dt>
<dd>({$event.filename4_original_filename})</dd>
({/if})
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_c_event_add_insert_c_commu_topic _attr='data-ajax="false"'})
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="作成">
({/t_form_block})
({t_form_block m=pc a=page_c_event_add _attr='data-ajax="false"'})
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
