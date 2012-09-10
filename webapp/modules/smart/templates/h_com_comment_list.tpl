<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $total_num})({* {{{ hCommentRecentListBox *})
<section class="commentListBox recentListBox" id="hCommentRecentListBox" data-role="collapsible-set">
({* {{{ commentList recentList *})<ul id="hCommentRecent" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$h_com_comment_list item=item})
({ext_include file="inc_h_com_comment_list.tpl"})
({/foreach})
</ul>({* commentList }}} *})
</section>

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="hCommentRecentListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_com_comment_list_ajax})', 'asc', '#({$INC_HEADER_page_name}) li.bbsList', 'hCommentRecentListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({* hCommentRecentListBox }}} *})
({else})
({* {{{ simpleBox *})
<section class="simpleBox" id="hCommentRecentListNoMessage">
<p>まだ({$WORD_COMMUNITY})書き込みがありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
