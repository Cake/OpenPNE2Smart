({strip})({if $box == "inbox" || !$box})
({capture name="icon"})
({if $item.is_hensin})
<img src="({t_img_url_skin filename=icon_mail_4})" alt="返信済み">
({elseif $item.is_read})
<img src="({t_img_url_skin filename=icon_mail_2})" alt="既読">
({else})
<img src="({t_img_url_skin filename=icon_mail_1})" alt="未読">
({/if})
({/capture})
({capture name="params"})&amp;jyusin_c_message_id=({$item.c_message_id})({/capture})
({elseif $box == "outbox"})
({capture name="icon"})
({if $smarty.const.USE_MESSAGE_OPEN_UNOPEN})
({if $item.is_read})
<img src="({t_img_url_skin filename=icon_mail_2})" alt="受信者開封済み">
({else})
<img src="({t_img_url_skin filename=icon_mail_3})" alt="受信者未開封">
({/if})
({else})
<img src="({t_img_url_skin filename=icon_mail_3})" alt="返信済み">
({/if})
({/capture})
({capture name="params"})&amp;box=outbox({/capture})
({elseif $box == "savebox"})
({capture name="icon"})
<img src="({t_img_url_skin filename=icon_mail_1})" alt="下書き">
({/capture})
({capture name="params"})&amp;jyusin_c_message_id=({$c_message_save.hensinmoto_c_message_id})&amp;box=savebox({/capture})
({elseif $box == "trash"})
({capture name="icon"})
({if $item.c_member_id_to == $u})({* 受信メッセージ *})
    <img src="({t_img_url_skin filename=icon_mail_2})" alt="受信">
({else})
    ({if $item.is_send})({* 送信メッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_3})" alt="送信">
    ({else})({* 下書きメッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_1})" alt="下書き">
    ({/if})
({/if})
({/capture})
({capture name="params"})&amp;box=trash({/capture})
({/if})({/strip})
<li id="message({$item.c_message_id})List" class="commentList messageList({if !$c_message_ru.is_read}) unread({/if})">
<a class="listItemLink" href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$item.c_message_id})({$smarty.capture.params|smarty:nodefaults})" id="message({$item.c_message_id})Link"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image trim=square})" alt="プロフィール写真"></div>
<div class="itemData">
<div class="title" id="message({$item.c_message_id})Title">({$item.subject})</div>
({strip})<div class="authorData">
<span class="authorName">({$item.nickname})</span>
</div>({/strip})
<div class="commentListFooter">
<time datetime="({$item.r_datetime})" id="message({$item.c_message_id})Datetime" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
<span class="icon">({$smarty.capture.icon|smarty:nodefaults})</span>
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})<span class="footer-icon">({t_smart_icon_url icon_name="smart-camera"})</span>({/if})
</div></div>
</section></a></li>


