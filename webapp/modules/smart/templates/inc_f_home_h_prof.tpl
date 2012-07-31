({if !$is_h_prof})
({assign var=id_header value=prof})
({else})
({assign var=id_header value=$target_c_member.c_member_id|string_format:"member%sHome"})
({/if})
<script language="JavaScript">
<!--
// タブ
$('.inc_f_home_h_prof').live('pageinit',function(event){
	$(".tab li").click(function() {
		var id = $(this).attr('id');
		var content = $("#"+id+"-Content");

		content.siblings().hide();
		content.show();
		$(this).siblings().attr('class', 'ui-btn-up-c');
		$(this).attr('class', 'ui-btn-up-b')
	});
});
//-->
</script>
<div class="page inc_f_home_h_prof" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({capture name=change_prof})({if $is_h_prof})<a href="({t_url m=pc a=page_h_config_prof})" data-role="button" data-inline="false" data-mini="true" data-ajax="true">プロフィールを変更する</a>({/if})({/capture})

({* {{{ homePhotoBox *})<section class="homePhotoBox" id="({$id_header})PhotoBox">
<div class="photo120">
<img class="" src="({t_img_url filename=$target_c_member.image_filename w=120 h=120 noimg=no_image})" alt="プロフィール写真">
({if !$is_h_prof && ($is_friend || $friend_path)})
({/if})
</div>
<div class="itemData">
<div class="title authorData" id="({$id_header})Name">({$target_c_member.nickname})さん (({$c_friend_count}))</div>
<div class="itemBody">
<div class="link">
({if $target_c_member.image_filename})
({if $is_h_prof})
<a href="({t_url m=pc a=page_h_config_image})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">写真を編集</a>
({else})
<a href="({t_url m=pc a=page_f_show_image})&amp;target_c_member_id=({$target_c_member.c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">写真を見る</a>
({/if})
({/if})
</div>
</div>
<div class="commentListFooter">
<span>最終ログイン</span>:<time datetime="({$target_c_member.last_login})" id="({$id_header})LastLoginDatetime" class="datetime">({$target_c_member.last_login})</time>
</div>
</section>({* homePhotoBox }}} *})


({* {{{ simpleBox *})<section class="simpleBox" id="member({if !$is_h_prof})({$target_c_member.c_member_id})({/if})homeLinkBox" data-role="">
<span>
({if !$is_friend})
<a href="({t_url m=pc a=do_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;sessid=({$PHPSESSID})" data-role="button" data-inline="true" data-mini="true" data-ajax="false">({$WORD_MY_FRIEND})追加</a>
({elseif $relation.wait==1})
({$WORD_FRIEND_HALF})承認待ち
({/if})
</span>
<span><a href="({t_url m=pc a=page_f_bookmark_add})&amp;target_c_member_id=({$target_c_member.c_member_id})" data-role="button" data-inline="true" data-mini="true" data-ajax="true">お気に入り追加</a></span>
</div>
</section>({* simpleBox }}} *})

({if $is_h_prof})({* {{{ URL *})
({* {{{ descriptionBox *})<section class="descriptionBox" id="({$id_header})Url">
<p>※他のメンバーから見たあなたのページはこのようになります。</p>
({$smarty.capture.change_prof|smarty:nodefaults})
<p>他のメンバーにあなたのページを教える場合には、以下のURLを使ってください。</p>
<p class="url">({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member_id})</p>
</section>({* descriptionBox }}} *})

({else})
({* {{{ Birthday *})({* f_homeのみ *})
({if $target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && $is_friend)})
({* {{{ descriptionBox *})<section class="descriptionBox homeBirthdayBox"><p>
({if $days_birthday == 0})({* 誕生日当日 *})
<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})" id="({$id_header})Birthday" data-role="button" data-inline="false" data-mini="true" data-ajax="true">Happy Birthday!<br>メッセージを送る</a>
({elseif $days_birthday > 0 && $days_birthday <= 3})({* 誕生日3日以内 *})
<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})" id="({$id_header})Birthday" data-role="button" data-inline="false" data-mini="true" data-ajax="true">もうすぐ誕生日です!<br>メッセージを送る</a>
({/if})
</p></section>({* descriptionBox }}} *})
({/if})({* Birthday }}} *})
({/if})

