<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ photoUploadFormBox *})<section class="photoUploadFormBox" id="member({$target_member.c_member_id})images" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({if $target_member.c_member_id != $u})({$target_member.nickname}) さんの({/if})写真一覧</h3>
<ul class="gallery ui-grid-b" id="member({$target_member.c_member_id})gallery">
<li class="ui-block-a"><a href="({t_img_url filename=$target_member.image_filename_1 noimg=no_image})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$target_member.image_filename_1 w=76 h=76})" alt="写真1"></a></li>
<li class="ui-block-b"><a href="({t_img_url filename=$target_member.image_filename_2 noimg=no_image})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$target_member.image_filename_2 w=76 h=76})" alt="写真2"></a></li>
<li class="ui-block-c"><a href="({t_img_url filename=$target_member.image_filename_3 noimg=no_image})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$target_member.image_filename_3 w=76 h=76})" alt="写真3"></a></li></ul>
</section>({* photoUploadFormBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
