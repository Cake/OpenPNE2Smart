<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $pager.total_num})
<section class="searchResultListBox" id="memberSearchResultListBox" data-role="collapsible-set">
<h3>検索結果一覧</h3>
<p>({$pager.total_num})名が該当しました。</p>

<ul id="memberSearchResultList" class="pictureIconList searchResultList" data-role="listview" data-inset="false" data-split-icon="delete" data-split-theme="c">
({foreach from=$target_friend_list item=item})
({ext_include file="inc_h_member_list.tpl" _type="h_search_result"})
({/foreach})
</ul>
</section>({* searchResultList }}} *})
({* {{{ Pager *})({strip})
({if $pager.page_next})
<div class="pagerRelative" id="memberSearchResultListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_search_result_ajax})&amp;({$search_condition})', 'asc', '#({$INC_HEADER_page_name}) li.commentList', 'memberSearchResultListNextPager', '({$pager.total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})
({* {{{ searchResultList *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment">
<h3>メンバー検索</h3>
<p>該当するメンバーはいませんでした。</p>
</section>({* simpleBox }}} *})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
