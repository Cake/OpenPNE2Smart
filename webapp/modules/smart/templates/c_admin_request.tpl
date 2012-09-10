<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="communityAdminRequestForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>管理者交代依頼</h3>
({t_form_block _enctype=file m=pc a=page_c_admin_request_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})">
<div class="photo76"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})"><img src="({t_img_url filename=$member.image_filename w=76 h=76 noimg=no_image})" class="memberPhoto" alt="プロフィール写真"></a></div>
<div class="itemData">
<p class="nameBody"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})">({$member.nickname})</a>さんに管理者交代依頼メッセージを送信します。</p>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _title="メッセージ (任意)" _body=$body|smarty:nodefaults})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
