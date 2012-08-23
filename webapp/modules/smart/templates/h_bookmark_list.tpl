<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if !$c_members_num})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>お気に入り</h3>
<p>まだお気に入り登録がありません。</p>
</section>({* simpleBox }}} *})

({else})

({* {{{ searchResultList *})
<section class="searchResultListBox" id="bookmarkListBox" data-role="collapsible-set">
<h3>お気に入り</h3>
<ul id="bookmarkList" class="pictureIconList searchResultList" data-role="listview" data-inset="false" data-split-icon="delete" data-split-theme="c">
({foreach from=$c_members item=item})
({ext_include file="inc_h_member_list.tpl" _type="h_bookmark_list"})
({/foreach})
</ul>
</section>({* searchResultList }}} *})
({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="bookmarkList({$u})NextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_bookmark_list_ajax})', 'asc', 'li.commentList', 'bookmarkList({$u})NextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})
({/if})

<div class="pagerRelative"><a class="" href="({t_url m=pc a=page_h_search})" data-role="button" data-mini="false" data-ajax="true">メンバー検索</a></div>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
