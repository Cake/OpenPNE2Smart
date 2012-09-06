<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg=$target_c_member.nickname|string_format:"%sさんに管理者交代依頼メッセージを送信します。よろしいですか？"})

({* {{{ formTable *})<dl>
<dt>送信先</dt>
<dd><img src="({t_img_url filename=$target_c_member.image_filename w=76 h=76 noimg=no_image})" class="memberPhoto" alt="" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})">({$target_c_member.nickname})</a>さん</dd>
<dt>メッセージ (任意)</dt>
<dd>({$body|t_url2a|nl2br|t_decoration})</dd>
</dl>
<div class="operation">
({t_form_block m=pc a=do_c_admin_request_insert_c_commu_admin_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="送信" />
({/t_form_block})
({t_form_block m=pc a=page_c_admin_request _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="修正" />
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
