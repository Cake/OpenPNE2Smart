<li id="diary({$item.c_diary_id})" class="commentList diaryList">
<a class="listItemLink" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})"><section class="authorBar">
({if isset($item.c_member) || isset($item.image_filename)})<div class="photo48"><img class="ui-li-thumb" src="({if isset($item.c_member)})({t_img_url filename=$item.c_member.image_filename w=48 h=48 noimg=no_image})({else if isset($item.image_filename))})({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})({/if})" alt=""></div>({/if})
<div class="itemData">
<div class="title" id="diary({$item.c_diary_id})Title">({$item.subject})</div>
({strip})<div class="authorData">
({if isset($item.c_member.nickname) || isset($item.nickname)})<span class="authorName">({if isset($item.c_member.nickname)})({$item.c_member.nickname})({else if isset($item.nickname)})({$item.nickname})({/if})</span>({/if})
</div>({/strip})
<div class="itemBody"> ({$item.body})</div>
<div class="commentListFooter">
<time datetime="({$item.r_datetime})" id="diaryComment({$item.number})Datetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
({if isset($item.num_comment)})<span class="num_comment">コメント(({$item.num_comment}))</span>({/if})
<span class="icon">({t_public_flag public_flag=$item.public_flag})</span>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<span class="icon"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" /></span>({/if})
</div></div>
</section></a></li>
