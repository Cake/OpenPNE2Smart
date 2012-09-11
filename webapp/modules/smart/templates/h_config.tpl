<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="changeAddressForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>PCメールアドレス設定/変更</h3>
({t_form_block m=pc a=do_h_config_1 _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address">PCメールアドレス</label>
<input type="email" class="input_text" name="pc_address" id="pc_address" placeholder="PCメールアドレス" autocapitalize="off">
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="pc_address2">PCメールアドレス(確認)</label>
<input type="email" class="input_text" name="pc_address2" id="pc_address2" placeholder="PCメールアドレス(確認)" autocapitalize="off">
<p>※メールアドレスは公開されません。
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne' && !$smarty.const.IS_SLAVEPNE_EMAIL_REGIST})
<br>※初期設定ではメールアドレスが登録されておりません。新着情報などご希望の際はご登録ください。
({/if})
</p>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="メールアドレス設定/変更">
</div>
({/t_form_block})
({if $smarty.const.OPENPNE_ENABLE_KTAI})
<p>※携帯メールアドレスは以下から設定/変更してください。登録すると、携帯アドレスでログインすることができます。フィーチャーフォン(従来型携帯)でも利用できます。<br>
<a href="({t_url m=pc a=page_h_config_ktai})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">携帯メールアドレス設定ページへ</a>
</p>
({/if})
</section>({* formTable }}} *})

