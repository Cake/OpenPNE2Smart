<script language="JavaScript">
<!--
$('#({$INC_HEADER_page_name})').live('pageinit',function(event){
({literal})
	$("#image_main").addClass('ui-disabled');
({/literal})
});
//-->
</script>
<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ photoUploadFormBox *})<section class="photoUploadFormBox" id="configProfileImages" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>写真を編集する</h3>
<ul id="configProfileImageGallery">
({if $c_member.image_filename_1})
<li>
<img src="({t_img_url filename=$c_member.image_filename_1 w=240 h=320})" alt="写真1">
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})"({if $c_member.image_filename_1==$c_member.image_filename}) id="image_main"({/if}) data-role="button" data-mini="false" data-ajax="false">({if $c_member.image_filename_1==$c_member.image_filename})現在のメイン写真({else})メイン写真にする({/if})</a>
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_config_image})', 'deleteImage({$c_member.c_member_id})Image1Confirm'); openDialog('deleteImage({$c_member.c_member_id})Image1Confirm')" data-role="button" data-mini="false" data-ajax="true">削除</a>
</li>
({/if})
({if $c_member.image_filename_2})
<li>
<img src="({t_img_url filename=$c_member.image_filename_2 w=240 h=320})" alt="写真2">
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})"({if $c_member.image_filename_2==$c_member.image_filename}) id="image_main"({/if}) data-role="button" data-mini="false" data-ajax="false">({if $c_member.image_filename_2==$c_member.image_filename})現在のメイン写真({else})メイン写真にする({/if})</a>
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_config_image})', 'deleteImage({$c_member.c_member_id})Image2Confirm'); openDialog('deleteImage({$c_member.c_member_id})Image2Confirm')" data-role="button" data-mini="false" data-ajax="true">削除</a>
</li>
({/if})
({if $c_member.image_filename_3})
<li>
<img src="({t_img_url filename=$c_member.image_filename_3 w=240 h=320})" alt="写真3">
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})"({if $c_member.image_filename_3==$c_member.image_filename}) id="image_main"({/if}) data-role="button" data-mini="false" data-ajax="false">({if $c_member.image_filename_3==$c_member.image_filename})現在のメイン写真({else})メイン写真にする({/if})</a>
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_config_image})', 'deleteImage({$c_member.c_member_id})Image3Confirm'); openDialog('deleteImage({$c_member.c_member_id})Image3Confirm')" data-role="button" data-mini="false" data-ajax="true">削除</a>
</li>
({/if})
</ul>
</section>

({* {{{ formTable *})<section class="formTable" id="profileImageAddMail" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>写真をアップロードする</h3>
({if $c_member.image_filename_1&&$c_member.image_filename_2&&$c_member.image_filename_3})
<p>すでに写真が3枚登録されています。新しい写真を登録する場合は今の写真を削除してください。</p>
({else})
({t_form_block _enctype=file m=pc a=do_h_config_image _attr='data-ajax="false"'})
<div data-role="fieldcontain">
<label for="upfile">写真を選択</label>
<input type="file" class="input_file" name="upfile">
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="アップロード">
</div>
({/t_form_block})
({t_mail_post mailto=$mail_address _linktxt=メールでアップロード _type=button})
<p>({$SNS_NAME})に登録したメールアドレスから投稿してください。</p>
<p>({$smarty.const.IMAGE_MAX_FILESIZE})KB以内のGIF・JPEG・PNGにしてください<br>
著作権や肖像権の侵害にあたる写真、暴力的・卑猥な写真、他のメンバーが見て不快に感じる写真の掲載は禁止しております。掲載はご自身の責任でお願いいたします。
</p>
({/if})
</section>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
