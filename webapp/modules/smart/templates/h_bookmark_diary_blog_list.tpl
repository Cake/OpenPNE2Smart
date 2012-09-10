<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ simpleBox *})
<section class="simpleBox" id="bookmarkBlogListNoData">
<h3>お気に入り最新({$WORD_DIARY})</h3>
<p>過去30日分のお気に入りの({$WORD_DIARY})を表示します。</p>
</section>({* simpleBox }}} *})

({if $total_num})
({* {{{ recentList *})
<section class="commentListBox recentListBox" id="bookmarkDiaryListBox" data-role="collapsible-set">
<ul id="bookmarkDiaryList" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$bookmark_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
</section>({* recentList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="BookmarkDiaryListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_bookmark_diary_blog_list_ajax})', 'asc', '#({$INC_HEADER_page_name}) li.diaryList', 'BookmarkDiaryListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})
({/if})

({if $bookmark_blog_list})
({* {{{ recentList *})
<section class="commentListBox recentList blogListBox" id="bookmarkBlogList" data-role="collapsible-set">
<h3>お気に入り最新Blog</h3>
<ul id="recentBlog" class="pictureIconList " data-role="listview" data-inset="false">
({foreach from=$bookmark_blog_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
</section>({* recentList }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
