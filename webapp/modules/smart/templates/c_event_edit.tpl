<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="eventEditForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>イベントを編集する</h3>
({t_form_block _enctype=file m=pc a=do_c_event_edit_update_c_commu_topic _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})">
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<div data-role="fieldcontain">
<label for="title" class="required">タイトル</label>
<input type="text" class="input_text" name="title" value="({$event.name})" size="40">
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
<input type="text" class="input_text" name="open_date_comment" value="({$event.open_date_comment})" data-mini="false">
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
<input type="text" class="input_text" name="open_pref_comment" value="({$event.open_pref_comment})" data-mini="false">
</div>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="detail" _show_label=true _label_class="required" _title="詳細" _body=$event.body|smarty:nodefaults})
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
<input type="text" class="input_text" name="capacity" value="({if $event.capacity})({$event.capacity})({/if})">
</div>
({strip})<fieldset data-role="fieldcontain">
<ul class="gallery ui-grid-b" id="eventEdit({$event.c_commu_topic_id})gallery">
({if $event.image_filename1})
<li class="ui-block-a">
<a href="({t_img_url filename=$event.image_filename1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$event.image_filename1 w=76 h=76})" alt=""></a>
</li>
({/if})
({if $event.image_filename2})
<li class="ui-block-b">
<a href="({t_img_url filename=$event.image_filename2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$event.image_filename2 w=76 h=76})" alt=""></a>
</li>
({/if})
({if $event.image_filename3})
<li class="ui-block-c">
<a href="({t_img_url filename=$event.image_filename3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$event.image_filename3 w=76 h=76})" alt=""></a>
</li>
({/if})
</ul>
<ul class="ui-grid-b" id="eventEdit({$event.c_commu_topic_id})operation">
({if $event.image_filename1})
<li class="ui-block-a">
<a title="削除" class="" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_event_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;pic_delete=1&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_event_edit})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})', 'deleteEvent({$event.c_commu_topic_id})Image1Confirm'); openDialog('deleteEvent({$event.c_commu_topic_id})Image1Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $event.image_filename2})
<li class="ui-block-b">
<a title="削除" class="" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_event_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;pic_delete=2&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_event_edit})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})', 'deleteEvent({$event.c_commu_topic_id})Image2Confirm'); openDialog('deleteEvent({$event.c_commu_topic_id})Image2Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $event.image_filename3})
<li class="ui-block-c">
<a title="削除" class="" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_event_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;pic_delete=3&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_event_edit})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})', 'deleteEvent({$event.c_commu_topic_id})Image3Confirm'); openDialog('deleteEvent({$event.c_commu_topic_id})Image3Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
</ul>
({if $event.image_filename1 && $event.image_filename2 && $event.image_filename3})
<p>すでに写真が3枚登録されています。新しい写真を登録する場合は今の写真を削除してください。</p>
({else})
({if ($is_apple)})
<p>({t_mail_post mailto=$mail_address _linktxt=写真をメールで投稿})<br>
({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
1回のメールで登録できる画像は1枚までです。<br>
タイトルと本文は反映されません。<br>
</p>
({else})
({if !$event.image_filename1})
<div data-role="fieldcontain">
<label for="image_filename1">写真1</label>
<input type="file" class="input_file" name="image_filename1">
</div>
({/if})
({if !$event.image_filename2})
<div data-role="fieldcontain">
<label for="image_filename2">写真2</label>
<input type="file" class="input_file" name="image_filename2">
</div>
({/if})
({if !$event.image_filename3})
<div data-role="fieldcontain">
<label for="image_filename3">写真3</label>
<input type="file" class="input_file" name="image_filename3">
</div>
({/if})
({/if})
({/if})
</fieldset>({/strip})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD && (!$is_apple || $event.original_filename)})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="uploadfile">ファイル</label>
({if $event.filename})
({$event.original_filename})
<a title="削除" class="" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_event_edit_delete_c_commu_topic_comment_file})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_event_edit})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})', 'deleteEvent({$event.c_commu_topic_id})FileConfirm'); openDialog('deleteEvent({$event.c_commu_topic_id})FileConfirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
({else})
({if !($is_apple)})
<input type="file" class="input_file" name="filename4" size="40">
<p class="caution">※({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})の(({$allowed_extensions}))({/if})ファイルのみアップロードできます。</p>
({/if})
({/if})
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})

({* {{{ formTable *})<section class="formTable" id="event({$event.c_commu_topic_id})DeleteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>イベントを削除する</h3>
<p>削除の際はトラブル等を避けるため、あらかじめ参加者へ削除を告知してください。</p>
({t_form_block m=pc a=page_c_event_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})


</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
