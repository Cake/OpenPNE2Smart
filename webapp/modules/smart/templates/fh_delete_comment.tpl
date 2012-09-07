<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="下記のコメントを削除しますか？"})

({* {{{ commentList *})
<section class="diaryCommentDeleteListBox commentListBox" id="diaryCommentDeleteListBox" data-role="collapsible-set">
<ul id="diary({$target_diary.c_diary_id})CommentDeleteList" class="pictureIconList commentList" data-role="listview" data-inset="false"> 
({foreach from=$target_diary_comment_list item=item})
({ext_include file="inc_fh_diary_comment.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_fh_diary_delete_c_diary_comment _attr='data-ajax="false"'})
<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})">
({foreach from=$target_diary_comment_list item=target_diary_comment})
<input type="hidden" name="target_c_diary_comment_id[]" value="({$target_diary_comment.c_diary_comment_id})">
({/foreach})
<input type="submit" class="input_submit" value="はい">
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block _method=get m=pc a=page_fh_diary})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})">
<input type="submit" class="input_submit" value="いいえ">
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
