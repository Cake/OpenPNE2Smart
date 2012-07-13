<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({capture name=headline})掲示板一覧({/capture})
({ext_include file="common/inc_header.tpl" _headline=$smarty.capture.headline})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
({* {{{ searchFormLine *})
<section class="searchFormBox" id="searchTopicAllFormBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>掲示板検索</h3>
<p>({t_form_block _method=get m=pc a=page_h_com_topic_find_all})
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label> <input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索" data-icon="search" data-iconshadow="true" data-iconpos="right" />
</div>
({/t_form_block})</p>
<div class="label">絞りこみ</div>
<ul class="ui-grid-b" id="SelectBbsCategory">
<li class="ui-block-a"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" data-role="button">すべて</a></li>
<li class="ui-block-b"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" data-role="button">トピック</a></li>
<li class="ui-block-c"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" data-role="button">イベント</a></li>
</ul>
</section>
({* searchFormLine }}} *})

({if $total_num})
<div class="partsHeading"><h4>({$total_num|default:'0'})件が該当しました。</h4></div>

({* {{{ searchResultList *})
<section class="commentListBox searchResultListBox" id="bbsSearchResultListBox" data-role="collapsible-set">
<ul id="bbsSearchResultList" class="pictureIconList searchResultList" data-role="listview" data-inset="false"> 
({foreach from=$c_commu_topic_search_list item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
</section>({* searchResultList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="searchResultListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_com_topic_find_all_ajax})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})', 'asc', 'li.bbsList', 'searchResultListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>トピック一覧</h3>
<p>該当するトピックはありません。</p>
</section>({* simpleBox }}} *})

({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
