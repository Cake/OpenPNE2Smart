<li id="bbsList({$item.c_commu_topic_id})" class="commentList bbsList">
<a class="listItemLink" href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})" id="bbs({$item.c_commu_topic_id})"><section class="authorBar">
<div class="itemData">
<div class="title" id="bbs({$item.c_commu_topic_id})Title">({$item.name})</div>
<div class="itemBody"> ({$item.body})</div>
<div class="commentListFooter">
<time datetime="({$item.u_datetime})" id="bbsyDatetime({$item.c_commu_topic_id})" class="datetime">({$item.u_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
<span class="num_comment">コメント(({$item.write_num}))</span>
({if $item.image_filename1||$item.image_filename2||$item.image_filename3})<span class="icon_camera"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" /></span>({/if})
</div></div>
</section></a>
</li>
