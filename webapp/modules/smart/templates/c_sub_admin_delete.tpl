<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="このメンバーを副管理者から降板させます。よろしいですか。"})

<section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$member.image_filename w=48 h=48 noimg=no_image})" alt=""></div>
<div class="itemData">
<div class="title authorData" id="member({$member.c_member_id})Name"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})">({$member.nickname})</a></div>
<div class="itemBody">({$member.profile.self_intro.value})</div>
<div class="commentListFooter">
<span>最終ログイン</span>:<time datetime="({$member.last_login})" id="member({$member.number})LastLoginDatetime" class="datetime">({$member.last_login})</time>
</div></div>
</section>

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_c_sub_admin_delete _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" class="input_submit" value="はい">
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block m=pc a=page_c_edit_member _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" class="input_submit" value="いいえ">
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
