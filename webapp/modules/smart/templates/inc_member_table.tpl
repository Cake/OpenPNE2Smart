({t_loop from=$member item=item start=$_start num=9})
({if $item})
<li class="photoCell" id="member({$item.c_member_id})Column" data-icon="arrow-u">
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" id="memberLink({$item.c_member_id})">
<div class="photo" id="member({$item.c_member_id})photo"><img class="" src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})"></div>
<div class="itemData caption" id="member({$item.c_member_id})Name">({$item.nickname})</div>
</a></li>
({/if})
({/t_loop})
