<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

<div class="" id="toBookmarkDiaryList"><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})" data-role="button" data-icon="arrow-r" data-iconpos="right" data-mini="false" data-ajax="true">お気に入り最新({$WORD_DIARY})</a></div>

({if $total_num})
({* {{{ recentList *})
<section class="commentListBox recentListBox" id="friendDiaryList" data-role="collapsible-set">
<ul id="diaryListFriend" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$h_diary_list_friend item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
</section>({* recentList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="diaryListFriend({$u})NextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_diary_list_friend_ajax})', 'asc', 'li.diaryList', 'diaryListFriend({$u})NextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({else})
({* {{{ NoData *})
({capture name=headline})({$WORD_MY_FRIEND})最新({$WORD_DIARY})({/capture})
({ext_include file="common/inc_msg.tpl" msg=$smarty.capture.headline|string_format:"%sはありません。"})
({* }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ recentList *})
<section class="commentListBox recentList blogListBox" data-role="collapsible-set">
<h2>({$WORD_MY_FRIEND})最新Blog</h2>
<ul id="recentBlog" class="pictureIconList " data-role="listview" data-inset="false">
({foreach from=$c_rss_cache_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
</section>({* recentList }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
