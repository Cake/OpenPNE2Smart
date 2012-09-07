<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="topicEditForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>トピックを編集する</h3>
({t_form_block _enctype=file m=pc a=do_c_topic_edit_update_c_commu_topic _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="title">タイトル</label>
<input type="text" name="title" id="title" value="({$c_topic.name})" placeholder="タイトル"/>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _body=$c_topic.body|smarty:nodefaults})
({strip})<fieldset data-role="fieldcontain">
<ul class="gallery ui-grid-b" id="topicEdit({$c_topic.c_commu_topic_id})gallery">
({if $c_topic.image_filename1})
<li class="ui-block-a">
<a href="({t_img_url filename=$c_topic.image_filename1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename1 w=76 h=76})" alt=""></a>
</li>
({/if})
({if $c_topic.image_filename2})
<li class="ui-block-b">
<a href="({t_img_url filename=$c_topic.image_filename2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename2 w=76 h=76})" alt=""></a>
</li>
({/if})
({if $c_topic.image_filename3})
<li class="ui-block-c">
<a href="({t_img_url filename=$c_topic.image_filename3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename3 w=76 h=76})" alt=""></a>
</li>
({/if})
</ul>
<ul class="ui-grid-b" id="topicEdit({$c_topic.c_commu_topic_id})operation">
({if $c_topic.image_filename1})
<li class="ui-block-a">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=1&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'deleteTopic({$c_topic.c_commu_topic_id})Image1Confirm'); openDialog('deleteTopic({$c_topic.c_commu_topic_id})Image1Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $c_topic.image_filename2})
<li class="ui-block-b">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=2&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'deleteTopic({$c_topic.c_commu_topic_id})Image2Confirm'); openDialog('deleteTopic({$c_topic.c_commu_topic_id})Image2Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $c_topic.image_filename3})
<li class="ui-block-c">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=3&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'deleteTopic({$c_topic.c_commu_topic_id})Image3Confirm'); openDialog('deleteTopic({$c_topic.c_commu_topic_id})Image3Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
</ul>
({if $c_topic.image_filename1 && $c_topic.image_filename2 && $c_topic.image_filename3})
<p>すでに写真が3枚登録されています。新しい写真を登録する場合は今の写真を削除してください。</p>
({else})
({if ($is_apple)})
<p>({t_mail_post mailto=$mail_address _linktxt=写真をメールで投稿})<br>
({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
1回のメールで登録できる画像は1枚までです。<br>
タイトルと本文は反映されません。<br>
</p>
({else})
({if !$c_topic.image_filename1})
<div data-role="fieldcontain">
<label for="image_filename1">写真1</label>
<input type="file" class="input_file" name="image_filename1">
</div>
({/if})
({if !$c_topic.image_filename2})
<div data-role="fieldcontain">
<label for="image_filename2">写真2</label>
<input type="file" class="input_file" name="image_filename2">
</div>
({/if})
({if !$c_topic.image_filename3})
<div data-role="fieldcontain">
<label for="image_filename3">写真3</label>
<input type="file" class="input_file" name="image_filename3">
</div>
({/if})
({/if})
({/if})
</fieldset>({/strip})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD && (!$is_apple || $c_topic.original_filename)})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="uploadfile">ファイル</label>
({if $c_topic.filename})
({$c_topic.original_filename})
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_file})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'deleteTopic({$c_topic.c_commu_topic_id})FileConfirm'); openDialog('deleteTopic({$c_topic.c_commu_topic_id})FileConfirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
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

({* {{{ formTable *})<section class="formTable" id="topic({$c_topic.c_commu_topic_id})DeleteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>上記のトピックと書き込みを削除する</h3>
({t_form_block m=pc a=page_c_topic_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})


</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
