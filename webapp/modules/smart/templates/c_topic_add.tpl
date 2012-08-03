<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="topicAddForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>トピックを作成する</h3>
({t_form_block _enctype=file m=pc a=page_c_topic_add_confirm  _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain" class="ui-hide-label">
<label for="title">タイトル</label>
<input type="text" name="title" id="title" value="({$title})" placeholder="タイトル"/>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _body=$body|smarty:nodefaults})

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
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div data-role="fieldcontain">
<label for="uploadfile">ファイル</label>
<input type="file" class="input_file" name="uploadfile" size="40" />
<p class="caution">※({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})の(({$allowed_extensions}))({/if})ファイルのみアップロードできます。</p>
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
