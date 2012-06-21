({* {{{ nav *})<nav id="LeftNav" data-role="content" class="ui-nav ui-bar-a">
({* {{{ LayoutB *})({strip})
({* {{{ Diary *})({if 
	$INC_HEADER_page_name == 'fh_diary'
})<div id="diaryNav" data-role="collapsible-set">
({* {{{ recentlyDiary *})<div id="recentlyDiary" data-role="collapsible" data-collapsed="true">
<h3>最近の({$WORD_DIARY})</h3>
<ul class="ui-listview" data-role="listview"> 
({foreach from=$new_diary_list item=item})
<li><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>({* recentlyDiary }}} *})
({* {{{ recentlyComment *})<div id="recentlyComment" data-role="collapsible" data-collapsed="true">
<h3>最近のコメント</h3>
<ul class="ui-listview" data-role="listview"> 
<li><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})">一覧を見る</a></li>
</ul>
</div>({* recentlyComment }}} *})
({* {{{ monthlyDiary *})<div id="monthlyDiary" data-role="collapsible" data-collapsed="true">
<h3>各月の({$WORD_DIARY})</h3>
<ul class="ui-listview" data-role="listview"> 
({foreach from=$date_list item=item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$item.year})&amp;month=({$item.month})">({$item.year})年({$item.month})月の一覧</a></li>
({/foreach})
</ul>
</div>({* monthlyDiary }}} *})
({* {{{ listCategory *})<div id="listCategory" data-role="collapsible" data-collapsed="true">
<h3>カテゴリ一覧</h3>
<ul class="ui-listview" data-role="listview"> 
({foreach from=$category item=category_item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_diary_category_id})">({$category_item.category_name})</a></li>
({/foreach})
</ul>
</div>({* listCategory }}} *})
</div>({/if})({* Diary}}} *})

({/strip})({* LayoutB }}} *})

({if $smarty.const.DISPLAY_SEARCH_HOME})({strip})
({* {{{ searchFormLine *})
<div class="searchFormLine">
({t_form_block m=pc a=do_h_home_search})
<input type="text" class="input_text search" data-type="search" name="q" value="" size="30" data-role="fieldcontain" data-mini="true" placeholder="検索">
<input type="button" src="({t_img_url_skin filename=button_search_1})" value="diary" alt="({$WORD_DIARY})" name="diary" data-inline="true">
<input type="button" src="({t_img_url_skin filename=button_search_2})" value="community" alt="({$WORD_COMMUNITY})" name="community" data-inline="true">
</ul>
({/t_form_block})
</div>
({* }}} *})
({/strip})({/if})
({if $inc_navi})({* {{{ pageNav *})({strip})({$inc_navi|smarty:nodefaults})({/strip})({* pageNav }}} *})({/if})
({* {{{ globalNav *})({if $before_after == "after"})({strip})
<ul id="({if $before_after == "after"})globalNav({else})globalNavBefore({/if})" data-role="controlgroup">
({foreach from=$INC_HEADER_global_navi key=key item=item})
({if $item.url})
<li id="globalNav_({$key+1})"><a href="({$item.url})" data-role="button" data-icon="arrow-r" data-iconpos="right">({$item.caption})</a></li>
({/if})
({/foreach})
<li id="globalNav_9"><a href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})" data-role="button" data-icon="arrow-r" data-iconpos="right">ログアウト </a></li>
</ul>
({/strip})({/if})({* globalNav }}} *})
</nav>({* nav }}} *})
