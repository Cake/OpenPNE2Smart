<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="送信完了しました。"})

({* {{{ simpleBox *})<section class="simpleBox" id="registEnd" data-role="">
<p>
入力されたメールアドレス宛に パスワード再設定用メールを送信しました。<br />
メールに記載されたURLからパスワードの再設定をおこなってください。
</p>
</section>({* simpleBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
