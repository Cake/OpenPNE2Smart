<li id="diary({$item.c_diary_id})" class="commentList diaryList">
<a class="listItemLink" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})">
<div class="itemData({if !isset($item.num_comment)})_noComNum({/if})">
({strip})<div class="title">
<h3 id="diary({$item.c_diary_id})Title">({$item.subject})</h3>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<span class="icon_camera"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" /></span>({/if})
<span class="public">({t_public_flag public_flag=$item.public_flag})</span>
({if $item.c_member.nickname})<span class="authorName">({$item.c_member.nickname})</span>({/if})
<time class="datetime" id="diaryDatetime({$item.c_diary_id})">({$item.r_datetime|date_format:"%m月%d日<br />%H:%M"})</time>
</div>({/strip})
<p class="nameBody">({$item.body|t_decoration:1|t_truncate:100:""})</p>
({if isset($item.num_comment)})<p><span class="ui-li-count">({$item.num_comment})</span></p>({/if})
</div></a></li>
