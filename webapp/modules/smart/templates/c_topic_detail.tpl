<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})({$c_topic.c_commu_topic_id})">
<script language="JavaScript">
<!--
({if $body})
$('#topicWriteForm').ready(function(){
	jump_to('comment_box','comment_box');
});
({/if})

var prevTopicId = null;
var nextTopicId = null;

// Swipe
$('#({$INC_HEADER_page_name})({$c_topic.c_commu_topic_id})').live('pageinit',function(event){
({if $c_topic_id_prev || $c_topic_id_next})
({if $c_topic_id_prev})	// 前のトピック
	prevTopicId = '({$c_topic_id_prev})';
	$("#({$INC_HEADER_page_name})({$c_topic.c_commu_topic_id})").bind("swiperight", function(){
		var params = setTopicIdparams(prevTopicId);
		changePage('({t_url m=pc a=page_c_topic_detail _html=false _absolute=true})', params, true);
	});
({/if})
({if $c_topic_id_next})	// 次のトピック
	nextTopicId = '({$c_topic_id_next})';
	$("#({$INC_HEADER_page_name})({$c_topic.c_commu_topic_id})").bind("swipeleft", function(){
		var params = setTopicIdparams(nextTopicId);
		changePage('({t_url m=pc a=page_c_topic_detail _html=false _absolute=true})', params, false);
	});
({/if})
({/if})
});
//-->
</script>
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if !$err_msg || !$is_writable_comment})
({ext_include file="inc_c_com_topic_find.tpl"})

({* {{{ topicDetailBox *})
<section class="topicDetailBox" id="topic({$c_topic.c_topic_id})DetailBox">
<div class="authorBar" id="topic({$c_topic.c_topic_id})Author">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})"><img src="({t_img_url filename=$c_topic.image_filename w=48 h=48 noimg=no_image trim=square})" class="memberPhoto" alt="トピック({$c_topic.c_topic_id})作成者プロフィール写真"></a></div>
<div class="itemData">
<div class="title"><h2>({$c_topic.name})</h2></div>
</div>
</div>
<div class="authorData">
<span class="author topicAuthorName"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})" id="topicAuthor">({$c_topic.nickname})</a></span>
</div>
<time datetime="({$c_topic.r_datetime})" id="topic({$c_topic.c_topic_id})Datetime" class="datetime">({$c_topic.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>

<article class="detailBody">
<p class="itemBody" id="topic({$c_topic.c_topic_id})body">({$c_topic.body|t_url2a|nl2br})</p>
({if $c_topic.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('.detailBody'); return false;">続きを読む</a></div>({/if})
<ul class="gallery ui-grid-b" id="topic({$c_topic.c_topic_id})gallery">
({if $c_topic.image_filename1 || $c_topic.image_filename2 || $c_topic.image_filename3})
({if $c_topic.image_filename1})<li class="ui-block-a"><a href="({t_img_url filename=$c_topic.image_filename1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename1 w=76 h=76})" alt="写真1"></a></li>({/if})
({if $c_topic.image_filename2})<li class="ui-block-b"><a href="({t_img_url filename=$c_topic.image_filename2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename2 w=76 h=76})" alt="写真2"></a></li>({/if})
({if $c_topic.image_filename3})<li class="ui-block-c"><a href="({t_img_url filename=$c_topic.image_filename3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename3 w=76 h=76})" alt="写真3"></a></li>({/if})
({/if})
</ul>

<p>
({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})<div class="attachFile" data-inline="true"><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})" data-inline="true" data-ajax="false">({$c_topic.original_filename})</a></div>({/if})
({if $is_c_commu_member || ($c_commu.is_comment == 'public')})
({if $is_writable_comment})
<div class="operation" data-inline="true">
<a title="返信" data-icon="smart-write" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="jump_to('topicWriteForm', '');$('#comment_box').focus();return false;">返信</a>
</div>
({/if})
({/if})
</p>
</article>

({if $is_c_commu_admin || ($is_c_topic_admin && $c_commu.is_topic !== 'admin_only')})
({if $is_c_commu_member || $c_commu.is_topic == 'public'})
<div class="operation">
<a href="({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})" data-role="button" data-ajax="false">編集</a>
</div>
({/if})
({/if})
</section>
({*  topicDetailBox }}} *})

({if $c_topic_write})
({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./js/comment.js"></script>
({/if})
({* {{{ Pager *})({if $pager.total_page_num > 1 && $pager.is_next})
<div class="pagerRelative" id="topic({$c_topic.c_topic_id})WriteNextPager"><span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_c_topic_detail_ajax})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'desc', '#({$INC_HEADER_page_name})({$c_commu.c_commu_topic_id}) li.commentList', 'topic({$c_topic.c_topic_id})WriteNextPager', '({$pager.total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">コメントをもっと読む</a></span></div>
({/if})({* Pager }}} *})
({* {{{ commentList *})<section class="commentListBox" id="topicWriteList">
<ul id="topic({$c_topic.c_topic_id})WriteList" class="pictureList" data-role="listview" data-inset="false"> 
({foreach from=$c_topic_write item=item})
({ext_include file="inc_c_bbs_write.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})
({/if})
({/if})

({if $is_c_commu_member || ($c_commu.is_comment == 'public')})
({if $is_writable_comment})
({* {{{ formTable *})<section class="formTable" id="topicWriteForm">
<div class="operation">
({t_form_block _enctype=file m=pc a=page_c_topic_write_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="body">コメント</label>
<textarea id="comment_box" name="body" cols="({$_cols|default:'40'})" placeholder="コメント">({$body})</textarea>
</div>
({if !($is_apple)})
<div data-role="fieldcontain">
<label for="image_filename1">写真1</label><input type="file" class="input_file" name="image_filename1" size="40"><br>
<label for="image_filename2">写真2</label><input type="file" class="input_file" name="image_filename2" size="40"><br>
<label for="image_filename3">写真3</label><input type="file" class="input_file" name="image_filename3" size="40"><br>
</div>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div data-role="fieldcontain">
<label for="uploadfile">ファイル</label><input type="file" class="input_file" name="uploadfile" size="40">
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</div>
({/if})
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</div>
({if $mail_address})({**OpenPNE2 スマートフォン対応：ここから**})
<div class="operation">
({t_mail_post mailto=$mail_address _type=button})
<p>({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
写真も添付できます。</p>
</div>
({/if})({**OpenPNE2 スマートフォン対応：ここまで**})
</section>({* formTable }}} *})

({else})
({* {{{ simpleBox *})
<section class="simpleBox" id="topicNoavailableComment">
<h3>コメントを書く</h3>
<p>コメントが1000番に達したので、このトピックにはコメントできません。</p>
</section>({* simpleBox }}} *})
({/if})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
