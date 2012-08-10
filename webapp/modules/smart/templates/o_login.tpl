<div data-role="page" id="pc_page_({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div data-role="content">({* {{{ Page content *})
({ext_include file="common/inc_msg.tpl"})

<section id="loginForm">
({t_form_block _attr='name="login" id="login"' m=pc a=do_o_login _attr='data-ajax="false"'})
<input type="hidden" name="login_params" value="({$requests.login_params})" />
<label for="login_params">({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})メールアドレス({else})ログインＩＤ({/if})</label>
<input type="({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})email({else})text({/if})" class="input_text" name="username" id="username" tabindex="1" autocapitalize="off" />
<label for="password">パスワード</label>
<input type="password" class="input_text" name="password" id="password" tabindex="2" />
<input type="checkbox" class="input_checkbox" name="is_save" id="is_save" value="1" tabindex="3" />
<label for="is_save">次回から自動的にログイン</label>
<input type="submit" name="submit" id="button_login" tabindex="4" value="ログイン" data-ajax="false" />
({/t_form_block})
</section>

({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
<section id="reminder">
({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})
<p class="password_query"><a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">&gt;パスワードを忘れた方はこちらへ</a></p>
({/if})
({else})
<p class="password_query"><a href="({t_url m=pc a=page_o_help_login_error})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">ログインできない方はこちら</a></p>
({/if})
({if $SSL_SELECT_URL})
<br /><a href="({$SSL_SELECT_URL})" data-role="button" data-inline="false" data-mini="false" data-ajax="false">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
</section>
({/if})

({if !$IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
<section id="opRegist">
({t_form_block _attr='name="o_public_regist" id="o_public_regist"' m=pc a=page_o_public_invite _method=get})
<input type="submit" name="submit" id="button_login" tabindex="5" value="新規登録" />
({/t_form_block})
</section>
({/if})

</div>({* Page content}}} *})
({ext_include file="common/inc_footer.tpl"})
</div>
