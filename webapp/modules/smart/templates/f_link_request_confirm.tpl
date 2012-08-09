<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下のメッセージを送信しますか？"})

({* {{{ formTable *})<dl>
<section class="authorBar" id="messageTo({$target_member.target_c_member_id})">
<p>
({$target_member.nickname}) さんとは既にお知り合いですか？<br />
({$WORD_MY_FRIEND})リンク申請メッセージを送信し、承諾を受けてください。<br />
※交流の無い方へいきなりリンク申請を送るのは、失礼になる場合もあります。十分に確認して、リンク申請をおこなってください。
</p>
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image})" alt=""></a></div>
<div class="itemData">
<div class="title"><span>({$target_member.nickname})さん</span></div>
</div>
</section>
<dt>メッセージ (任意)</dt>
<dd>({$form.body|t_url2a|nl2br|t_decoration})</dd>
</dl>
<div class="operation">
({t_form_block m=pc a=do_f_link_request_insert_c_friend_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="送信" />
({/t_form_block})
({t_form_block m=pc a=page_f_link_request _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="修正" />
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
