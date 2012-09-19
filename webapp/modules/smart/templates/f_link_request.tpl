<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

<section class="authorBar" id="diaryAuthor">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image trim=square})" class="memberPhoto" alt="プロフィール写真"></a></div>
<div class="itemData">
<div class="title">({$target_member.nickname})さん</div>
</div>
</section>

({* {{{ formTable *})<section class="formTable" id="member({$target_member.c_member_id})FriendRequestForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_MY_FRIEND})に追加</h3>
<p>({$target_member.nickname}) さんとは既にお知り合いですか？<br>
({$WORD_MY_FRIEND})リンク申請メッセージを送信し、承諾を受けてください。<br>
※交流の無い方へいきなりリンク申請を送るのは、失礼になる場合もあります。十分に確認して、リンク申請をおこなってください。
</p>
({t_form_block m=pc a=page_f_link_request_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _title="メッセージ (任意)" _body=$form.body|smarty:nodefaults})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
