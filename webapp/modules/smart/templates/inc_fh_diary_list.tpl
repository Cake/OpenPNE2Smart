<li id="diary({$item.c_diary_id})" class="commentList diaryList">
<a class="ui-link-inherit diaryListItem" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})">
({strip})<p><div class="authorBar"><div class="title">
<h3 id="diary({$item.c_diary_id})Title">({$item.subject})</h3>
({ext_include file="common/inc_public_flag.tpl" item="$item"})
</div></div></p>({/strip})
<p class="nameBody">({$item.body|t_decoration:1|t_truncate:48:""})</p>
<p><time class="datetime" id="diaryDatetime({$item.c_diary_id})">({$item.r_datetime|date_format:"%m月%d日%H:%M"})</time></p>

({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<p><div class="ui-grid-b photo">
({if $item.image_filename_1})<img src="({t_img_url filename=$item.image_filename_1 w=36 h=36})" alt="" />({/if})
({if $item.image_filename_2})<img src="({t_img_url filename=$item.image_filename_2 w=36 h=36})" alt="" />({/if})
({if $item.image_filename_3})<img src="({t_img_url filename=$item.image_filename_3 w=36 h=36})" alt="" />({/if})
</div></p>({/if})
<p><span class="ui-li-count">({$item.num_comment})</span></p>
</a></li>

