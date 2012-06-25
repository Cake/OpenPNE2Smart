<script language="JavaScript">
<!--
var page=2;

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
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./modules/smart/comment.js"></script>
({/if})
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ diaryDetailBox *})
<section class="parts diaryDetailBox">

<section class="authorBar" id="diary({$target_diary.c_diary_id})Author">
<div class="memberPhoto36"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=36 h=36 noimg=no_image})" alt=""></a></div>
<div class="memberData">
<div class="title">
<h2>({$target_diary.subject})</h2>
<span class="public">
({if $target_diary.public_flag == "public"})（全員に公開）
({elseif $target_diary.public_flag == "friend"})（({$WORD_MY_FRIEND})まで公開）
({elseif $target_diary.public_flag == "private"})（公開しない）({/if})</span>
</div>
<div class="data">
<time datetime="({$target_diary.r_datetime})" id="diaryDatetime">({$target_diary.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
<span class="author diaryAuthorName"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})" id="diaryAuthor">({$target_member.nickname})({if $type == "f"})さん({/if})</a></span>
</div>
</div>
</section>

<article class="body">
<p id="diaryBody">({$target_diary.body|nl2br|t_url2cmd:'diary':$target_diary.c_member_id|t_cmd:'diary'|t_decoration})</p>

({if $target_diary.image_filename_1 || $target_diary.image_filename_2 || $target_diary.image_filename_3})
<p><figure class="ui-grid-b photo">
({if $target_diary.image_filename_1})<div class="ui-block-a"><a href="({t_img_url filename=$target_diary.image_filename_1})" data-transition="pop"  data-ajax="false"><img src="({t_img_url filename=$target_diary.image_filename_1 w=76 h=76})" alt="" /></a></div>({/if})
({if $target_diary.image_filename_2})<div class="ui-block-b"><a href="({t_img_url filename=$target_diary.image_filename_2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$target_diary.image_filename_2 w=76 h=76})" alt="" /></a></div>({/if})
({if $target_diary.image_filename_3})<div class="ui-block-c"><a href="({t_img_url filename=$target_diary.image_filename_3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$target_diary.image_filename_3 w=76 h=76})" alt="" /></a></div>({/if})
</figure></p>
({/if})

<div id="diaryCategory" data-inline="true"><small>({if $category_list})(
({foreach from=$category_list item=category})
<span><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category.c_diary_category_id})">({$category.category_name})</a></span>
({/foreach}))
({/if})</small></div>
<div class="operation" data-inline="true">
<p class="commentWriteButton"><a href="javascript:void(0);" onclick="jump_to('diarycommentForm', 'diarycommentForm'); return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a></p>
</div>
</article>

({strip})
<div class="pagerRelative">
({if $c_diary_id_prev || $c_diary_id_next})
({if $c_diary_id_prev})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})" data-role="button" data-icon="back" data-mini="true" data-inline="true">前の({$WORD_DIARY})</a>({/if})
({if $c_diary_id_next})<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})" data-role="button" data-icon="forward" data-mini="true" data-inline="true">次の({$WORD_DIARY})</a>({/if})
({/if})
</div>
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
({t_form_block m=pc a=page_fh_delete_comment})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<section class="parts commentList" id="diaryCommentList">
({* {{{ Pager *})({if $total_page_num > 1 && $pager.page_prev})<h3><span id="diaryComment({$target_diary.c_diary_id})NextPager"><a href="javascript:void(0);" onclick="submitPagerAll('({t_url m=pc a=page_fh_diary_ajax})&amp;target_c_diary_id=({$target_diary.c_diary_id})', 'desc', 'article.diaryComment', 'diaryComment({$target_diary.c_diary_id})NextPager', '({$total_num})', false);return false;" data-ajax="true">コメント({$total_num})件を全て見る</a></span></h3>({/if})({* Pager }}} *})
({foreach from=$target_diary_comment_list item=item})
({ext_include file="inc_fh_diary_comment.tpl"})
({/foreach})

({if $type == 'h'})
<section class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="削除" /></li>
</ul>
</section>
({/if})

</section>
({/t_form_block})
({* commentList }}} *})
({/if})

({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT or $is_comment_input})
({if $is_writable_comment})
({* {{{ formTable *})
<section class="parts commentForm" id="diarycommentForm" data-role="collapsible">
<h3>コメントを書く</h3>
<div class="operation">
({t_form_block _enctype=file m=pc a=page_fh_diary_comment_confirm _attr='data-ajax="false"'})
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
