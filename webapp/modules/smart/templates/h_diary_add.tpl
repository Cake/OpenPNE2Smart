<script language="JavaScript">
<!--
var is_comment_input = ({$requests.is_comment_input});

$('#h_diary_add').live('pageinit',function(event){
	$("select#is_comment_input").prop("selectedIndex", is_comment_input);
	$("select#is_comment_input").slider("refresh");
});
//-->
</script>
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="diaryAddForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_DIARY})を書く</h3>
({t_form_block _enctype=file m=pc a=page_h_diary_add_confirm _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="subject">タイトル</label>
<input type="text" name="subject" id="subject" value="({$form_val.subject})" placeholder="タイトル"/>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _label_class="required" _body=$form_val.body|smarty:nodefaults})

({if ($is_apple)})
<div data-role="fieldcontain" class="ui-hide-label">
写真は、日記投稿後にメールで追加編集できます。
</div>
({else})
<div data-role="fieldcontain">
<label for="upfile_1">写真1</label>
<input type="file" class="input_file" name="upfile_1" />
</div>
<div data-role="fieldcontain">
<label for="upfile_2">写真2</label>
<input type="file" class="input_file" name="upfile_2" />
</div>
<div data-role="fieldcontain">
<label for="upfile_3">写真3</label>
<input type="file" class="input_file" name="upfile_3" />
</div>
({/if})
({if $use_diary_category})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="category">カテゴリ</label>
<input type="text" name="category" id="category" value="({$form_val.category})" placeholder="カテゴリ"/>
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
<input type="radio" name="public_flag" id="public_flag_public" value="public"({if $form_val.public_flag == "public"}) checked="checked"({/if}) />
	<label for="public_flag_public">全員に公開</label>
	<input type="radio" name="public_flag" id="public_flag_friend" value="friend"({if $form_val.public_flag == "friend"}) checked="checked"({/if}) />
	<label for="public_flag_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" name="public_flag" id="public_flag_private" value="private"({if $form_val.public_flag == "private"}) checked="checked"({/if}) />
	<label for="public_flag_private">公開しない</label>
</fieldset>
</div>
({if $smarty.const.OPENPNE_USE_DIARY_COMMENT})
<div data-role="containing-element">
<label for="is_comment_input" class="required">コメント許可</label>
<select name="is_comment_input" id="is_comment_input" data-role="slider">
	<option value="0"({if !$form_val.is_comment_input}) checked="checked"({/if})>許可しない</option>
	<option value="1"({if $form_val.is_comment_input}) checked="checked"({/if})>許可する</option>
</select>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

<section class="formTable" id="diaryAddMail">
({t_mail_post mailto=$mail_address _type=button})
<p>({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
写真を添付すると写真付き({$WORD_DIARY})になります。<br>
</p>
</section>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})