({if $_type=='friend_confirm'})
({assign var=c_member_id value=$item.c_member_id_from})
({capture name="accept_url"})({t_url m=pc a=do_h_confirm_list_insert_c_friend})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({capture name="reject_url"})({t_url m=pc a=do_h_confirm_list_delete_c_friend_confirm})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({elseif $_type=='commu_member_confirm'})
({assign var=c_member_id value=$item.c_member_id})
({capture name="accept_url"})({t_url m=pc a=do_h_confirm_list_insert_c_commu_member})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({capture name="reject_url"})({t_url m=pc a=do_h_confirm_list_delete_c_commu_member_confirm})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({elseif $_type=='commu_admin_confirm'})
({assign var=c_member_id value=$item.c_member_id_admin})
({capture name="accept_url"})({t_url m=pc a=do_h_confirm_list_update_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({capture name="reject_url"})({t_url m=pc a=do_h_confirm_list_delete_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({elseif $_type=='commu_subadmin_confirm'})
({assign var=c_member_id value=$item.c_member_id_admin})
({capture name="accept_url"})({t_url m=pc a=do_h_confirm_list_update_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({capture name="reject_url"})({t_url m=pc a=do_h_confirm_list_delete_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})({/capture})
({/if})
<li class="commentList"><div>
({if $item.c_commu_id})<div class="communityInfo">({$WORD_COMMUNITY}) : <a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></div>({/if})

<div class="photo48 communityRequest"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member_id})" class="listItemLink"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt="プロフィール写真"></a></div>

<div class="itemData">
<div class="title authorData" id="member({$c_member_id})Name"><a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member_id})">({$item.nickname})</a></div>
<div class="itemBody">({$item.message|nl2br})</div>
<div class="commentListFooter"></div>
</div>

<ul class="ui-grid-a">
<li class="ui-block-a"><a href="({$smarty.capture.accept_url|smarty:nodefaults})" data-role="button" data-icon="plus" data-ajax="false">承認</a></li>
<li class="ui-block-b"><a href="({$smarty.capture.reject_url|smarty:nodefaults})" data-role="button" data-icon="delete" data-ajax="false">拒否</a></li>
</ul>
</div></li>
