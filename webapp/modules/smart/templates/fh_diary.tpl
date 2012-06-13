<div data-role="page">
({ext_include file="common/inc_header.tpl" _headline=$target_diary.subject})
<div data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})
({* 【メモ】検索 *})

({* {{{ diaryDetailBox *})
<section class="parts diaryDetailBox">

<section class="authorBar">
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
({if $category_list})
<p id="diaryCategory"><small>(
({foreach from=$category_list item=category})
<span><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category.c_diary_category_id})">({$category.category_name})</a></span>
({/foreach})
)</small></p>
({/if})
</article>

({if $c_diary_id_prev || $c_diary_id_next})
<section class="block prevNextLinkLine">
({if $c_diary_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})">≪前の({$WORD_DIARY})</a></p>({/if})
({if $c_diary_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})">次の({$WORD_DIARY})≫</a></p>({/if})
</section>
({/if})

({if $type == "h"})
<div class="operation">
({t_form_block _method=get m=pc a=page_h_diary_edit})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<input type="submit" class="input_submit" value="　編　集　" />
({/t_form_block})
</div>
({/if})
({* }}} *})

</section>
({*  diaryDetailBox }}} *})


({if $target_diary_comment_list})
({* {{{ commentList *})
<section class="parts commentList" id="diaryCommentList" data-role="collapsible">
<h3>コメント</h3>
({t_form_block m=pc a=page_fh_delete_comment})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />

({if $total_num > 20 || $total_page_num > 1})
({strip})
<div class="pagerRelative">

({if $total_num > 20})
({if $requests.page_size == 100})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">20件ずつ表示</a></p>
({else})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page_size=100#commentList">100件ずつ表示</a></p>
({/if})
({/if})

({if $total_page_num > 1})
({if $requests.order == 'asc'})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.page_size == 100})&amp;page_size=100({/if})#commentList">最新を表示</a></p>
({else})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.page_size == 100})&amp;page_size=100({/if})&amp;order=asc#commentList">最初から表示</a></p>
({/if})
({/if})

</div>
({/strip})
({/if})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_prev})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">前を表示</a></p>({/if})
<p class="number">({$pager.start})番～({$pager.end})番を表示</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_next})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./js/comment.js"></script>
({/if})
({foreach from=$target_diary_comment_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年<br />%m月%d日<br />%H:%M"})({if $type == "h"})<br /><input type="checkbox" class="input_checkbox" name="target_c_diary_comment_id[]" value="({$item.c_diary_comment_id})" />({/if})</dt>
<dd>
<div class="title">
<p class="heading"><strong>({$item.number})</strong>:
({if $item.nickname}) <a id="comment-({$item.number})-member" title="({$item.nickname})" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>({/if})
({if $type == 'f' && $item.c_member_id == $member.c_member_id}) <a href="({t_url m=pc a=page_fh_delete_comment})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;target_c_diary_comment_id=({$item.c_diary_comment_id})">削除</a>({/if})
({if $smarty.const.USE_RESPONSE_COMMENT && $is_writable_comment})
({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT || $is_comment_input})
<a href="javascript:void(0);" onclick="response_comment_format($('comment-({$item.number})-member').getAttribute('title'), '({$item.number})', 'comment_box');return false;" ><img src="({t_img_url_skin filename=button_comment})" alt="コメント返信ボタン" /></a>
({/if})
({/if})
</p>
</div>
<div class="body">
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
<ul class="photo">
({if $item.image_filename_1})<li><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_2})<li><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_3})<li><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'})</p>
</div>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

({if $type == 'h'})
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
</div>
({/if})
({/t_form_block})
</section>
({* }}} *})
({/if})

({if !$smarty.const.OPENPNE_USE_DIARY_COMMENT or $is_comment_input})
({if $is_writable_comment})
({* {{{ formTable *})
<section class="parts commentForm" id="diarycommentForm" data-role="collapsible">
<h3>コメントを書く</h3>
({t_form_block _enctype=file m=pc a=page_fh_diary_comment_confirm})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<table><tr>
<th>本文</th><td><textarea name="body" id="comment_box" rows="8" cols="40">({$requests.body})</textarea></td>
</tr><tr>
({if !($is_apple)})({**OpenPNE2 スマートフォン対応：ここから**})
<th>写真1</th><td><input type="file" class="input_file" name="upfile_1" size="40" /></td>
</tr><tr>
<th>写真2</th><td><input type="file" class="input_file" name="upfile_2" size="40" /></td>
</tr><tr>
<th>写真3</th><td><input type="file" class="input_file" name="upfile_3" size="40" /></td>
({/if})({**OpenPNE2 スマートフォン対応：ここまで**})
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
<div class="operation">
({t_mail_post mailto=$mail_address _type=button})
<ul class="" style="padding-left: 50px;">
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
