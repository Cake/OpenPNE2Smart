({* {{{ navDiary *})<div id="navDiary" class="topNav" data-theme="e">
<ul class="ui-grid-c">
<li id="navDiaryFriend" class="ui-block-a"><a href="({t_url m=pc a=page_h_diary_list_friend})" class="({if $INC_HEADER_page_name == 'h_diary_list_friend'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">({$WORD_MY_FRIEND_HALF})({$WORD_DIARY})</a></li>
<li id="navDiaryMy" class="ui-block-b"><a href="({t_url m=pc a =page_fh_diary_list})" class="({if $INC_HEADER_page_name == 'fh_diary_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">自分の({$WORD_DIARY})</a></li>
<li id="navDiaryMyComment" class="ui-block-c"><a href="({t_url m=pc a =page_h_diary_comment_list})" class="({if $INC_HEADER_page_name == 'h_diary_comment_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">ｺﾒﾝﾄ履歴</a></li>
<li id="navDiaryAll" class="ui-block-d"><a href="({t_url m=pc a =page_h_diary_list_all})" class="({if $INC_HEADER_page_name == 'h_diary_list_all'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">全体</a></li>
</ul>
</div>({* navDiary }}} *})
