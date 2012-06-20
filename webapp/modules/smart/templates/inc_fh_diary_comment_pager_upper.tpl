({* {{{ Pager *})({strip})
({if $requests.order != 'asc'})
({if $total_num > 5 || $total_page_num > 1})
({if $total_page_num > 1})
<p class="pagerRelative" id="diaryComment({$target_diary.c_diary_id})NextPager">
({if $pager.page_prev})<span class="next"><a href="javascript:void(0);" onclick="submitPager('page_fh_diary_comment', 'target_c_diary_id=({$target_diary.c_diary_id})', 'desc', 'article.diaryComment', 'diaryComment({$target_diary.c_diary_id})NextPager', '({$total_page_num})');return false;" data-role="button" data-icon="arrow-l" data-iconpos="left" data-inline="true" data-ajax="true">前</a></span>({/if})
<span class="order"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;order=asc&amp;flg=diaryCommentList" data-role="button" data-icon="back" data-iconpos="right" data-inline="true" data-ajax="false">最初から</a></span>
</p>
({/if})
({/if})
({/if})
({/strip})({* Pager }}} *})
