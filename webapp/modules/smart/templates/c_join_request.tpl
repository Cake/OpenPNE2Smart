<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="communityJoinRequestForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>この({$WORD_COMMUNITY})に参加</h3>
({t_form_block _enctype=file m=pc a=do_c_join_request_insert_c_commu_member_confirm _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _title="メッセージ (任意)" _body=$body|smarty:nodefaults})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信する" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
