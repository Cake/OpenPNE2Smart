<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ friendIntroList *})<section class="friendIntroList" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_FRIEND})からの紹介文</h3>
<ul class="pictureIconList" id="member({$target_member.c_member_id})Intro" data-role="listview" data-inset="false">
({foreach from=$intro_list item=item})
<li id="member({$target_member.c_member_id})Intro({$item.c_member_id})" class="commentList">
<a href="javascript:void(0);" onclick="readMore('#member({$target_member.c_member_id})Intro({$item.c_member_id}) .authorBar .itemData'); return false;">
<section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt="プロフィール写真"></div>
<div class="itemData">
<div class="title authorData" id="member({$item.c_member_id})Name">({$item.nickname})</div>
<div class="itemBody">({$item.intro|t_url2a|nl2br})</div>
<div class="commentListFooter">
</div></div>
</section>
<div class="manageListAcion" id="member({$target_member.c_member_id})Intro({$item.c_member_id})Manage">
({if $item.nickname})
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" data-role="button" data-inline="false" data-ajax="true">({$item.nickname})さんのホーム</a>
({/if})
({if $target_member.c_member_id==$member.c_member_id})
({if !$item.has_intro_by_me})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})" class="addButton" id="intro({$item.c_member_id})Edit" data-role="button" data-inline="false" data-ajax="false">この({$WORD_MY_FRIEND})を紹介する</a>
({/if})
<a href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_f_intro_from_delete})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_fh_intro})', 'deleteIntro({$item.c_member_id})Confirm'); openDialog('deleteIntro({$item.c_member_id})Confirm')" data-role="button" data-mini="false" data-ajax="true">紹介文を削除する</a>
({/if})
({if $item.c_member_id==$member.c_member_id})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$target_member.c_member_id})" class="addButton" id="intro({$target_member.c_member_id})Edit" data-role="button" data-inline="false" data-ajax="false">紹介文を編集する</a>
<a href="({t_url m=pc a=page_f_intro_delete_confirm})&amp;target_c_member_id=({$target_member.c_member_id})&amp;sessid=({$PHPSESSID})" class="addButton" id="introDeleteEdit" data-role="button" data-inline="false" data-ajax="false">紹介文を削除する</a>
({/if})
</div>
</a>
<a title="管理" href="javascript:void(0);" onclick="$('#member({$target_member.c_member_id})Intro({$item.c_member_id})Manage').toggle();">管理</a>
</li>
({/foreach})
</ul>
</section>({* friendIntroList }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
