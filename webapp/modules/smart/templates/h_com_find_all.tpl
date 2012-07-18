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

({capture name=searchFormBox})({* {{{ searchFormBox *})<section class="searchFormBox" id="searchCommunityAllFormBox" data-role="collapsible-set" data-content-theme="c" data-inset="true">
({* {{{ searchCommunityAllSort *})<section id="searchCommunityAllSort" data-role="collapsible" data-collapsed="({if $keyword || $requests.category_id})false({else})true({/if})">
<h3>({$WORD_COMMUNITY})検索</h3>
<div data-role="collapsible" data-collapsed="false">
<h4>並び替え</h4>
<ul class="ui-grid-a" id="comunitySort">
<li class="ui-block-a"><a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=count&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})" class="({if $requests.val_order == 'count'}) ui-btn-active({/if})" data-role="button" data-mini="true" data-ajax="false">メンバー数順</a></li>
<li class="ui-block-b"><a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})" class="({if $requests.val_order == 'r_datetime'}) ui-btn-active({/if})" data-role="button" data-mini="true" data-ajax="false">作成日順</a></li>
</ul>
</div>
({* {{{ searchCommunityAll *})<div class="searchFormBox" id="searchCommunityAll" data-role="collapsible" data-collapsed="({if $keyword || $requests.category_id})false({else})true({/if})">
<h4>({$WORD_COMMUNITY})検索</h4>
({t_form_block _method=get m=pc a=page_h_com_find_all})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label>
<input type="search" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" placeholder="キーワード" />
</div>
<div data-role="fieldcontain">
<label for="category">カテゴリ</label>
<select name="category_id" id="category_id">
<option value="0">指定なし</option>
({foreach from=$c_commu_category_list item=parent})
({foreach from=$parent item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $search_val_list.category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
({/foreach})
</select>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索" data-ajax="false" />
</div>
({/t_form_block})
</div>({* searchCommunityAll }}} *})
<div id="categorySelect" data-role="collapsible">
<h4 class="label">カテゴリ絞込み</h4>
<div data-role="listview">
({foreach from=$c_commu_category_parent_list item=item_parent})
<li data-role="list-divider">({$item_parent.name})</li>
({foreach name=cccl from=$c_commu_category_list[$item_parent.c_commu_category_parent_id] item=item_cat})
<li><a href="({t_url m=pc a=page_h_com_find_all})&amp;order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$item_cat.c_commu_category_id})" data-ajax="false">({$item_cat.name})<span class="ui-li-count">({$item_cat.count_commu_category})</span></a></li>
({/foreach})
({/foreach})
</div>
</div>
</section>({* searchCommunityAllSort }}} *})
({if $c_commu_category_is_create_commu})
({* {{{ searchCommunityAlloperation *})<div id="searchCommunityAlloperation" data-role="collapsible" data-collapsed="true">
<h4>新規作成</h4>
<a href="({t_url m=pc a=page_h_com_add})" data-role="button">新規作成</a>
<p>作成の前に、似た({$WORD_COMMUNITY})がないかご確認ください</p></div>
({/if})
</section>
({* searchFormBox }}} *})({/capture})

({capture name=searchResult})({* {{{ simpleBox *})<section class="simpleBox" id="CommunityNoavailableComment" data-role="">
<h3>({$WORD_COMMUNITY})({if $keyword || $requests.category_id != '0'})検索結果({else})一覧({/if})</h3>
<p>({$total_num|default:'0'})件が該当しました。</p>
</section>({* simpleBox }}} *})

({* {{{ searchResultList *})<section class="commentListBox searchResultListBox" id="communitySearchResultListBox" data-role="collapsible-set">
<ul id="communitySearchResultList" class="pictureIconList searchResultList" data-role="listview" data-inset="false"> 
({foreach from=$c_commu_search_list item=item})
({ext_include file="inc_c_com_list.tpl"})
({/foreach})
</ul>
</section>({* searchResultList }}} *})
({strip})
({if $is_next})
<div class="pagerRelative" id="communitySearchResult({$u})NextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_com_find_all_ajax})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})', 'asc', 'li.commentList', 'communitySearchResult({$u})NextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></span>
</div>
({/if})
({/strip})
({/capture})

({if $keyword || $requests.category_id != '0'})
({$smarty.capture.searchResult|smarty:nodefaults})
({$smarty.capture.searchFormBox|smarty:nodefaults})
({else})
({$smarty.capture.searchFormBox|smarty:nodefaults})
({$smarty.capture.searchResult|smarty:nodefaults})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
