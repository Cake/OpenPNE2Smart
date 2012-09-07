<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容で送りますか？"})

({* {{{ formTable *})<dl>
<section class="authorBar" id="messageTo({$target_member.target_c_member_id})">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image})" class="memberPhoto" alt=""></a></div>
<div class="itemData">
<div class="title"><span>({$target_member.nickname})さん</span></div>
</div>
</section>
<dt>件名</dt>
<dd>({$form_val.subject})</dd>
<dt>メッセージ</dt>
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
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $form_val.upfile_4.name})
<dt>ファイル</dt>
<dd>({$form_val.upfile_4.name})</dd>
({/if})
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_f_message_send_insert_c_message _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id_to" value="({$target_member.c_member_id})">
<input type="hidden" name="subject" value="({$form_val.subject})">
<input type="hidden" name="body" value="({$form_val.body})">
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})">
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})">
<input type="hidden" name="tmpfile_4" value="({$form_val.tmpfile_4})">
<input type="hidden" name="tmpfile_4_original_filename" value="({$form_val.upfile_4.name})">
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})">
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})">
<input type="submit" class="input_submit" value="送信">
({/t_form_block})
({t_form_block m=pc a=page_f_message_send _attr='data-ajax="false"'})
<input type="hidden" name="is_syusei" value="1">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<input type="hidden" name="subject" value="({$form_val.subject})">
<input type="hidden" name="body" value="({$form_val.body})">
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})">
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})">
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
