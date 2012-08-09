<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="お気に入りに以下のメンバーを追加しますか？"})

({* {{{ homePhotoBox *})<section class="homePhotoBox" id="member({$c_member.c_member_id})PhotoBox">
<div class="photo120">
<img class="" src="({t_img_url filename=$c_member.image_filename w=120 h=120 noimg=no_image})" alt="プロフィール写真">
</div>
<div class="itemData">
<div class="title authorData" id="member({$c_member.c_member_id})Name">({$c_member.nickname})さん</div>
<div class="itemBody">({$c_member.profile.self_intro.value|t_url2a|nl2br|t_decoration})</div>
({if $c_member.profile.self_intro.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('.itemData'); return false;">続きを読む</a></div>({/if})
<div class="commentListFooter">
<span>最終ログイン</span>:<time datetime="({$c_member.last_login})" id="member({$c_member.c_member_id})LastLoginDatetime" class="datetime">({$c_member.last_login})</time>
</div>
</section>({* homePhotoBox }}} *})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_f_bookmark_add _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="はい" />
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block m=pc a=page_f_home})
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="いいえ" />
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
