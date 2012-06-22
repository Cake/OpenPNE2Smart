({if !$no_use_alert && ($msg || $msg1 || $msg2 || $msg3 || $err_msg)})
({* {{{ alertBox *})
<section class="alertBox ui-body-e" id="alertBox">
({if $msg})<p>({$msg})</p>({/if})
({if $msg1})<p>({$msg1})</p>({/if})
({if $msg2})<p>({$msg2})</p>({/if})
({if $msg3})<p>({$msg3})</p>({/if})
({foreach from=$err_msg item=item})
<p>({$item})</p>
({/foreach})
</section>
({* }}} *})
({/if})