({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
({* {{{ formTable *})<section class="formTable" id="changePasswordForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>パスワード変更</h3>
({t_form_block m=pc a=do_h_config_2 _attr='data-ajax="false"'})
<div data-role="fieldcontain" class="ui-hide-label">
<label for="old_password">現在のパスワード</label>
<input type="password" class="input_password" name="old_password" id="pc_address" placeholder="現在のパスワード" autocapitalize="off">
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="new_password">新しいパスワード</label>
<input type="password" class="input_password" name="new_password" id="new_password" placeholder="新しいパスワード" autocapitalize="off">
<label for="new_password2">新しいパスワード(確認)</label>
<input type="password" class="input_password" name="new_password2" id="new_password2" placeholder="新しいパスワード(確認)" autocapitalize="off">
<p>※パスワードは6～12文字の半角英数で入力してください。</p>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="パスワード変更">
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})

({* {{{ formTable *})<section class="formTable" id="configForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>設定変更</h3>
({t_form_block m=pc a=do_h_config_3 _attr='data-ajax="false"'})
({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne' && $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<div data-role="fieldcontain">
<label for="c_password_query_id">秘密の質問</label>
<select name="c_password_query_id">
<option>選択してください</option>
({foreach from=$password_query_list key=key item=item})
<option value="({$key})"({if $c_member.c_password_query_id==$key}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>
<label for="c_password_query_answer">秘密の質問の答え</label>
<input type="text" class="input_text" name="c_password_query_answer">
<p class="caution">※変更する場合のみ入力してください。</p>
</div>
({/if})
<div data-role="fieldcontain">
<label for="rss">BlogのURL</label>
<input type="url" class="input_text input_text_long" name="rss" id="pc_address" value="({$c_member.rss})" autocapitalize="off">
<p>※外部にお持ちの日記・BlogのURLをご記入ください。<br>例： http://blog.example.com/</p>
</div>
({if !$is_unused_daily_news})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>デイリー・ニュース</legend>
<input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_1" value="1"({if $c_member.is_receive_daily_news == 1}) checked="checked"({/if})>
<label for="is_receive_daily_news_1">毎日</label>
({if $daily_news_day_num})
<input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_2" value="2"({if $c_member.is_receive_daily_news == 2}) checked="checked"({/if})>
<label for="is_receive_daily_news_2">週({$daily_news_day_num})回 (({$daily_news_day_str}))</label>
({/if})
<input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_0" value="0"({if $c_member.is_receive_daily_news == 0}) checked="checked"({/if})>
<label for="is_receive_daily_news_0">受け取らない</label>
</fieldset>
<p>※({$SNS_NAME})の最新情報をメールでお届けします。</p>
<p>※携帯メールアドレスにはお届けできません。</p>
</div>
({/if})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>メール受信設定(PCメールアドレス)</legend>
<input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_1" value="1"({if $c_member.is_receive_mail}) checked="checked"({/if})>
<label for="is_receive_mail_1">受け取る</label>
<input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_0" value="0"({if !$c_member.is_receive_mail}) checked="checked"({/if})>
<label for="is_receive_mail_0">受け取らない</label>
</fieldset>
<fieldset data-role="controlgroup">
<legend>メール受信設定(携帯メールアドレス)</legend>
<input type="radio" class="input_radio" name="is_receive_ktai_mail" id="is_receive_ktai_mail_1" value="1"({if $c_member.is_receive_ktai_mail}) checked="checked"({/if})>
<label for="is_receive_ktai_mail_1">受け取る</label>
<input type="radio" class="input_radio" name="is_receive_ktai_mail" id="is_receive_ktai_mail_0" value="0"({if !$c_member.is_receive_ktai_mail}) checked="checked"({/if})>
<label for="is_receive_ktai_mail_0">受け取らない</label>
</fieldset>
<p>※新着メッセージの通知などをメールでお届けします。</p>
</div>
({if !$is_unused_ashiato})
<div data-role="fieldcontain">
<label for="ashiato_mail_num">あしあとお知らせメール</label>
<input type="number" class="input_text width_60" name="ashiato_mail_num" id="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" autocapitalize="off">アクセス目にメールを受け取る
<p>※ここで指定したアクセス数に達したとき、お知らせメールが届きます。</p>
<p>※PCメールアドレス/携帯メールアドレスの両方に届きます。</p>
</div>
({/if})
({if $smarty.const.OPENPNE_USE_POINT_RANK && !$is_unused_rank_up})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>ランクアップメール(PCメールアドレス)</legend>
<input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_PC" id="send_rank_up_mail_pc_1" value="1"({if $C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_PC}) checked="checked"({/if})>
<label for="send_rank_up_mail_pc_1">受け取る</label><input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_PC" id="send_rank_up_mail_pc_0" value="0"({if !$C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_PC}) checked="checked"({/if})>
<label for="send_rank_up_mail_pc_0">受け取らない</label>
</fieldset>
<fieldset data-role="controlgroup">
<legend>ランクアップメール(携帯メールアドレス)</legend>
<input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_KTAI" id="send_rank_up_mail_ktai_1" value="1"({if $C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_KTAI}) checked="checked"({/if})>
<label for="send_rank_up_mail_ktai_1">受け取る</label><input type="radio" class="input_radio" name="SEND_RANK_UP_MAIL_KTAI" id="send_rank_up_mail_ktai_0" value="0"({if !$C_MEMBER_CONFIG.SEND_RANK_UP_MAIL_KTAI}) checked="checked"({/if})>
<label for="send_rank_up_mail_ktai_0">受け取らない</label>
</fieldset>
<p>※ランク変更時に登録されているメールにお知らせします。</p>
</div>
({/if})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>({$WORD_DIARY})公開範囲</legend>
<input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_public" value="public"({if $c_member.public_flag_diary == "public"}) checked="checked"({/if})>
<label for="public_flag_diary_public">全員に公開</label>
<input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_friend" value="friend"({if $c_member.public_flag_diary == "friend"}) checked="checked"({/if})>
<label for="public_flag_diary_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_private" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if})>
<label for="public_flag_diary_private">公開しない</label>
</fieldset>
<p>※ここで指定した値が({$WORD_DIARY})作成画面であらかじめ選択されている値となります。<br>
※これまでに書かれた({$WORD_DIARY})の公開範囲は変更されません。</p>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>アクセスブロック</legend>
ID: ({foreach from=$c_member_id_block item=item})
<input type="number" class="input_text  width_60" name="c_member_id_block[]" value="({$item})" autocapitalize="off">
({/foreach})
<input type="number" class="input_text  width_60" name="c_member_id_block[]" autocapitalize="off">
</fieldset>
<p>※アクセスをブロックするメンバーのIDを指定します。</p>
</div>
({if $smarty.const.USE_SHINOBIASHI == 1})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>忍び足モード</legend>
<input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_0" value="0"({if $is_shinobiashi == 0}) checked="checked"({/if})>
<label for="is_shinobiashi_0">あしあとを残す</label>
<input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_1" value="1"({if $is_shinobiashi == 1}) checked="checked"({/if})>
<label for="is_shinobiashi_1">あしあとを残さない</label>
</fieldset>
<p>※他人のページを見たときに、あしあとを残すかどうかを設定することができます。</p>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="設定変更">
</div>
({/t_form_block})
</section>({* formTable }}} *})

({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME || $smarty.const.USE_BOOKMARK_FEED})
({* {{{ formTable *})<section class="formTable" id="myhomeUpdateDisplayForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>マイホーム最新情報表示変更</h3>
({t_form_block m=pc a=do_h_member_config_update_display_home _attr='data-ajax="false"'})
({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>全体の最新({$WORD_DIARY})</legend>
<input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if})>
<label for="is_display_newdiary_home_0">表示する</label>
<input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if})>
<label for="is_display_newdiary_home_1">表示しない</label>
</fieldset>
<p>※マイホームに全体の最新({$WORD_DIARY})を表示します。</p>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>全体の最新({$WORD_COMMUNITY})書き込み</legend>
<input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if})>
<label for="is_display_newtopic_home_0">表示する</label>
<input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if})>
<label for="is_display_newtopic_home_1">表示しない</label>
</fieldset>
<p>※マイホームに全体の最新({$WORD_COMMUNITY})書き込みを表示します。</p>
</div>
({/if})
({if $smarty.const.USE_BOOKMARK_FEED})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>お気に入り最新({$WORD_DIARY})</legend>
<input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if})>
<label for="is_display_bookmark_diary_home_0">表示する</label>
<input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if})>
<label for="is_display_bookmark_diary_home_1">表示しない</label>
</fieldset>
<p>※マイホームにお気に入りの最新({$WORD_DIARY})を表示します。</p>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>お気に入り最新blog</legend>
<input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if})>
<label for="is_display_bookmark_blog_home_0">表示する</label>
<input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if})>
<label for="is_display_bookmark_blog_home_1">表示しない</label>
</fieldset>
<p>※マイホームにお気に入りの最新blogを表示します。</p>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="設定変更">
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})
({* {{{ formTable *})<section class="formTable" id="publicFlagAllForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_DIARY})公開範囲の一括変更</h3>
({t_form_block m=pc a=page_h_set_public_flag_all_confirm _attr='data-ajax="false"'})
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>({$WORD_DIARY})公開範囲</legend>
<input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_public" value="public" checked="checked">
<label for="public_flag_diary_all_public">全員に公開</label>
<input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_friend" value="friend">
<label for="public_flag_diary_all_friend">({$WORD_MY_FRIEND})まで公開</label>
<input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_private" value="private">
<label for="public_flag_diary_all_private">公開しない</label>
</fieldset>
<p>※これまでに書いた({$WORD_DIARY})の公開範囲を一括で変更することができます。</p>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面へ">
</div>
({/t_form_block})
</section>({* formTable }}} *})

({* {{{ formTable *})
({if $c_member.c_member_id == 1})
({* {{{ simpleBox *})<section class="simpleBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$smarty.const.SNS_NAME})を退会する</h3>
<p>ID 1 のメンバーはSNSを退会することができません。</p>
</section>({* simpleBox }}} *})
({else})
({* {{{ infoButtonBox *})<section class="infoButtonBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$smarty.const.SNS_NAME})を退会する</h3>
({t_form_block m=pc a=page_h_taikai_confirm})
<div data-role="fieldcontain"><input type="submit" class="input_submit" value="退会確認ページへ"></div>
({/t_form_block})
</section>({* infoButtonBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
