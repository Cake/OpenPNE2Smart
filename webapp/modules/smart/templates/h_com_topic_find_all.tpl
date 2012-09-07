<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
({* {{{ searchFormLine *})
<section class="searchFormBox" id="searchTopicAllFormBox" data-role="collapsible" data-collapsed="({if $keyword || $requests.type != 'all'})false({else})true({/if})" data-content-theme="c">
<h3>検索</h3>
<p>({t_form_block _method=get m=pc a=page_h_com_topic_find_all})
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label> <input type="search" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" placeholder="">
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索" data-ajax="false">
</div>
({/t_form_block})</p>
<div class="label">絞りこみ</div>
<ul class="ui-grid-b" id="SelectBbsCategory">
<li class="ui-block-a"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" class="({if $search_val_list.type == 'all'}) ui-btn-active({/if})" data-role="button" data-mini="true" data-ajax="false">すべて</a></li>
<li class="ui-block-b"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" class="({if $search_val_list.type == 'topic'}) ui-btn-active({/if})" data-role="button" data-mini="true" data-ajax="false">トピック</a></li>
<li class="ui-block-c"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})" class="({if $search_val_list.type == 'event'}) ui-btn-active({/if})" data-role="button" data-mini="true" data-ajax="false">イベント</a></li>
</ul>
</section>
({* searchFormLine }}} *})

({if $total_num})
({if $keyword || $search_val_list.type != 'all'})<div class="partsHeading"><h4>({$total_num|default:'0'})件が該当しました。</h4></div>({/if})

({* {{{ searchResultList *})<section class="commentListBox searchResultListBox" id="bbsSearchAllResultListBox" data-role="collapsible-set">
<ul id="bbsSearchAllResultList" class="pictureIconList searchResultList" data-role="listview" data-inset="false"> 
({foreach from=$c_commu_topic_search_list item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
</section>({* searchResultList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="bbsSearchAllResultListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_com_topic_find_all_ajax})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})', 'asc', 'li.bbsList', 'bbsSearchAllResultListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>検索結果</h3>
<p>該当する記事はありません。</p>
</section>({* simpleBox }}} *})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
