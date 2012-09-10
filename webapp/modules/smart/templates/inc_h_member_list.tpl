<li id="member({$item.c_member_id})" class="commentList">
<a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" id="memberLink({$item.c_member_id})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image})" alt="プロフィール写真"></div>
<div class="itemData">
<div class="title authorData" id="member({$item.c_member_id})Name">({$item.nickname})</div>
<div class="itemBody">({$item.profile.self_intro.value})</div>
<div class="commentListFooter">
<span>最終ログイン</span>:<time datetime="({$item.last_login})" id="member({$item.number})LastLoginDatetime" class="datetime">({$item.last_login})</time>
</div></div>
</section></a>
({if $_type=="h_bookmark_list"})
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_f_bookmark_delete})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_bookmark_list})', 'deletebookmark({$item.c_member_id})Confirm'); openDialog('deletebookmark({$item.c_member_id})Confirm')" data-ajax="true">削除</a>
({/if})
</li>
