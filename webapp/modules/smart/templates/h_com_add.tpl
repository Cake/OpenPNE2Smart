<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="communityAddForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})新規作成</h3>
({t_form_block _enctype=file m=pc a=page_h_com_add_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain">
<label for="title" class="required">({$WORD_COMMUNITY})名</label>
<input type="text" class="input_text" name="name" value="({$form_val.name})" placeholder="" />
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>カテゴリ</legend>
<select name="c_commu_category_id" id="c_commu_category_id" data-mini="false">
<option value="">選択してください</option>
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $form_val.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select> 
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>参加条件</legend>
<input type="radio" class="input_radio" name="is_admit" id="is_admit_public" value="public"({if $form_val.is_admit=="public" || !$form_val.is_admit}) checked="checked"({/if}) />
<label for="is_admit_public">誰でも参加可能</label>
<input type="radio" class="input_radio" name="is_admit" id="is_admit_auth" value="auth"({if $form_val.is_admit=="auth"}) checked="checked"({/if}) />
<label for="is_admit_auth">管理者の承認が必要</label>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>公開範囲</legend>
<input type="radio" class="input_radio" name="is_open" id="is_open_public" value="public"({if $form_val.is_open=="public" || !$form_val.is_open}) checked="checked"({/if}) /><label for="is_open_public">全員に公開</label>
<input type="radio" class="input_radio" name="is_open" id="is_open_member" value="member"({if $form_val.is_open=="member"}) checked="checked"({/if}) /><label for="is_open_member">({$WORD_COMMUNITY})参加者にのみ公開</label>
</fieldset>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="info" _show_label=true _label_class="required" _title="$WORD_COMMUNITY説明文" _body=$form_val.info|smarty:nodefaults})
({if ($is_apple)})
<div data-role="fieldcontain" class="ui-hide-label">
写真は、投稿後にメールで追加できます。
</div>
({else})
<div data-role="fieldcontain">
<label for="image_filename">写真</label>
<input type="file" class="input_file" name="image_filename" />
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
