({* {{{ Pager *})({strip})
({if $requests.order == 'asc'})
({if $total_num > 5 || $total_page_num > 1})
({if $total_page_num > 1})
<p class="pagerRelative" id="diaryComment({$target_diary.c_diary_id})NextPager">
({if $pager.page_next})<span class="next"><a href="javascript:void(0);" onclick="submitPager('page_fh_diary_comment', 'target_c_diary_id=({$target_diary.c_diary_id})', 'asc', 'article.diaryComment', 'diaryComment({$target_diary.c_diary_id})NextPager', '({$total_page_num})');return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="true"  data-ajax="true">次を表示</a></span>({/if})
<span class="order"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;flg=diaryCommentList" data-role="button" data-icon="forward" data-iconpos="right" data-inline="true"  data-ajax="false">最新を表示</a></span>
</p>
({/if})
({/if})
({/if})
({/strip})({* Pager }}} *})
