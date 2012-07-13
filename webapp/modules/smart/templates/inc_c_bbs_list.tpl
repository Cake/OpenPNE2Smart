({strip})({if isset($item.commu_name)})
({assign var=commu_name value=$item.commu_name})
({assign var=commu_image value=$item.commu_image})
({elseif isset($c_commu)})
({assign var=commu_name value=$c_commu.name})
({assign var=commu_image value=$c_commu.image_filename})
({/if})({/strip})
<li id="bbsList({$item.c_commu_topic_id})" class="commentList bbsList">
<a class="listItemLink" href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})" id="bbs({$item.c_commu_topic_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb" src="({t_img_url filename=$commu_image w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title" id="bbs({$item.c_commu_topic_id})Title">({$item.name})</div>
({strip})<div class="authorData">
<span class="authorName">({$commu_name})</span>
</div>({/strip})
<div class="itemBody"> ({$item.body})</div>
<div class="commentListFooter">
<time datetime="({$item.u_datetime})" id="bbsyDatetime({$item.c_commu_topic_id})" class="datetime">({$item.u_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
({if isset($item.write_num) || isset($item.max_number)})<span class="num_comment">コメント(({if isset($item.write_num)})({$item.write_num})({elseif isset($item.max_number)})({$item.max_number})({/if}))</span>({/if})
({if $item.image_filename1||$item.image_filename2||$item.image_filename3})<span class="icon_camera"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" /></span>({/if})
</div></div>
</section></a>
</li>
