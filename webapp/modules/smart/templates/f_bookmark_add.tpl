<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="お気に入りに以下のメンバーを追加しますか？"})

<section class="authorBar" id="diaryAuthor">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})"><img src="({t_img_url filename=$c_member.image_filename w=48 h=48 noimg=no_image trim=square})" class="memberPhoto" alt="プロフィール写真"></a></div>
<div class="itemData">
<div class="title">({$c_member.nickname})さん</div>
<div class="commentListFooter">
<span>最終ログイン</span>:<time datetime="({$c_member.last_login})" id="member({$c_member.c_member_id})LastLoginDatetime" class="datetime">({$c_member.last_login})</time>
</div>
</div>
</section>

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_f_bookmark_add _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id" value="({$c_member.c_member_id})">
<input type="submit" class="input_submit" value="はい">
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block m=pc a=page_f_home})
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})">
<input type="submit" class="input_submit" value="いいえ">
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
