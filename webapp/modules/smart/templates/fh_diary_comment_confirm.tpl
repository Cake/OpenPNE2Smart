<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="下記のコメントを書き込みますか？"})

({* {{{ formTable *})<dl>
<dt>本文</dt>
<dd>({$form_val.body|t_url2a|nl2br|t_decoration})</dd>
({if $form_val.upfile_1.name})
<dt>写真1</dt>
<dd>({$form_val.upfile_1.name})</dd>
({/if})
({if $form_val.upfile_2.name})
<dt>写真2</dt>
<dd>({$form_val.upfile_2.name})</dd>
({/if})
({if $form_val.upfile_3.name})
<dt>写真3</dt>
<dd>({$form_val.upfile_3.name})</dd>
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_fh_diary_insert_c_diary_comment _attr='data-ajax="false"'})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})">
<input type="hidden" name="subject" value="({$form_val.subject})">
<input type="hidden" name="body" value="({$form_val.body})">
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})">
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})">
<input type="submit" class="input_submit" value="決定">
({/t_form_block})
({t_form_block _enctype=file m=pc a=page_fh_diary _attr='data-ajax="false"'})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})">
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})">
<input type="hidden" name="body" value="({$form_val.body})">
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
