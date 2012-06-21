<li><a class="ui-link-inherit diaryListItem" href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})" id="diary({$item.c_diary_id})">
<h3 class="title"><span id="diary({$item.c_diary_id})Title">({$item.subject})</span></h3>
<span class="ui-li-count">({$item.num_comment})</span>
<p>({if $item.public_flag == "public"})
（全員に公開）
({elseif $item.public_flag == "friend"})
（({$WORD_MY_FRIEND})まで公開）
({elseif $item.public_flag == "private"})
（公開しない）
({/if})</p>
<p>({$item.body|t_decoration:1|t_truncate:108:"":3})<p>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<p class="ui-grid-b photo">
({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_1 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_2 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_3 w=76 h=76})" alt="" /></a>({/if})
</p>({/if})
<p class="ui-li-aside ui-li-desc">({$item.r_datetime|date_format:"%m月%d日%H:%M"})</p>
</a></li>

