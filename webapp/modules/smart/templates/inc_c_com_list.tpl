<li id="community({$item.c_commu_id})" class="commentList">
<a class="listItemLink" href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" id="communityLink({$item.c_commu_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title authorData" id="community({$item.c_commu_id})Name">({$item.name})
</div>
<div class="itemBody">({$item.info})</div>
<div class="commentListFooter">
<span id="community({$item.c_commu_id})Category">({$item.c_commu_category_name})</span>
<span class="ui-li-count" id="community({$item.c_commu_id})MemberNum">({$item.count_commu_member})</span>
<time datetime="({$item.r_datetime})" id="community({$item.c_commu_id})rDatetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日"})</time>
</div></div>
</section></a>
</li>
