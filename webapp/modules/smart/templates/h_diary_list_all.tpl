<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({if $c_diary_search_list_count && $keyword})
({capture name=headline})({$WORD_DIARY})検索結果一覧({/capture})
({else})
({capture name=headline})全体の({$WORD_DIARY})({/capture})
({/if})
({ext_include file="common/inc_header.tpl" _headline=$smarty.capture.headline})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ searchFormBox *})
<section class="searchFormBox" id="searchDiaryFormBox" data-role="collapsible" data-collapsed="({if $c_diary_search_list_count && $keyword})false({else})true({/if})" data-content-theme="c">
<h3>({$WORD_DIARY})検索</h3>
<p>({t_form_block _method=get m=pc a=page_h_diary_list_all})
<label for="keyword">キーワード</label> <input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
<input type="submit" class="input_submit" value="　検　索　" />
<a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})">({$WORD_COMMUNITY})検索</a>
({/t_form_block})
</p>
<p class="note">※タイトル、本文より検索をおこないます。スペースで区切ると複数キーワードでの検索ができます。</p>
</section>
({* }}} *})

({if $c_diary_search_list_count})
({* {{{ searchResultList *})
({if $keyword})
<p>({$c_diary_search_list_count})件が該当しました。</p>
({/if})

({* {{{ commentList *})
<section class="commentListBox" id="diaryListAll" data-role="collapsible-set">
<ul id="diaryListAll" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$new_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="diaryListAllNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_diary_list_all_ajax})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})', 'asc', 'li.diaryList', 'diaryListAllNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

({if $c_rss_cache_list})
({* {{{ recentList *})
<section class="commentListBox blogListBox" data-role="collapsible-set">
<h2>最新Blog一覧</h2>
<ul id="recentBlogAll" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$c_rss_cache_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
</section>({* recentList }}} *})
({/if})

({else})
({* {{{ NoList *})
({ext_include file="common/inc_msg.tpl" msg=$WORD_DIARY|string_format:"該当する%sはありません。"})
({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
