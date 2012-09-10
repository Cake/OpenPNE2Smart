<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})({$c_commu.c_commu_topic_id})">
({if $smarty.const.USE_RESPONSE_COMMENT}) 
<script type="text/javascript" src="./js/comment.js"></script>
({/if})
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if !$err_msg || !$is_writable_comment})
({ext_include file="inc_c_com_topic_find.tpl"})

({* {{{ alertLine *})
({if !$is_event_join_date})
({ext_include file="common/inc_msg.tpl" msg="募集期間が終了したので、このイベントには参加できません。"})
({elseif !$is_event_join_capacity})
({ext_include file="common/inc_msg.tpl" msg="募集人数に達したので、このイベントには参加できません。"})
({/if})
({* }}} *})

({* {{{ topicDetailBox *})
<section class="topicDetailBox" id="event({$c_topic.c_topic_id})DetailBox">
<div class="authorBar" id="event({$c_topic.c_topic_id})Author">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})"><img src="({t_img_url filename=$c_topic.image_filename w=48 h=48 noimg=no_image})" class="memberPhoto" alt="イベント({$c_topic.c_topic_id})作成者プロフィール写真"></a></div>
<div class="itemData">
<div class="title"><h2>({$c_topic.name})</h2></div>
</div>
</div>
<time datetime="({$c_topic.r_datetime})" id="event({$c_topic.c_topic_id})Datetime" class="datetime">({$c_topic.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
<div class="ui-grid-a gatherEvent" id="gatherEvent({$c_topic.c_commu_topic_id})">
<div class="ui-block-a"><a href="javascript:void(0);" onclick="jump_to('eventWriteForm', '');$('#comment_box').focus(); return false;" data-role="button"({if !$is_event_join_date || !$is_event_join_capacity}) class="ui-disabled"({/if})>参加する</a></div>
<div class="ui-block-b"><a href="({t_url m=pc a=page_c_event_invite})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})" data-role="button">友人に教える</a></div>
</div>

<dl class="eventData" id="eventData1">
<dt>企画者</dt>
<dd class="eventAuthorName"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})" id="diaryAuthor">({$c_topic.nickname})</a></dd>
<dt>開催日時</dt>
<dd class="eventOpenDate">({$c_topic.open_date})&nbsp;({$c_topic.open_date_comment})</dd>
<dt>開催場所</dt>
<dd class="eventOpenPref">({$c_topic.pref})&nbsp;({$c_topic.open_pref_comment})</dd>
<dt>関連({$WORD_COMMUNITY_HALF})</dt>
<dd class="eventCommu"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">({$c_commu.name})</a></dd>
</dl>

<article class="detailBody">
<p class="itemBody" id="diary({$c_topic.c_topic_id})body">({$c_topic.body|t_url2a|nl2br})</p>
({if $c_topic.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('.detailBody'); return false;">続きを読む</a></div>({/if})
<ul class="gallery ui-grid-b" id="event({$c_topic.c_topic_id})gallery">
({if $c_topic.image_filename1 || $c_topic.image_filename2 || $c_topic.image_filename3})
({if $c_topic.image_filename1})<li class="ui-block-a"><a href="({t_img_url filename=$c_topic.image_filename1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename1 w=76 h=76})" alt=")写真1"></a></li>({/if})
({if $c_topic.image_filename2})<li class="ui-block-b"><a href="({t_img_url filename=$c_topic.image_filename2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename2 w=76 h=76})" alt="写真2"></a></li>({/if})
({if $c_topic.image_filename3})<li class="ui-block-c"><a href="({t_img_url filename=$c_topic.image_filename3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_topic.image_filename3 w=76 h=76})" alt="写真3"></a></li>({/if})
({/if})
</ul>

<dl class="eventData" id="eventData2">
<dt>募集期限</dt>
<dd class="eventInvitePeriod">({if $c_topic.invite_period != "0000-00-00"})({$c_topic.invite_period})({else})指定なし({/if})</dd>
<dt>募集人数</dt>
<dd class="eventCapacity">({if $c_topic.capacity})({$c_topic.capacity})人({else})無制限({/if})</dd>
<dt>参加者</dt>
<dd class="eventMemberNum">({$c_topic.member_num})人
({if $c_topic.member_num})<div><a href="({t_url m=pc a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">参加者一覧を見る</a></div>({/if})</dd>
</dl>

<p>
({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})<div class="attachFile" data-inline="true"><a href="({t_url m=pc a=do_c_file_download})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})" data-inline="true" data-ajax="false">({$c_topic.original_filename})</a></div>({/if})
({if $is_c_commu_member || ($c_commu.is_comment == 'public')})
({if $is_writable_comment})
<div class="operation" data-inline="true">
<p class="commentWriteButton"><a title="返信" data-icon="smart-write" data-iconshadow="false" data-shadow="false" data-corners="true" data-inline="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="jump_to('topicWriteForm', '');$('#comment_box').focus();return false;">返信</a>
</p>
</div>
({/if})
({/if})
</p>
</article>

({if $is_c_event_admin || $is_c_commu_admin})
<div class="operation"><a href="({t_url m=pc a=page_c_event_mail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})" data-role="button">参加者へ一括メッセージ送信</a></div>
({/if})

({if $is_c_commu_admin || ($is_c_event_admin && $c_commu.is_topic !== 'admin_only')})
({if $is_c_commu_member || $c_commu.is_topic == 'public'})
<div class="operation">
<a href="({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})" data-role="button">編集</a>
</div>
({/if})
({/if})
</section>
({*  topicDetailBox }}} *})

