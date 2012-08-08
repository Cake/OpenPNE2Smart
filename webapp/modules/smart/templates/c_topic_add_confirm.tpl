<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容でよろしいですか？"})

({* {{{ formTable *})<dl>
<dt>タイトル</dt>
<dd>({$c_topic.title})</dd>
<dt>本文</dt>
<dd>({$c_topic.body|t_url2a|nl2br|t_decoration})</dd>
({if $c_topic.image_filename1})
<dt>写真1</dt>
<dd>({$c_topic.image_filename1})</dd>
({/if})
({if $c_topic.image_filename2})
<dt>写真2</dt>
<dd>({$c_topic.image_filename2})</dd>
({/if})
({if $c_topic.image_filename3})
<dt>写真3</dt>
<dd>({$c_topic.image_filename3})</dd>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $c_topic.filename4_original_filename})
<dt>ファイル</dt>
<dd>({$c_topic.filename4_original_filename})</dd>
({/if})
({/if})
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_c_topic_add_insert_c_commu_topic _attr='data-ajax="false"'})
({foreach from=$c_topic key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="作成" />
({/t_form_block})
({t_form_block m=pc a=page_c_topic_add _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_topic.c_commu_id})" />
({foreach from=$c_topic key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="修正" />
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
