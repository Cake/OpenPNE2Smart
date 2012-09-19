<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ messageDetailBox *})<section class="messageDetailBox" id="message({$c_message.c_message_id})">
<h3>メッセージの詳細</h3>
<div class="authorBar" id="message({$c_message.c_message_id})Author">
<div class="photo48"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({if $c_message.is_received})({$c_message.c_member_id_from})({else})({$c_message.c_member_id_to})({/if})">
<img src="({t_img_url filename=$c_message.image_filename_disp w=48 h=48 noimg=no_image trim=square})" alt="プロフィール写真"></a></div>
<div class="itemData">
<div class="title">
<h2>({$c_message.subject})</h2>
</div>
</div>
</div>
<div class="authorData">
<span class="author message({$c_message.c_message_id})AuthorName">({if $c_message.is_received})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})">({$c_message.c_member_nickname_from})</a>({else})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})">({$c_message.c_member_nickname_to})</a>({/if})さん</span>
</div>
<time datetime="({$c_message.r_datetime})" id="message({$c_message.c_message_id})Datetime" class="datetime">({$c_message.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>

<article class="detailBody">
<p class="itemBody" id="message({$c_message.c_message_id})body">({$c_message.body|t_url2a|nl2br|t_decoration})</p>
({if $c_message.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('.detailBody'); return false;">続きを読む</a></div>({/if})
<ul class="gallery ui-grid-b" id="message({$c_message.c_message_id})gallery">
({if $c_message.image_filename_1 || $c_message.image_filename_2 || $c_message.image_filename_3})
({if $c_message.image_filename_1})<li class="ui-block-a"><a href="({t_img_url filename=$c_message.image_filename_1})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_message.image_filename_1 w=76 h=76})" alt="写真1"></a></li>({/if})
({if $c_message.image_filename_2})<li class="ui-block-b"><a href="({t_img_url filename=$c_message.image_filename_2})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_message.image_filename_2 w=76 h=76})" alt="写真2"></a></li>({/if})
({if $c_message.image_filename_3})<li class="ui-block-c"><a href="({t_img_url filename=$c_message.image_filename_3})" data-transition="pop" data-ajax="false"><img src="({t_img_url filename=$c_message.image_filename_3 w=76 h=76})" alt="写真3"></a></li>({/if})
({/if})
</ul>
({if $c_topic.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})<div class="attachFile" data-inline="true"><a href="({t_url m=pc a=do_h_message_file_download})&amp;target_c_message_id=({$c_message.c_message_id})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})" data-inline="true" data-ajax="false">({$c_message.original_filename})</a></div>({/if})
</article>

<section class="operation">
<ul class="ui-grid-a">
<li class="ui-block-a">
({if $box != 'trash'})
({t_form_block m=pc a=do_h_message_box_delete_message _attr='class="delete" data-ajax="false"'})
<input type="hidden" name="c_message_id[]" value="({$c_message.c_message_id})">
<input type="hidden" name="box" value="({$box})">
<input type="submit" class="input_submit" name="remove" value="削除">
({/t_form_block})
({else})
<a title="削除" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_h_message_box_delete_message})&amp;c_message_id[]=({$c_message.c_message_id})&amp;box=({$box})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message.c_message_id})&amp;box=({$box})', 'deleteMessage({$c_message.c_message_id})Confirm'); openDialog('deleteMessage({$c_message.c_message_id})Confirm')" data-role="button" data-mini="false" data-ajax="true">削除</a>
({/if})
</li>
<li class="ui-block-b">
({if ($box == 'inbox' || !$box) && $c_message.c_member_nickname_from})
({t_form_block m=pc a=page_f_message_send _attr='class="send" data-ajax="false"'})
<input type="hidden" name="target_c_message_id" value="({$c_message.c_message_id})">
<input type="hidden" name="jyusin_c_message_id" value="({$jyusin_c_message_id})">
<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})">
<input type="submit" class="input_submit" name="hensin2" value="返信する">
({/t_form_block})
({elseif $box == 'trash'})
({t_form_block m=pc a=do_h_message_box_delete_message _attr='class="delete" data-ajax="false"'})
<input type="hidden" name="c_message_id[]" value="({$c_message.c_message_id})">
<input type="hidden" name="box" value="({$box})">
<input type="submit" class="input_submit" name="move" value="元に戻す">
({/t_form_block})
({/if})
</li>
</ul>
</section>

</section>({* messageDetailBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
