<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="下記の書き込みを削除しますか？"})

({* {{{ commentList *})
<section class="topicWriteDeleteListBox commentListBox" id="eventWrite({$c_commu_topic_comment.c_commu_topic_comment_id})DeleteListBox" data-role="collapsible-set">
<ul id="eventWrite({$c_commu_topic_comment.c_commu_topic_comment_id})DeleteList" class="pictureIconList commentList" data-role="listview" data-inset="false"> 
({ext_include file="inc_c_bbs_write.tpl" item=$c_commu_topic_comment noButton=true})
</ul>
</section>({* commentList }}} *})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic_comment _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment.c_commu_topic_comment_id})">
<input type="submit" class="input_submit" value="はい">
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block _method=get m=pc a=page_c_event_detail})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" class="input_submit" value="いいえ">
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
