<li id="community({$c_commu.c_commu_id})Member({$item.c_member_id})ManageList" class="commentList manageList">
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Link"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title authorData" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Name">({$item.nickname})</div>
<div class="commentListFooter">
<time datetime="({$item.last_login})" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})rDatetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</time>
</div>
</section>
<div class="manageListAcion" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Manage">
({if !$item.is_c_commu_admin})
<a href="({t_url m=pc a=page_c_edit_member_delete_c_commu_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Delete" data-role="button" data-inline="false" data-ajax="true">退会させる</a>
({/if})
({if !$item.is_c_commu_admin
 &&  !$item.is_c_commu_sub_admin
 &&   $item.c_commu_admin_confirm_id <= 0
 &&   $item.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
<a href="({t_url m=pc a=page_c_sub_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})Subadmin" data-role="button" data-inline="false" data-ajax="true">副管理者に指名</a>
({elseif $item.is_c_commu_sub_admin && $c_commu.c_member_id_sub_admin != $u })
<a href="({t_url m=pc a=page_c_sub_admin_delete})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})SubadminDelete" data-role="button" data-inline="false" data-ajax="true">副管理者から降格</a>
({/if})
({if !($item.is_c_commu_admin && !$item.is_c_commu_sub_admin)
 &&   $item.c_commu_admin_confirm_id <= 0
 &&   $item.c_commu_sub_admin_confirm_id <= 0
 &&   $c_commu.c_member_id_sub_admin != $u
})
<a href="({t_url m=pc a=page_c_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="community({$c_commu.c_commu_id})Member({$item.c_member_id})admin" data-role="button" data-inline="false" data-ajax="true">管理権を渡す</a>
({/if})
</div>
</a>
<a title="管理" class="" href="javascript:void(0);" onclick="$('#community({$c_commu.c_commu_id})Member({$item.c_member_id})Manage').toggle();">管理</a>
</li>
