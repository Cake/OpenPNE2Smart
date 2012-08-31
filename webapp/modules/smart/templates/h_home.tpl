<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ homePhotoBox *})<section class="homePhotoBox" id="homePhotoBox">
<div class="photo76"><a href="({t_url m=pc a=page_h_prof})"><img class="" src="({t_img_url filename=$c_member.image_filename w=76 h=76 noimg=no_image})" alt="プロフィール写真"></a></div>
<div class="itemData">
<div class="title authorData" id="homeName">({$c_member.nickname})</div>
<div class="itemBody">
({if $num_f_confirm_list || $num_message_not_is_read || $num_diary_not_is_read || $num_h_confirm_list || $anatani_c_commu_admin_confirm_list || $anatani_c_commu_sub_admin_confirm_list})
<ul>
({if $num_f_confirm_list})
<li><a href="({t_url m=pc a=page_h_confirm_list})"><span class="caution">承認待ちのメンバーが({$num_f_confirm_list})名います</a></li>
({/if})
({if $num_message_not_is_read})
<li><a href="({t_url m=pc a=page_h_message_box})"><span class="caution">({$num_message_not_is_read})件の新着メッセージがあります</a></li>
({/if})
({if $num_diary_not_is_read})
<li><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})"><span class="caution">({$num_diary_not_is_read})件の({$WORD_DIARY})に対して新着コメントがあります</span></a></li>
({/if})
({if $num_h_confirm_list})
<li><a href="({t_url m=pc a=page_h_confirm_list})"><span class="caution">({$WORD_COMMUNITY})参加承認待ちのメンバーが({$num_h_confirm_list})名います</span></a></li>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<li><a href="({t_url m=pc a=page_h_confirm_list})"><span class="caution">({$WORD_COMMUNITY})管理者交代依頼が({$num_anatani_c_commu_admin_confirm_list})件きています</span></a></li>
({/if})
({if $anatani_c_commu_sub_admin_confirm_list})
<li><a href="({t_url m=pc a=page_h_confirm_list})"><span class="caution">({$WORD_COMMUNITY})副管理者依頼が({$num_anatani_c_commu_sub_admin_confirm_list})件きています</span></a></li>
({/if})
</ul>
({/if})
</div>
<div class="commentListFooter">
({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $c_member.c_member_id != 1})
({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<div class="rank"><img src="({t_img_url filename=$rank.image_filename})" alt="({$rank.name})" /></div>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
<div class="point">({$point}) Point</div>
({/if})
({/if})
({/if})
</div>
</div>
</section>({* homePhotoBox }}} *})

({if $birthday_flag})
<div class="parts homeBirthdayBox">
<img src="({t_img_url_skin filename=birthday_h w=240})" alt="Happy Birthday!" />
</div>
({/if})

({if $site_info})
({* {{{ homeInfoBox *})<section class="homeInfoBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>Information</h3>
({$site_info|smarty:nodefaults})
</section>({* homeInfoBox }}} *})
({/if})

({if $c_diary_friend_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentFriendDiaryTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_MY_FRIEND})最新({$WORD_DIARY})</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentFriendDiary" data-role="listview">
({foreach from=$c_diary_friend_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_diary_list_friend})" data-role="button" data-inline="false" data-mini="false" data-ajax="false">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentFriendBlogTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_MY_FRIEND})最新Blog</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentFriendBlog" data-role="listview">
({foreach from=$c_rss_cache_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_diary_list_friend})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $c_diary_my_comment_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentCommentTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_DIARY})コメント記入履歴</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentComment" data-role="listview">
({foreach from=$c_diary_my_comment_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_diary_comment_list})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $c_diary_list_all})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentAllDiaryTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>全体の最新({$WORD_DIARY})</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentAllDiary" data-role="listview">
({foreach from=$c_diary_list_all item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_diary_list_all})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $bookmark_diary_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentBookmarkDiaryTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>お気に入り最新({$WORD_DIARY})</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentBookmarkDiary" data-role="listview">
({foreach from=$bookmark_diary_list item=item})
({ext_include file="inc_fh_diary_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $bookmark_blog_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentBookmarkBlogTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>お気に入り最新Blog</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentBookmarkBlog" data-role="listview">
({foreach from=$bookmark_blog_list item=item})
({ext_include file="inc_blog_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $c_commu_topic_comment_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentCommunityBbsTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>参加({$WORD_COMMUNITY})最新書き込み</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentCommunityBbs" data-role="listview">
({foreach from=$c_commu_topic_comment_list item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_com_comment_list})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

({if $c_commu_topic_comment_list})
({* {{{ homeMainTable *})<section class="homeMainTable" id="homeRecentAllCommunityBbsTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>全体の({$WORD_COMMUNITY})最新書き込み</h3>
<div class="recentListBox">
<ul class="pictureIconList" id="homeRecentAllCommunityBbs" data-role="listview">
({foreach from=$c_topic_list_all item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo"><a href="({t_url m=pc a=page_h_com_topic_find_all})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a></div>
</div>
</section>({* homeMainTable }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
