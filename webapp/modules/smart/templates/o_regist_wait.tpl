<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="登録完了"})

({* {{{ simpleBox *})<section class="simpleBox" id="registWait" data-role="">
<p>({$smarty.const.SNS_NAME}) 管理者へ、参加申請を行いました。<br>
申請処理が終了すると登録されたアドレスにメールが届きますので、しばらくお待ちください。
</p>
</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
