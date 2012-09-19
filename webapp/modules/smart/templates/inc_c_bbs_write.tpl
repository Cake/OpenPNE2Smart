<li id="topicWrite({$item.c_commu_topic_comment_id})" class="commentList">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image trim=square})" alt="プロフィール写真"></a></div>
<div class="itemData">
({strip})<div class="authorData">
({$item.number}):({if $item.nickname})<span class="authorName"><a id="comment-({$item.number})-member" title="({$item.nickname})" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></span>({/if})
</div>({/strip})
<div class="itemBody">({$item.body|t_url2a|nl2br})</div>
({if $item.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('#topicWrite({$item.c_commu_topic_comment_id}) .itemData'); return false;">続きを読む</a></div>({/if})
({if $item.image_filename1||$item.image_filename2||$item.image_filename3})<ul class="gallery ui-grid-b" id="topicWrite({$item.c_commu_topic_comment_id})gallery">
({if $item.image_filename1})<li class="ui-block-a"><a href="({t_img_url filename=$item.image_filename1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename1 w=76 h=76})" alt="コメント({$item.c_commu_topic_comment_id})写真1"></a></li>({/if})
({if $item.image_filename2})<li class="ui-block-b"><a href="({t_img_url filename=$item.image_filename2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename2 w=76 h=76})" alt="コメント({$item.c_commu_topic_comment_id})写真2"></a></li>({/if})
({if $item.image_filename3})<li class="ui-block-c"><a href="({t_img_url filename=$item.image_filename3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename3 w=76 h=76})" alt="コメント({$item.c_commu_topic_comment_id})写真3"></a></li>({/if})
</ul>({/if})
({if $item.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})<div class="attachFile" data-inline="false"><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})" data-inline="true" data-ajax="false">({$c_topic.original_filename})</a></div>({/if})
<div class="commentListFooter">
<time datetime="({$item.r_datetime})" id="topicWrite({$item.c_commu_topic_comment_id})Datetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
({if !isset($noButton) || !$noButton})
({if $is_c_commu_member && $is_writable_comment && $smarty.const.USE_RESPONSE_COMMENT})<a title="返信" data-icon="smart-write" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="jump_to('topicWriteForm', '');response_comment_format($('#comment-({$item.number})-member').attr('title'), '({$item.number})', 'comment_box');$('#comment_box').focus();return false;">返信</a>({/if})
({if $c_member_id == $item.c_member_id || $c_member_id == $c_commu.c_member_id_admin || $c_member_id == $c_commu.c_member_id_sub_admin})<a title="削除" data-icon="delete" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="({if !$c_topic.event_flag})({t_url m=pc a=page_c_topic_write_delete_confirm})({else})({t_url m=pc a=page_c_event_write_delete_confirm})({/if})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})" data-role="button" data-iconpos="notext">削除</a>({/if})
({/if})
</div></div>
</li>
