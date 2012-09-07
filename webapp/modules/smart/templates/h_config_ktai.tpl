<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})
<section class="inviteForm" id="configKtaiForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>携帯メールアドレスを登録/変更する</h3>
<ol>
<li>１．以下の欄に携帯メールアドレスを記入して「送信」ボタンを押してください。</li>
<li>２．記入したメールアドレス宛に「({$SNS_NAME})」よりメールが届きます。</li>
<li>３．メール内に記載されたURLよりアクセスして、ログインしてください。</li>
</ol>
<p>※ドメイン指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのメールを受信できるように指定してください。</p>
<p>※既に携帯メールアドレスが登録されている場合、新しいメールアドレスに変更されます。</p>
({t_form_block m=pc a=do_h_config_ktai_send _attr='data-ajax="false"'})
<div data-role="fieldcontain" class=">
<label for="ktai_address">携帯メールアドレス</label>
<input type="email" class="input_text" name="ktai_address" value="({$form_val.mail})" placeholder="" autocapitalize="off">
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信">
</div>
({/t_form_block})
</section>({*  }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