({if $c_topic_write.0})({*$c_topic_write.0*})
({if $smarty.const.USE_RESPONSE_COMMENT})
<script type="text/javascript" src="./js/comment.js"></script>
({/if})
({* {{{ Pager *})({if $pager.total_page_num > 1 && $pager.is_next})
<div class="pagerRelative" id="event({$c_topic.c_topic_id})WriteNextPager"><span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_c_event_detail_ajax})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})', 'desc', '#({$INC_HEADER_page_name})({$c_commu.c_commu_topic_id}) li.commentList', 'event({$c_topic.c_topic_id})WriteNextPager', '({$pager.total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">コメントをもっと読む</a></span></div>
({/if})({* Pager }}} *})
({* {{{ commentList *})<section class="commentListBox" id="eventWriteList">
<ul id="event({$c_topic.c_topic_id})WriteList" class="pictureList" data-role="listview" data-inset="false"> 
({foreach from=$c_topic_write item=item})
({ext_include file="inc_c_bbs_write.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})
({/if})({*$c_topic_write.0*})
({/if})({**!$err_msg || !$is_writable_comment**})

({if $is_c_commu_member || $c_commu.is_comment == 'public'})
({if $is_writable_comment})
({* {{{ formTable *})<section class="formTable" id="eventWriteForm">
<div class="operation">
({t_form_block _enctype=file m=pc a=page_c_event_write_confirm _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="body">本文</label>
<textarea id="comment_box" name="body" cols="({$_cols|default:'40'})" placeholder="本文">({$body})</textarea>
</div>
({if !($is_apple)})
<div data-role="fieldcontain">
<laber for="image_filename1">写真1</label><input type="file" class="input_file" name="image_filename1" size="40"><br>
<laber for="image_filename2">写真2</label><input type="file" class="input_file" name="image_filename2" size="40"><br>
<laber for="image_filename3">写真3</label><input type="file" class="input_file" name="image_filename3" size="40"><br>
</div>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div data-role="fieldcontain">
<laber for="uploadfile">ファイル</label><input type="file" class="input_file" name="uploadfile" size="40">
<p class="caution">※ファイルサイズは({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、ファイルの種類は(({$allowed_extensions}))({/if})のファイルがアップロードできます。</p>
</div>
({/if})
({/if})
({strip})
({if $is_event_join_date})
    ({if $is_c_event_member})
        <div data-role="fieldcontain">
        <input type="submit" class="input_submit" name="button" value="参加をキャンセルする">
        </div>
    ({elseif $is_event_join_capacity})
        <div data-role="fieldcontain">
        <input type="submit" class="input_submit" name="button" value="イベントに参加する">
        </div>
    ({/if})
({/if})
({/strip})
<div data-role="fieldcontain"><input type="submit" class="input_submit" name="button" value="コメントのみ書き込む"></div>
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
<section class="simpleBox" id="eventNoavailableComment">
<h3>コメントを書く</h3>
<p>コメントが1000番に達したので、このイベントにはコメントできません。</p>
</section>({* simpleBox }}} *})

({if $is_event_join_date})
({if $is_c_event_member})
({* {{{ infoButtonBox *})<section class="infoButtonBox">
<h3>参加をキャンセルする</h3>
<p>イベント「({$c_topic.name})」の参加をキャンセルしますか？</p>

({t_form_block m=pc a=do_c_event_drop_c_commu_event})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain"><input type="submit" class="input_submit" value="参加をキャンセルする"></div>
({/t_form_block})
</section>({* infoButtonBox }}} *})

({elseif $is_event_join_capacity})
({* {{{ infoButtonBox *})<section class="infoButtonBox">
<h3>このイベントに参加</h3>
<p>イベント「({$c_topic.name})」に参加しますか？</p>

({t_form_block m=pc a=do_c_event_join_c_commu_event})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<div data-role="fieldcontain"><input type="submit" class="input_submit" value="イベントに参加する"></div>
({/t_form_block})
</section>({* infoButtonBox }}} *})
({/if})({*if $is_c_event_member*})
({/if})({*if $is_event_join_date*})

({/if})({*if $is_writable_comment*})
({/if})({*if $is_c_commu_member || $c_commu.is_comment == 'public'*})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