({* {{{ homeMainTable *})<section class="homeMainTable homeProfileBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>プロフィール</h3>
<dl>
({capture name="nick"})
<dt>({$WORD_NICKNAME})</dt><dd>({$target_c_member.nickname})</dd>
({/capture})
({capture name="birth"})
({if $target_c_member.age !== NULL && ($target_c_member.public_flag_birth_year == 'public' || ($target_c_member.public_flag_birth_year == 'friend' && ($is_friend || $is_h_prof)))})
<dt>年齢</dt><dd>({$target_c_member.age})歳 ({if $is_h_prof && $target_c_member.public_flag_birth_year == 'friend'})<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>({/if})</dd>
({/if})
({if $target_c_member.birth_month && $target_c_member.birth_day && ($target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && ($is_friend || $is_h_prof)))})
<dt>誕生日</dt><dd>({$target_c_member.birth_month})月({$target_c_member.birth_day})日 ({if $is_h_prof && $target_c_member.public_flag_birth_month_day == 'friend'})<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>({/if})</dd>
({/if})
({/capture})
({foreach from=$target_c_member.profile key=key item=item})
({if $item.public_flag != "private" && ($item.public_flag == "public" || ($item.public_flag == "friend" && ($is_friend || $is_h_prof)))})
({strip})
({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK && !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})
({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})
({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/strip})
({if $item.value !== ''})
<dt>({$item.caption})</dt><dd id="member({$target_c_member.c_member_id})({$key})">
({if $item.form_type == 'textarea'})
    <div class="itemBody">
    ({$item.value|t_url2a|nl2br|t_decoration})
    </div>
    ({if $item.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('#member({$target_c_member.c_member_id})({$key})'); return false;">続きを読む</a></div>({/if})
({elseif $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({else})
    ({$item.value})
({/if})
({if $is_h_prof && $item.public_flag == 'friend'})
<span class="caution">※({$WORD_MY_FRIEND})まで公開</span>
({/if})
</dd>
({/if})
({/if})
({/foreach})
({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
</dl>
({if $is_h_prof})<a href="({t_url m=pc a=page_h_config_prof})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">プロフィール変更</a>({/if})
</section>({* }}} *})


({if $c_diary_list || $c_rss_cache_list})
({* homeTab *})<section class="homeTab" data-role="collapsible" data-collapsed="false" data-inset="true" data-content-theme="c">
<h3>({if $c_diary_list && $c_rss_cache_list})最新情報({elseif $c_diary_list})最新({$WORD_DIARY})({elseif $c_rss_cache_list})最新Blog({/if})</h3>
<div class="homeMainTableTabs" id="({$id_header})RelationTableTabs">
({if $c_diary_list && $c_rss_cache_list})
<ul class="tab">
<li class="ui-btn-up-b" id="recentList-1-({$target_c_member_id})">最新({$WORD_DIARY})</li>
<li class="ui-btn-up-c" id="recentList-2-({$target_c_member_id})">最新Blog</li>
</ul>
({/if})
({* {{{ homeMainTable *})<section class="homeMainTable" id="({$id_header})recentTable">
({if $c_diary_list})
<div class="recentListBox" id="recentList-1-({$target_c_member_id})-Content">
<ul class="pictureIconList" id="({$id_header})friendRecentDiary" data-role="listview">
({assign var=target_member value=$target_c_member})
({foreach from=$c_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></div>
</div>
({/if})
({if $c_rss_cache_list})
<div class="recentListBox" id="recentList-2-({$target_c_member_id})-Content">
<ul class="pictureIconList" id="({$id_header})friendRecentBlog" data-role="listview">
({foreach from=$c_rss_cache_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})#blog" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})
</div>
</section>({* homeTab }}} *})
({/if})

({if $c_friend_list || $c_commu_list})
({* {{{ homeTab *})<section class="homeTab" data-role="collapsible" data-collapsed="false" data-inset="true" data-content-theme="c">
<h3>({if $c_friend_list && $c_commu_list})({$WORD_FRIEND_HALF})・({$WORD_COMMUNITY_HALF})({elseif $c_friend_list})({$WORD_FRIEND})({elseif $c_commu_list})({$WORD_COMMUNITY})({/if})</h3>
<div class="homeMainTableTabs" id="({$id_header})RelationTableTabs">
({if $c_friend_list && $c_commu_list})
<ul class="tab">
<li class="ui-btn-up-b" id="relationTable-1-({$target_c_member_id})">({$WORD_FRIEND})</li>
<li class="ui-btn-up-c" id="relationTable-2-({$target_c_member_id})">({$WORD_COMMUNITY})</li>
</ul>
({/if})({* {{{ homeMainTable *})<section class="photoTableBox homeMainTable" id="({$id_header})photoTable">
({if $c_friend_list})
({* {{{ homeNineTable *})<div class="homeNineTable" id="relationTable-1-({$target_c_member_id})-Content">
<ul id="({$id_header})FriendPhotoTablecontent" class="photoTable" data-role="listview" data-inset="false">
({ext_include file="inc_member_table.tpl" member=$c_friend_list _start=$key*9})
</ul>
<div><a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">全てを見る(({$c_friend_count})人)</a></div>
</div>({* homeNineTable }}} *})
({/if})
({if $c_commu_list})
({* {{{ homeNineTable *})<div class="homeNineTable" id="relationTable-2-({$target_c_member_id})-Content">
<ul id="({$id_header})CommunityPhotoTableContent" class="photoTable" data-role="listview">
({ext_include file="inc_com_table.tpl" com_list=$c_commu_list _start=$key*9})
</ul>
<div class="moreInfo">
<a href="({t_url m=pc a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">全てを見る(({$user_count}))</a>
({if $common_commu_count})<a href="({t_url m=pc a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">共通({$WORD_COMMUNITY})(({$common_commu_count}))</a>({/if})
</div>({* homeNineTable }}} *})
({/if})
</section>({* homeMainTable }}} *})
</div>
</section>({* homeTab }}} *})
({/if})

({if $c_friend_comment_list})
({* {{{ friendIntroList *})
({* {{{ homeMainTable *})<section class="homeMainTable introListBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_FRIEND})からの紹介文</h3>

<ul class="pictureIconList" id="({$id_header})friendRecentDiary" data-role="listview" data-inset="false">
({foreach from=$c_friend_comment_list item=item})
<li id="member({$item.c_member_id})Intro({$target_c_member.c_member_id})" class="commentList">
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title authorData" id="member({$item.c_member_id})Name">({$item.nickname})</div>
<div class="itemBody">({$item.intro})</div>
<div class="commentListFooter">
</div></div>
</section></a>
</li>
({/foreach})
</ul>
<div class="pagerRelative">
<a href="({t_url m=pc a=page_fh_intro})&amp;target_c_member_id=({$target_c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">全て見る</a>
({if !$is_h_prof})({if $is_friend})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">紹介文を({if $my_friend_intro==''})書く({else})編集({/if})</a>
({/if})
({/if})
</div>
</section>
({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
