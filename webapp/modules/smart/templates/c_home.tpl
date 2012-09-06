<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ homePhotoBox *})<section class="homePhotoBox" id="community({$c_commu.c_commu_id})PhotoBox">
<div class="photo76">
<img class="memberPhoto" src="({t_img_url filename=$c_commu.image_filename w=76 h=76 noimg=no_logo})" alt="({$WORD_COMMUNITY})写真">
</div>
<div class="itemData">
<div class="title authorData" id="community({$c_commu.c_commu_id})Name">({$c_commu.name})</div>
<div class="itemBody">
</div>
<div class="commentListFooter">
</div>
({if !$is_c_commu_member})
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_join_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">({$WORD_COMMUNITY})に参加</a>
</div>
({/if})
</div>
</section>({* homePhotoBox }}} *})

({* {{{ homeMainTable *})<section class="homeMainTable homeProfileBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})情報</h3>
<dl>
<dt>カテゴリ</dt>
<dd>({$c_commu.c_commu_category.name})</dd>
<dt>開設日</dt>
<dd>({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})</dd>
<dt>管理者</dt>
<dd><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})">({$c_commu.c_member_admin.nickname})</a></dd>
({if $sub_admin})
<dt>副管理者</dt>
<dd><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$sub_admin.c_member_id})">({$sub_admin.nickname})</a></dd>
({/if})
<dt>メンバー数</dt>
<dd>({$c_commu.member_count|default:"0"})人</dd>
<dt>参加条件</dt>
<dd>({if $c_commu.is_admit == 'public'})誰でも参加可能({elseif $c_commu.is_admit == 'auth'})管理者の承認が必要({/if})</dd>
<dt>公開範囲</dt>
<dd>({if $c_commu.is_open == 'public'})全員に公開({elseif $c_commu.is_open == 'member'})({$WORD_COMMUNITY})参加者にのみ公開({/if})</dd>
<dt>トピック作成</dt>
<dd>({if $c_commu.is_topic == 'member'})参加者のみ作成可能({elseif $c_commu.is_topic == 'admin_only'})管理者のみ作成可能({elseif $c_commu.is_topic == 'public'})誰でも作成可能({/if})</dd>
<dt>コメント作成</dt>
<dd>({if $c_commu.is_comment == 'member'})参加者のみ作成可能({elseif $c_commu.is_comment == 'public'})誰でも作成可能({/if})</dd>
<dt>({$WORD_COMMUNITY})説明文</dt>
<dd id="community({$c_commu.c_commu_id})info">
<div class="itemBody">
({$c_commu.info|t_url2a|nl2br|t_decoration})
</div>
({if $c_commu.isShorten})<div class="readMore">...</div><div class="readMore"><a title="続きを読む" href="javascript:void(0);" onclick="readMore('#community({$c_commu.c_commu_id})info'); return false;">続きを読む</a></div>({/if})
</dd>
</dl>
({if $is_c_commu_admin})<a href="({t_url m=pc a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">({$WORD_COMMUNITY})設定変更</a>({/if})
</section>({* }}} *})

({if $is_c_commu_member || $c_commu.is_open != "member"})
({* {{{ homeMainTable *})<section class="homeMainTable" id="community({$c_commu.c_commu_id})TopicTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})掲示板</h3>
<div class="recentListBox">
({if $new_topic_comment})
<ul class="pictureIconList" id="community({$c_commu.c_commu_id})Topic" data-role="listview">
({foreach from=$new_topic_comment item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a>
</div>
({else})
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">トピックを作成</a>
</div>
({/if})
({/if})
</div>
</section>({* homeMainTable }}} *})

({* {{{ homeMainTable *})<section class="homeMainTable" id="community({$c_commu.c_commu_id})EventTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>新着のイベント</h3>
<div class="recentListBox">
({if $new_topic_comment_event})
<ul class="pictureIconList" id="community({$c_commu.c_commu_id})Event" data-role="listview">
({foreach from=$new_topic_comment_event item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">もっと見る</a>
</div>
({else})
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">イベントを作成</a>
</div>
({/if})
({/if})
</div>
</section>({* homeMainTable }}} *})

({ext_include file="inc_c_com_topic_find.tpl"})

({if $is_c_commu_member && !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
({* {{{ homeMainTable *})<section class="homeMainTable" id="community({$c_commu.c_commu_id})ConfigTable" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>メール受信設定</h3>
<div class="recentListBox">
({t_form_block m=pc a=do_c_home_update_is_receive_mail _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
({if !$is_c_commu_admin})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>管理者からのメッセージを</legend>
<input type="radio" class="input_radio" value="1" id="is_receive_message_1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if}) />
<label for="is_receive_message_1">受け取る</label>
<input type="radio" class="input_radio" value="0" id="is_receive_message_0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if}) />
<label for="is_receive_message_0">受け取らない</label>
</fieldset>
</div>
({/if})
({if $smarty.const.OPENPNE_ENABLE_KTAI && !$is_unused_ktai_bbs && $is_registered_ktai_address})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>({$WORD_COMMUNITY})書き込みを携帯メールで</legend>
<input type="radio" class="input_radio" value="1" id="is_receive_mail_1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if}) />
<label for="is_receive_mail_1">受け取る</label>
<input type="radio" class="input_radio" value="0" id="is_receive_mail_0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if}) />
<label for="is_receive_mail_0">受け取らない</label>
</fieldset>
</div>
({/if})
({if !$is_unused_pc_bbs})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>({$WORD_COMMUNITY})書き込みをPCメールで</legend>
<input type="radio" class="input_radio" value="1" id="is_receive_mail_pc_1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if}) />
<label for="is_receive_mail_pc_1">受け取る</label>
<input type="radio" class="input_radio" value="0" id="is_receive_mail_pc_0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if}) />
<label for="is_receive_mail_pc_0">受け取らない</label>
</fieldset>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="設定変更" />
</div>
({/t_form_block})
</div>
</section>({* homeMainTable }}} *})
({/if})

({* {{{ homeTab *})<section class="homeTab" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})メンバー</h3>
({* {{{ homeMainTable *})<section class="photoTableBox homeMainTable" id="community({$c_commu.c_commu_id})MemberTable">
({* {{{ homeNineTable *})<div class="homeNineTable" id="community({$c_commu.c_commu_id})Member">
<ul id="community({$c_commu.c_commu_id})MemberTablecontent" class="photoTable" data-role="listview" data-inset="false">
({ext_include file="inc_member_table.tpl" member=$c_commu_member_list _start=$key*9})
</ul>
<div class="moreInfo">
<a href="({t_url m=pc a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">全て見る(({$c_commu.member_count})人)</a>
({if $is_c_commu_admin && $c_commu.member_count > 1})
<a href="({t_url m=pc a=page_c_send_message})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">参加者にメッセージを送る</a>
<a href="({t_url m=pc a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">メンバー管理</a>
({/if})
<a href="({t_url m=pc a=page_c_invite})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-mini="false" data-ajax="true">({$WORD_MY_FRIEND})に紹介</a>
</div>
</div>({* homeNineTable }}} *})
</section>({* homeMainTable }}} *})
</section>({* homeTab }}} *})
({/if})

<a href="({t_url m=pc a=page_c_leave_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-mini="false" data-ajax="true">({$WORD_COMMUNITY})を退会</a>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
