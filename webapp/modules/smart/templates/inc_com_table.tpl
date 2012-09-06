({t_loop from=$com_list item=item start=$_start num=9})
({if $item})
<li class="photoCell" id="community({$item.c_commu_id})Column" data-icon="arrow-u"({if $item && $item.c_member_id_admin == $target_member.c_member_id}) class="" data-theme=""({/if})>
<a class="listItemLink" href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" id="communityLink({$item.c_commu_id})">
<div class="photo" id="community({$item.c_commu_id})photo"><img class="memberPhoto" src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.name})"></div>
<div class="itemData caption" id="community({$item.c_commu_id})Name">({$item.name})</div>
</a></li>
({/if})
({/t_loop})
