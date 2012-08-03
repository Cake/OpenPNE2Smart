<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ simpleBox *})<section class="simpleBox" id="eventInviteEnd" data-role="">
<h3>イベントお知らせメッセージ</h3>
<p>イベントお知らせメッセージを送信しました。</p>
</section>({* simpleBox }}} *})

<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})" data-role="button" data-direction="reverse">イベントへ戻る</a>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
