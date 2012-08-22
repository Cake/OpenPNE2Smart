<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="入力されたメールアドレスにメールを送信しました。"})

({* {{{ simpleBox *})<section class="simpleBox" id="registEnd" data-role="">
<p>メール内のＵＲＬをクリックしてログインしてください。（パスワードは現在登録のものをご使用ください。）</p>
</section>({* simpleBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
