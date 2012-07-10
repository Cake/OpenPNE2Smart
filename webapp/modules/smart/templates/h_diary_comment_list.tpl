<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({capture name=headline})({$WORD_DIARY})コメント記入履歴({/capture})
({ext_include file="common/inc_header.tpl" _headline=$smarty.capture.headline})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $total_num})
({* {{{ commentList *})
<section class="commentListBox" id="diaryCommentHistoryListBox" data-role="collapsible-set">
<ul id="diaryHistoryCommentList" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$h_diary_comment_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="diaryCommentHistoryListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_diary_comment_list_ajax})', 'asc', 'li.diaryList', 'diaryCommentListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({else})
({* {{{ NoData *})
({ext_include file="common/inc_msg.tpl" msg=$smarty.capture.headline|string_format:"まだ%sはありません。"})
({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
