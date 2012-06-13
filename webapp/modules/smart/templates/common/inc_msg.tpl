({if !$no_use_alert && ($msg || $msg1 || $msg2 || $msg3 || $err_msg)})
({* {{{ alertBox *})
<section class="alertBox" id="alertBox">
<p>
({if $msg})({$msg})<br />({/if})
({if $msg1})({$msg1})<br />({/if})
({if $msg2})({$msg2})<br />({/if})
({if $msg3})({$msg3})<br />({/if})
({foreach from=$err_msg item=item})
({$item})<br />
({/foreach})
</p>
</section>
({* }}} *})
({/if})
