({if $INC_HEADER_page_name == 'f_home'})
({assign var=target_member value=$target_c_member})
({/if})
({* {{{ navFriend *})<div id="navFriend" class="topNav" data-theme="e">
<ul class="ui-grid-b">
<li id="navFriendDiary" class="ui-block-a"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})" class="({if $INC_HEADER_page_name == 'fh_diary_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">({$WORD_DIARY})</a></li>
<li id="navFriendMessage" class="ui-block-b"><a href="({t_url m=pc a =page_f_message_send})&amp;target_c_member_id=({$target_member.c_member_id})" class="({if $INC_HEADER_page_name == 'f_message_send'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">ﾒｯｾｰｼﾞ</a></li>
<li id="navFriendHome" class="ui-block-c"><a href="({t_url m=pc a =page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})" class="({if $INC_HEADER_page_name == 'f_homet'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">({$WORD_MY_FRIEND_HALF})ﾎｰﾑ</a></li>
</ul>
</div>({* navFriend }}} *})
