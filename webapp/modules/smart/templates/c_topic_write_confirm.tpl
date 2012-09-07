<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容でよろしいですか？"})

({* {{{ formTable *})<dl>
<dt>本文</dt>
<dd>({$topic_write.body|t_url2a|nl2br|t_decoration})</dd>
({if $topic_write.image_filename1})
<dt>写真1</dt>
<dd>({$topic_write.image_filename1})</dd>
({/if})
({if $topic_write.image_filename2})
<dt>写真2</dt>
<dd>({$topic_write.image_filename2})</dd>
({/if})
({if $topic_write.image_filename3})
<dt>写真3</dt>
<dd>({$topic_write.image_filename3})</dd>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $topic_write.filename4_original_filename})
<dt>ファイル</dt>
<dd>({$topic_write.filename4_original_filename})</dd>
({/if})
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_c_topic_write_insert_c_commu_topic_comment _attr='data-ajax="false"'})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="決定">
({/t_form_block})
({t_form_block m=pc a=page_c_topic_detail _attr='data-ajax="false"'})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
