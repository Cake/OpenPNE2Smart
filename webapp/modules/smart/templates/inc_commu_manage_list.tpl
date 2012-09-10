<li id="community({$item.c_commu_id})ManageList" class="commentList manageList">
<a class="listItemLink" href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" id="communityLink({$item.c_commu_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt="({$item.name})の写真"></div>
<div class="itemData">
<div class="title authorData" id="community({$item.c_commu_id})Name">({$item.name})
</div>
<div class="itemBody">({$item.info})</div>
<div class="commentListFooter">
<span id="community({$item.c_commu_id})Category">({$item.c_commu_category_name})</span>
<span class="ui-li-count" id="community({$item.c_commu_id})MemberNum">({$item.count_members})</span>
<time datetime="({$item.r_datetime})" id="community({$item.c_commu_id})rDatetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日"})</time>
</div></div>
</section></a>
<div class="manageListAcion" id="community({$item.c_commu_id})Manage">
({if $item.is_display_topic_home})
<a href="({t_url m=pc a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$item.c_commu_id})&amp;target_is_display_topic_home=0&amp;sessid=({$PHPSESSID})" class="addButton" id="community({$item.c_commu_id})NoLatestBbs" data-role="button" data-inline="false" data-ajax="false">({$WORD_COMMUNITY})最新書き込みを表示しない</a>
({else})
<a href="({t_url m=pc a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$item.c_commu_id})&amp;target_is_display_topic_home=1&amp;sessid=({$PHPSESSID})" class="addButton" id="community({$item.c_commu_id})LatestBbs" data-role="button" data-inline="false" data-ajax="false">({$WORD_COMMUNITY})最新書き込みを表示する</a>
({/if})
</div>
<a title="管理" href="javascript:void(0);" onclick="$('#community({$item.c_commu_id})Manage').toggle();">管理</a>
</li>
