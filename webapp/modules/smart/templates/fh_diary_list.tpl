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
<ul id="diaryList({$member.c_member_id})" class="ui-listview" data-role="listview" data-inset="true"> 
({foreach from=$target_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="diaryList({$member.c_member_id})NextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPager('page_fh_diary_list_ajax', 'target_c_member_id=({$member.c_member_id})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if $category_id})&amp;category_id=({$category_id})({elseif !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})', 'desc', 'li.diaryList', 'diaryList({$member.c_member_id})NextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})
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

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})

