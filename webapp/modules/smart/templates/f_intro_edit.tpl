<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

<section class="authorBar" id="diaryAuthor">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image})" alt=""></a></div>
<div class="itemData">
<div class="title">({$target_member.nickname})さん</div>
</div>
</section>

({* {{{ formTable *})<section class="formTable" id="member({$target_member.c_member_id})IntroEditForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>紹介文を作成する</h3>
({t_form_block _enctype=file m=pc a=do_f_intro_edit_update_c_friend  _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _label_class="required" _title="紹介文" _body=$intro_body|smarty:nodefaults})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="作成" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
