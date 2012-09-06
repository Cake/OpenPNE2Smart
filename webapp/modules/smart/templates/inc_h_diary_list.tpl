<li id="diary({$item.c_diary_id})" class="commentList diaryList">
<a class="listItemLink" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})">
<section class="authorBar" id="diaryAuthor">
<div class="photo36"><img src="({t_img_url filename=$item.c_member.image_filename w=36 h=36 noimg=no_image})" class="memberPhoto" alt=""></div>
<div class="itemData">
({strip})<div class="title">
<h3 id="diary({$item.c_diary_id})Title">({$item.subject})</h3>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<span class="icon_camera"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" /></span>({/if})
<span class="public">({t_public_flag public_flag=$item.public_flag})</span>
<time class="datetime" id="diaryDatetime({$item.c_diary_id})">({$item.r_datetime|date_format:"%m月%d日<br />%H:%M"})</time>
</div>({/strip})
<p class="nameBody">(({$item.c_member.nickname}))</p>
({if isset($item.num_comment)})<p><span class="ui-li-count">({$item.num_comment})</span></p>({/if})
</div></section></a></li>
