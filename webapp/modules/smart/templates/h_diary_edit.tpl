<script language="JavaScript">
<!--
var is_comment_input = ({$diary.is_comment_input});

$('#h_diary_edit').live('pageinit',function(event){
	$("select#is_comment_input").prop("selectedIndex", is_comment_input);
	$("select#is_comment_input").slider("refresh");
});
//-->
</script>
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="diary({$diary.c_diary_id})EditForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_DIARY})を編集する</h3>
({t_form_block _enctype=file m=pc a=page_h_diary_edit_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_diary_id" value="({$diary.c_diary_id})">
<input type="hidden" name="del_img" value="({$del_img})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="subject" class="required">タイトル</label>
<input type="text" name="subject" id="subject" value="({$diary.subject})" placeholder="タイトル"/>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _label_class="required" _body=$diary.body|smarty:nodefaults})

({strip})<fieldset data-role="fieldcontain">
<ul class="gallery ui-grid-b" id="diaryEdit({$diary.c_diary_id})gallery">
({if $diary.image_filename_1 && !($del_img & 0x01)})
<li class="ui-block-a">
<input type="hidden" name="pre_image_filename_1" value="({$diary.image_filename_1})">
<a href="({t_img_url filename=$diary.image_filename_1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$diary.image_filename_1 w=76 h=76})"></a>
</li>
({/if})
({if $diary.image_filename_2 && !($del_img & 0x02)})
<li class="ui-block-b">
<input type="hidden" name="pre_image_filename_2" value="({$diary.image_filename_2})">
<a href="({t_img_url filename=$diary.image_filename_2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$diary.image_filename_2 w=76 h=76})"></a>
</li>
({/if})
({if $diary.image_filename_3 && !($del_img & 0x04)})
<li class="ui-block-c">
<input type="hidden" name="pre_image_filename_3" value="({$diary.image_filename_3})">
<a href="({t_img_url filename=$diary.image_filename_3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$diary.image_filename_3 w=76 h=76})"></a>
</li>
({/if})
</ul>
<ul class="ui-grid-b" id="diaryEdit({$diary.c_diary_id})operation">
({if $diary.image_filename_1 && !($del_img & 0x01)})
<li class="ui-block-a">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=1&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_diary_edit})&amp;target_c_diary_id=({$diary.c_diary_id})', 'deleteDiary({$diary.c_diary_id})Image1Confirm'); openDialog('deleteDiary({$diary.c_diary_id})Image1Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $diary.image_filename_2 && !($del_img & 0x02)})
<li class="ui-block-b">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=2&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_diary_edit})&amp;target_c_diary_id=({$diary.c_diary_id})', 'deleteDiary({$diary.c_diary_id})Image2Confirm'); openDialog('deleteDiary({$diary.c_diary_id})Image2Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
({if $diary.image_filename_3 && !($del_img & 0x04)})
<li class="ui-block-c">
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_diary_edit_delete_image})&amp;target_c_diary_id=({$diary.c_diary_id})&amp;del_img=3&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_diary_edit})&amp;target_c_diary_id=({$diary.c_diary_id})', 'deleteDiary({$diary.c_diary_id})Image3Confirm'); openDialog('deleteDiary({$diary.c_diary_id})Image3Confirm')" data-role="button" data-mini="true" data-ajax="true">削除</a>
</li>
({/if})
</ul>
({if $diary.image_filename_1 && $diary.image_filename_2 && $diary.image_filename_3})
<p>すでに写真が3枚登録されています。新しい写真を登録する場合は今の写真を削除してください。</p>
({else})
({if ($is_apple)})
<p>({t_mail_post mailto=$mail_address _linktxt=新しい写真をメールで投稿})<br>
({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
写真を添付すると写真付き({$WORD_DIARY})になります。<br>
</p>
({else})
({if !($diary.image_filename_1 && !($del_img & 0x01))})
<div data-role="fieldcontain">
<label for="upfile_1">写真1</label>
<input type="file" class="input_file" name="upfile_1">
</div>
({/if})
({if !($diary.image_filename_2 && !($del_img & 0x02))})
<div data-role="fieldcontain">
<label for="upfile_2">写真2</label>
<input type="file" class="input_file" name="upfile_2">
</div>
({/if})
({if !($diary.image_filename_3 && !($del_img & 0x04))})
<div data-role="fieldcontain">
<label for="upfile_3">写真3</label>
<input type="file" class="input_file" name="upfile_3">
</div>
({/if})
({/if})
({/if})
</fieldset>({/strip})
({if $use_diary_category})
<div data-role="fieldcontain">
<label for="category">カテゴリ</label>
<input type="text" class="input_text" name="category" id="category" value="({foreach from=$category item=item})({$item.category_name}) ({/foreach})">
<select onchange="if(selectedIndex){if(!category.value.match(/\s$/)){category.value += ' '}category.value += options[selectedIndex].value + ' ';}">
<option>カテゴリを選択してください</option>
({foreach from=$category_list item=value})
<option value="({$value.category_name})">({$value.category_name})</option>
({/foreach})
</select>
<p>※カテゴリはひとつにつき全角10文字（半角20文字）以内で入力してください。</p>
<p>※ひとつの({$WORD_DIARY})にカテゴリは5つまで同時に指定することができます。</p>
</div>
({/if})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">公開範囲</span></legend>
<input type="radio" name="public_flag" id="public_flag_public" value="public"({if $diary.public_flag == "public"}) checked="checked"({/if})>
	<label for="public_flag_public">全員に公開</label>
	<input type="radio" name="public_flag" id="public_flag_friend" value="friend"({if $diary.public_flag == "friend"}) checked="checked"({/if})>
	<label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" name="public_flag" id="public_flag_private" value="private"({if $diary.public_flag == "private"}) checked="checked"({/if})>
	<label for="public_flag_private">公開しない</label>
</fieldset>
</div>
({if $smarty.const.OPENPNE_USE_DIARY_COMMENT})
<div data-role="containing-element">
<label for="is_comment_input" class="required">コメント許可</label>
<select name="is_comment_input" id="is_comment_input" data-role="slider">
	<option value="0"({if $diary.is_comment_input=="0"}) checked="checked"({/if})>許可しない</option>
	<option value="1"({if $diary.is_comment_input=="1"}) checked="checked"({/if})>許可する</option>
</select>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})

({* {{{ formTable *})<section class="formTable" id="diary({$diary.c_diary_id})DeleteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_DIARY})を削除する</h3>
<p>({$WORD_DIARY})を削除するとこの({$WORD_DIARY})に書かれたコメントもすべて削除されます。</p>
({t_form_block m=pc a=page_h_delete_diary})
<input type="hidden" name="target_c_diary_id" value="({$diary.c_diary_id})">
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
