({strip})({if isset($item.c_member)})
({assign var=author_name value=$item.c_member.nickname})
({assign var=author_image value=$item.c_member.image_filename})
({elseif isset($item.nickname)})
({assign var=author_name value=$item.nickname})
({assign var=author_image value=$item.image_filename})
({elseif isset($target_member)})
({assign var=author_name value=$target_member.nickname})
({assign var=author_image value=$target_member.image_filename})
({/if})({/strip})
<li id="diary({$item.c_diary_id})" class="commentList diaryList">
<a class="listItemLink" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$author_image w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title" id="diary({$item.c_diary_id})Title">({$item.subject})</div>
({strip})<div class="authorData">
<span class="authorName">({$author_name})</span>
</div>({/strip})
<div class="itemBody"> ({$item.body})</div>
<div class="commentListFooter">
<time datetime="({$item.r_datetime})" id="diaryComment({$item.number})Datetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
({if isset($item.num_comment) || isset($item.count_comments)})<span class="num_comment">コメント(({if isset($item.num_comment)})({$item.num_comment})({else})({$item.count_comments})({/if}))</span>({/if})
<span class="icon">({t_public_flag public_flag=$item.public_flag})</span>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<span class="icon"><img src="({t_img_url_skin filename=icon_camera})" alt="写真あり"></span>({/if})
</div></div>
</section></a></li>
