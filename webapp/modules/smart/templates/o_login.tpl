({t_form_block _attr='name="login" id="login"' m=pc a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})" />
<input type="text" class="input_text" name="username" id="username" tabindex="1" />
<input type="password" class="input_text" name="password" id="password" tabindex="2" />
<div class="msg lh_130">
<input type="checkbox" class="input_checkbox" name="is_save" id="is_save" value="1" tabindex="3" /><label for="is_save">次回から自動的にログイン</label><br />
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})
<span class="password_query"><a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_PC})">&gt;パスワードを忘れた方はこちらへ</a></span>
({/if})
({else})
<span class="password_query"><a href="({t_url m=pc a=page_o_help_login_error})">&gt;ログインできない方はこちら</a></span>
({/if})
({if $SSL_SELECT_URL})
<br /><a href="({$SSL_SELECT_URL})">({if $HTTPS})標準(http)({else})SSL(https)({/if})はこちら</a>
({/if})
</div>
<input type="submit" name="submit" id="button_login" tabindex="4" value="ログイン" />
({/t_form_block})

({if !$IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
<div id="openRegist">
<a href="({t_url m=pc a=page_o_public_invite})" id="button_new_regist">新規登録</a>
</div>
({/if})
