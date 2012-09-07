<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

<section class="authorBar" id="diaryAuthor">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image})" class="memberPhoto" alt=""></a></div>
<div class="itemData">
<div class="title">({$target_member.nickname})さん</div>
</div>
</section>

({if $f_invite_list})
({* {{{ formTable *})<section class="formTable" id="communityInviteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_MY_FRIEND})にこの人を紹介する</h3>
<p>この人を紹介したい({$WORD_MY_FRIEND})を一覧から選び、紹介するメッセージを書いてください。</p>
({t_form_block m=pc a=do_f_invite_insert_c_message_friend_invite _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">紹介先</span></legend>
({foreach from=$f_invite_list item=c_invite})
<input type="checkbox" class="input_checkbox" id="m({$c_invite.c_member_id})" name="c_member_id_list[]" value="({$c_invite.c_member_id})">
<label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label>
({/foreach})
</fieldset>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _label_class="required" _title="メッセージ "})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信">
</div>
({/t_form_block})
</section>({* formTable }}} *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_MY_FRIEND})にこの人を紹介する</h3>
<p>紹介できる({$WORD_MY_FRIEND})がいません。</p>
</section>({* simpleBox }}} *})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
