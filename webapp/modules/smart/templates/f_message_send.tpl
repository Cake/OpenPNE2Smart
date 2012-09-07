<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="messageForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>メッセージを送る</h3>
<p>※SPAM、荒らし等のメッセージは禁止しております。</p>
<section class="authorBar" id="messageTo({$target_member.target_c_member_id})">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=48 h=48 noimg=no_image})" class="memberPhoto" alt=""></a></div>
<div class="itemData">
<div class="title"><span>({$target_member.nickname})さん</span></div>
</div>
</section>
({t_form_block _enctype=file m=pc a=page_f_message_send_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})">
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})">
<input type="hidden" name="box" value="({$box})">
<div data-role="fieldcontain">
<label for="subject">件名</label>
<input type="text" name="subject" id="subject" value="({$form_val.subject})" placeholder=""/>
</div>
<div data-role="fieldcontain">
<label for="messageBody" class="required">メッセージ</label>
<textarea name="body" id="MessageBody" rows="6" cols="50">({$form_val.body})</textarea>
</div>
({if !($is_apple)})
<div data-role="fieldcontain">
<laber for="upfile_1">写真1</label><input type="file" class="input_file" name="upfile_1" size="40"><br>
<laber for="upfile_2">写真2</label><input type="file" class="input_file" name="upfile_2" size="40"><br>
<laber for="upfile_3">写真3</label><input type="file" class="input_file" name="upfile_3" size="40"><br>
</div>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div data-role="fieldcontain">
<laber for="uploadfile">ファイル</label><input type="file" class="input_file" name="uploadfile" size="40">
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</div>
({/if})
({/if})
<div data-role="fieldcontain">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面"></li>
<li><input type="submit" class="input_submit" name="save" value="下書き保存"></li>
</ul>
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
