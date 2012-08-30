<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="topicAddForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>イベントを作成する</h3>
({t_form_block _enctype=file m=pc a=page_c_event_add_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain">
<label for="title" class="required">タイトル</label>
<input type="text" class="input_text" name="title" value="({$event.title})" size="40" />
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup" data-type="horizontal">
<legend><span class="required">開催日時</span></legend>
<label for="open_date_year">年</label>
<select name="open_date_year" id="open_date_year" data-mini="false">
<option value="">年</option>
({html_options values=$year selected=$event.open_date_year output=$year})
</select> 
<label for="open_date_month">月</label>
<select name="open_date_month"id="open_date_month" data-mini="false">
<option value="">月</option>
({html_options values=$month selected=$event.open_date_month output=$month})
</select>
<label for="open_date_day">日</label>
<select name="open_date_day" id="open_date_day" data-mini="false">
<option value="">日</option>
({html_options values=$day selected=$event.open_date_day output=$day})
</select> 
</fieldset>
<div>
<label for="open_date_comment">補足</label>
<input type="text" class="input_text" name="open_date_comment" value="({$event.open_date_comment})" data-mini="false" />
</div>
</div>
<div data-role="fieldcontain">
<label for="open_pref_id">開催場所</label>
<select name="open_pref_id" id="open_pref_id" data-mini="false">
<option value="0">選択してください</option>
({html_options options=$pref selected=$event.open_pref_id})
</select>
<div>
<label for="open_pref_comment">補足</label>
<input type="text" class="input_text" name="open_pref_comment" value="({$event.open_pref_comment})" data-mini="false" />
</div>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="detail" _show_label=true _label_class="required" _title="詳細" _body=$event.detail|smarty:nodefaults})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup" data-type="horizontal">
<legend><span class="">募集期限</span></legend>
<label for="invite_period_year">年</label>
<select name="invite_period_year" id="invite_period_year" data-mini="false">
<option value="">年</option>
({html_options values=$year selected=$event.invite_period_year output=$year})
</select> 
<label for="invite_period_month">月</label>
<select name="invite_period_month"id="invite_period_month" data-mini="false">
<option value="">月</option>
({html_options values=$month selected=$event.invite_period_month output=$month})
</select>
<label for="invite_period_day">日</label>
<select name="invite_period_day" id="invite_period_day" data-mini="false">
<option value="">日</option>
({html_options values=$day selected=$event.invite_period_day output=$day})
</select> 
</fieldset>
</div>
<div data-role="fieldcontain">
<label for="capacity">募集人数</label>
<input type="text" class="input_text" name="capacity" value="({if $event.capacity})({$event.capacity})({/if})" />
</div>
({if ($is_apple)})
<div data-role="fieldcontain" class="ui-hide-label">
写真は、投稿後にメールで追加できます。
</div>
({else})
<div data-role="fieldcontain">
<label for="image_filename1">写真1</label>
<input type="file" class="input_file" name="image_filename1" />
</div>
<div data-role="fieldcontain">
<label for="image_filename2">写真2</label>
<input type="file" class="input_file" name="image_filename2" />
</div>
<div data-role="fieldcontain">
<label for="image_filename3">写真3</label>
<input type="file" class="input_file" name="image_filename3" />
</div>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div data-role="fieldcontain">
<label for="uploadfile">ファイル</label>
<input type="file" class="input_file" name="uploadfile" />
<p class="caution">※({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})の(({$allowed_extensions}))({/if})ファイルのみアップロードできます。</p>
</div>
({/if})
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
