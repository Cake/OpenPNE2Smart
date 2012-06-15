<script language="JavaScript">
<!--
({if $comment_count})
$('#diarycommentForm').ready(function(){
	jump_to('diaryComment({$comment_count})','diaryCommentList');
});
({elseif $flg})
$('#diarycommentForm').ready(function(){
	jump_to('({$flg})','({$flg})');
});
({/if})
//-->
</script>
({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./modules/smart/comment.js"></script>
({/if})
<div data-role="page" id="diary">
({ext_include file="common/inc_header.tpl" _headline=$target_diary.subject})
<div data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})
({* 【メモ】検索 *})

({* {{{ diaryDetailBox *})
<section class="parts diaryDetailBox">

<section class="authorBar" id="diary({$target_diary.c_diary_id})Author">
<div class="memberPhoto36"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=36 h=36 noimg=no_image})" alt=""></a></div>
<div class="memberData">
<div class="title">
<h2><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})" id="diaryAuthor">({$target_member.nickname})</a>({if $type == "f"})さん({/if})の({$WORD_DIARY})</h2>
<span class="public">
({if $target_diary.public_flag == "public"})（全員に公開）
({elseif $target_diary.public_flag == "friend"})（({$WORD_MY_FRIEND})まで公開）
({elseif $target_diary.public_flag == "private"})（公開しない）({/if})</span>
</div>
<div class="data">
<time datetime="({$target_diary.r_datetime})" id="diaryDatetime">({$target_diary.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
</div>
</div>
</section>

<article class="body">
({if $target_diary.image_filename_1 || $target_diary.image_filename_2 || $target_diary.image_filename_3})
<figure class="ui-grid-b photo">
({if $target_diary.image_filename_1})<div class="ui-block-a"><a href="({t_img_url filename=$target_diary.image_filename_1})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_1 w=76 h=76})" alt="" /></a></div>({/if})
({if $target_diary.image_filename_2})<div class="ui-block-b"><a href="({t_img_url filename=$target_diary.image_filename_2})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_2 w=76 h=76})" alt="" /></a></div>({/if})
({if $target_diary.image_filename_3})<div class="ui-block-c"><a href="({t_img_url filename=$target_diary.image_filename_3})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_3 w=76 h=76})" alt="" /></a></div>({/if})
</figure>
({/if})
<p id="diaryBody">({$target_diary.body|nl2br|t_url2cmd:'diary':$target_diary.c_member_id|t_cmd:'diary'|t_decoration})</p>

<p>
<div id="diaryCategory" data-inline="true"><small>({if $category_list})(
({foreach from=$category_list item=category})
<span><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category.c_diary_category_id})">({$category.category_name})</a></span>
({/foreach}))
({/if})</small></div>
<div class="operation" data-inline="true">
<p class="commentWriteButton"><a href="javascript:void(0);" onclick="jump_to('diarycommentForm', 'diarycommentForm'); return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a></p>
</div>
</p>
</article>

({strip})
<section class="block prevNextLinkLine">
({if $c_diary_id_prev || $c_diary_id_next})
({if $c_diary_id_prev})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})" data-role="button" data-icon="back" data-inline="true">前の({$WORD_DIARY})</a>({/if})
({if $c_diary_id_next})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})" data-role="button" data-icon="forward" data-inline="true">次の({$WORD_DIARY})</a>({/if})
({/if})
</section>
({/strip})

({if $type == "h"})
<section class="operation">
<a href="({t_url m=pc a=page_h_diary_edit})&amp;target_c_diary_id=({$target_diary.c_diary_id})" data-role="button">編集</a>
</section>
({/if})
</section>
({*  diaryDetailBox }}} *})

({if $target_diary_comment_list})
({* {{{ commentList *})
({capture name=pager})({strip})
<p class="pagerRelative">
({if $total_num > 20 || $total_page_num > 1})
({if $total_page_num > 1})
({if $requests.order == 'asc'})
<span class="order"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;flg=diaryCommentList" data-ajax="false">最新を表示</a></span>
({else})
<span class="order"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;order=asc&amp;flg=diaryCommentList" data-ajax="false">最初から表示</a></span>
({/if})
({/if})
({/if})
({if $pager.page_prev})<span class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_prev})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;flg=diaryCommentList" data-ajax="false">前を表示</a></span>({/if})
<span class="number">({$pager.start})番～({$pager.end})番</span>
({if $pager.page_next})<span class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_next})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;flg=diaryCommentList" data-ajax="false">次を表示</a></span>({/if})
</p>
({/strip})({/capture})

({* {{{ commentList *})
<section class="parts commentList" id="diaryCommentList" data-role="collapsible" data-collapsed="true">
<h3><span>コメント</span> <span class="pagerRelative">全({$total_num})件</span></h3>
({$smarty.capture.pager|smarty:nodefaults})
({t_form_block m=pc a=page_fh_delete_comment})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />

({foreach from=$target_diary_comment_list item=item})
<article id="diaryComment({$item.number})">
<section class="authorBar" id="diaryComment({$item.number})Author">
<div class="memberPhoto36"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=36 h=36 noimg=no_image})" alt=""></a></div>
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
({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=76 h=76})" alt="" /></a>({/if})
({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=76 h=76})" alt="" /></a>({/if})
</figure>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'})</p>

({if $smarty.const.USE_RESPONSE_COMMENT && $is_writable_comment})
({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT || $is_comment_input})
<p class="commentWriteButton"><a href="javascript:void(0);" onclick="jump_to('diarycommentForm', 'diarycommentForm');response_comment_format($('#comment-({$item.number})-member').attr('title'), '({$item.number})', 'comment_box');$('#comment_box').focus();return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a></p>
({/if})
({/if})
</section>
</article>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

({if $type == 'h'})
<section class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="削除" /></li>
</ul>
</section>
({/if})
({/t_form_block})
</section>
({* commentList }}} *})
({/if})

({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT or $is_comment_input})
({if $is_writable_comment})
({* {{{ formTable *})
<section class="parts commentForm" id="diarycommentForm" data-role="collapsible">
<h3>コメントを書く</h3>
<div class="operation">
({t_form_block _enctype=file m=pc a=page_fh_diary_comment_confirm})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<textarea name="body" id="comment_box" rows="8" cols="40">({$requests.body})</textarea>
({if !($is_apple)})({**OpenPNE2 スマートフォン対応：ここから**})
<laber for="upfile_1">写真1</label><input type="file" class="input_file" name="upfile_1" size="40" /><br>
<laber for="upfile_2">写真2</label><input type="file" class="input_file" name="upfile_2" size="40" /><br>
<laber for="upfile_3">写真3</label><input type="file" class="input_file" name="upfile_3" size="40" /><br>
({/if})({**OpenPNE2 スマートフォン対応：ここまで**})
<input type="submit" class="input_submit" value="確認画面" />
({/t_form_block})
</div>
<div class="operation">
({t_mail_post mailto=$mail_address _type=button})
<ul class="">
<li>({$SNS_NAME})に登録したメールアドレスから投稿してください。<br></li>
<li>写真も添付できます。<br></li>
</ul>
</p>
</div>
</section>
({* }}} *})
({else})
({* {{{ simpleBox *})
<section class="parts simpleBox" id="diaryNoavailableComment" data-role="collapsible">
<h3>コメントを書く</h3>
<p>コメントが1000番に達したので、この({$WORD_DIARY})にはコメントできません。</p>
</section>
({* }}} *})
({/if})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})

