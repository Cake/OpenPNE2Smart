<li id="friend({$item.c_member_id})ManageList" class="commentList manageList">
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Link"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title authorData" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Name">({$item.nickname})</div>
<div class="itemBody">({$item.intro})</div>
<div class="commentListFooter">
<time datetime="({$item.last_login})" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})rDatetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</time>
</div>
</section>
<div class="manageListAcion" id="friend({$item.c_member_id})Manage">
({if $item.intro})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="friend({$item.c_member_id})IntroEdit" data-role="button" data-inline="false" data-ajax="true">紹介文を編集する</a>
<a href="({t_url m=pc a=page_f_intro_delete_confirm})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})" class="addButton" id="friend({$item.c_member_id})IntroDelete" data-role="button" data-inline="false" data-ajax="true">紹介文を削除する</a>
({else})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="friend({$item.c_member_id})IntroAdd" data-role="button" data-inline="false" data-ajax="true">紹介文を書く</a>
({/if})
<a href="({t_url m=pc a=page_fh_friend_list_delete_c_friend_confilm})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="friend({$item.c_member_id})Delete" data-role="button" data-inline="false" data-ajax="true">({$WORD_MY_FRIEND})から外す</a>
({if $item.is_display_friend_home})
<a href="({t_url m=pc a=do_h_friend_update_is_display_friend_home page=$page})&amp;target_c_member_id=({$item.c_member_id})&amp;target_is_display_friend_home=0&amp;sessid=({$PHPSESSID})" class="addButton" id="friend({$item.c_member_id})NoLatestDiary" data-role="button" data-inline="false" data-ajax="false">最新書き込みを表示しない</a>
({else})
<a href="({t_url m=pc a=do_h_friend_update_is_display_friend_home page=$page})&amp;target_c_member_id=({$item.c_member_id})&amp;target_is_display_friend_home=1&amp;sessid=({$PHPSESSID})" class="addButton" id="friend({$item.c_member_id})LatestDiary" data-role="button" data-inline="false" data-ajax="false">最新書き込みを表示する</a>({/if})
</div>
</a>
<a title="管理" class="" href="javascript:void(0);" onclick="$('#friend({$item.c_member_id})Manage').toggle();">管理</a>
</li>
