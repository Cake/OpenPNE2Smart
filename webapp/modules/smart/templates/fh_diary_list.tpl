<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl" _headline=$target_diary.subject})
<div class="content" data-role="content">({* {{{ content *})

<section class="authorBar" id="diaryAuthor">
<div class="memberPhoto36"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=36 h=36 noimg=no_image})" alt=""></a></div>
<div class="memberData">
<div class="title">
<h2><span>({$target_member.nickname})({if $type == "f"})さん({/if})の({$WORD_DIARY})({if !$all})({if !$category}) ({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})({/if})({$category_name})({/if})</span> <span class="pagerRelative">全({$total_num})件</span></h2>
</div>
</section>

({if $type == "h"})
<div id="writeDiaryBodyBox" data-role="collapsible">
<h3>({$WORD_DIARY})を書く</h3>
<ul class="ui-listview" data-role="listview" data-inset="true"> 
<li><a href="({t_url m=pc a=page_h_diary_add})">フォームから書く</a></li>
<li>({t_mail_post mailto=$mail_address})
<p>({$SNS_NAME})に登録した<br>アドレスから投稿してください。<br>
写真を添付すると写真付き({$WORD_DIARY})になります。<br>
</p></li>
</ul>
</div>
({/if})

({if $target_diary_list})
({* {{{ commentList *})
<section class="parts commentList" id="diaryList" data-role="collapsible-set">
({* {{{ Pager *})({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if $category_id})&amp;category_id=({$category_id})({elseif !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">前を表示</a></p>({/if})
<p class="number">
({$total_num})件中 ({$page*$page_size-$page_size+1})件～
({if $page_size > $diary_list_count})
({$diary_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
件を表示
</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if $category_id})&amp;category_id=({$category_id})({elseif !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})({* Pager }}} *})
({$smarty.capture.pager|smarty:nodefaults})

<ul class="ui-listview" data-role="listview"> 
({foreach from=$target_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>

({$smarty.capture.pager|smarty:nodefaults})

</section>
({* }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ recentList *})
<section class="ecentList" id="blog">
<h2>({strip})
({if !$all})
({$target_member.nickname})({if $type == "f"})さん({/if})({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})のBlog
({else})
({$target_member.nickname})({if $type == "f"})さん({/if})のBlog
({/if})
({/strip})</h2>
<ul class="ui-listview" data-role="listview" data-inset="true"> 
({foreach from=$c_rss_cache_list item=item})
<li><a class="rssListItem" href="({$item.link})" rel="external" target="_blank">
<h3>({$item.subject})</h3>
<p class="ui-li-aside">({$item.r_datetime|date_format:"%m月%d日<br>%H:%M"})</p>
({/foreach})
</ul>
</section>
({* }}} *})
({/if})

({ext_include file="common/inc_page_scroll.tpl"})
</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})

