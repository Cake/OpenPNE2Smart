<li id="diaryComment({$item.number})" class="commentList">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image trim=square})" alt="プロフィール写真"></a></div>
<div class="itemData">
({strip})<div class="authorData">
({if isset($item.number)})<span class="number">({$item.number})</span>:({/if})
({if $item.nickname})<span class="authorName"><a id="comment-({$item.number})-member" title="({$item.nickname})" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></span>({/if})
</div>({/strip})
<div class="itemBody">({$item.body|t_url2a|nl2br})</div>
({if $item.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('#diaryComment({$item.number}) .itemData'); return false;">続きを読む</a></div>({/if})
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<ul class="gallery ui-grid-b" id="diaryComment({$item.number})gallery">
({if $item.image_filename_1})<li class="ui-block-a"><a href="({t_img_url filename=$item.image_filename_1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_1 w=76 h=76})" alt="コメント({$item.number})写真1"></a></li>({/if})
({if $item.image_filename_2})<li class="ui-block-b"><a href="({t_img_url filename=$item.image_filename_2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_2 w=76 h=76})" alt="コメント({$item.number})写真2"></a></li>({/if})
({if $item.image_filename_3})<li class="ui-block-c"><a href="({t_img_url filename=$item.image_filename_3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_3 w=76 h=76})" alt="コメント({$item.number})写真3"></a></li>({/if})
</ul>({/if})
<div class="commentListFooter"><time datetime="({$target_diary.r_datetime})" id="diaryComment({$item.number})Datetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
({if $smarty.const.USE_RESPONSE_COMMENT && $is_writable_comment})({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT || $is_comment_input})<a title="返信" data-icon="smart-write" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="jump_to('diarycommentForm', '');response_comment_format($('#comment-({$item.number})-member').attr('title'), '({$item.number})', 'comment_box');$('#comment_box').focus();return false;">返信</a>({/if})({/if})
({if $type == "h" || ($type == 'f' && $item.c_member_id == $member.c_member_id)})<a title="削除" data-icon="delete" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="({t_url m=pc a=page_fh_delete_comment})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;target_c_diary_comment_id=({$item.c_diary_comment_id})" data-role="button" data-iconpos="notext">削除</a>({/if})
</div></div>
</li>
