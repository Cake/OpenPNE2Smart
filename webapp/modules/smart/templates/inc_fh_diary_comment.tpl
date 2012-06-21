<article id="diaryComment({$item.number})" class="diaryComment">
<section class="authorBar" id="diaryComment({$item.number})Author">
<div class="memberData">
<div class="title">
<h4><strong>({$item.number})</strong>:({if $item.nickname})<a id="comment-({$item.number})-member" title="({$item.nickname})" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>({/if}) ({if $type == 'f' && $item.c_member_id == $member.c_member_id}) <a href="({t_url m=pc a=page_fh_delete_comment})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;target_c_diary_comment_id=({$item.c_diary_comment_id})">削除</a>({/if})</h4>
<span class="operation">
({if $type == "h"})<span><input type="checkbox" class="input_checkbox" name="target_c_diary_comment_id[]" value="({$item.c_diary_comment_id})" /></span>({/if})
</span>
</div>
<div class="data">
<time datetime="({$item.r_datetime})" id="diaryComment({$item.c_diary_id})Datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
</div>
</div>
</section>
<section class="body">
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
<figure class="ui-grid-b photo">
({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})"  data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_1 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})"  data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_2 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})"  data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$item.image_filename_3 w=76 h=76})" alt="" /></a>({/if})
</figure>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'})</p>
<div class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal" data-role="controlgroup" data-type="horizontal" class="commentVomeButton">
<a class="ui-btn ui-btn-icon-notext ui-corner-left ui-btn-up-c" title="Upper" data-wrapperels="span" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-icon="arrow-u" data-iconpos="notext" onclick="jump_to('diaryCommentList', '');return false;"><span class="ui-btn-inner ui-corner-left"><span class="ui-btn-text">Up</span><span class="ui-icon ui-icon-arrow-u ui-icon-shadow">&nbsp;</span></span></a>

({if $smarty.const.USE_RESPONSE_COMMENT && $is_writable_comment})
({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT || $is_comment_input})
<span class="commentWriteButton"><a href="javascript:void(0);" onclick="jump_to('diarycommentForm', 'diarycommentForm');response_comment_format($('#comment-({$item.number})-member').attr('title'), '({$item.number})', 'comment_box');$('#comment_box').focus();return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a></span>
({/if})
({/if})
</div>
</section>
</article>
