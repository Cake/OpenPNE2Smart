<li id="hCommentRecent({$item.c_commu_topic_id})" class="commentList hCommentRecentList bbsList">
<a class="listItemLink" href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})" id="bbs({$item.c_commu_topic_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.c_commu_image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title" id="bbs({$item.c_commu_topic_id})Title">({$item.c_commu_topic_name})</div>
({strip})<div class="authorData">
<span class="authorName">({$item.c_commu_name})</span>
</div>({/strip})
<div class="itemBody"> ({$item.body})</div>
<div class="commentListFooter">
<time datetime="({$item.r_datetime})" id="bbsyDatetime({$item.c_commu_topic_id})" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
<span class="num_comment">コメント(({$item.number}))</span>
({if $item.image_filename1||$item.image_filename2||$item.image_filename3})<span class="icon_camera"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり"></span>({/if})
</div></div>
</section></a>
</li>
