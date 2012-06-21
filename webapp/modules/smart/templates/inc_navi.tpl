({if $INC_NAVI_type === 'h'})
<ul data-role="controlgroup">
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="hLocalNav_({$key+1})"><a href="({$item.url})" data-role="button" data-icon="arrow-r" data-iconpos="right">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
({elseif $INC_NAVI_type === 'f'})
<ul data-role="controlgroup">
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="fLocalNav_({$key+1})"><a href="({$item.url})&amp;target_c_member_id=({$INC_NAVI_c_member_id_friend})" data-role="button" data-icon="arrow-r" data-iconpos="right">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
({elseif $INC_NAVI_type === 'c'})
<ul data-role="controlgroup">
({foreach from=$navi key=key item=item})
({if $item.url})
<li id="cLocalNav_({$key+1})"><a href="({$item.url})&amp;target_c_commu_id=({$INC_NAVI_c_commu_id})" data-role="button" data-icon="arrow-r" data-iconpos="right">({$item.caption})</a></li>
({/if})
({/foreach})
</ul>
({/if})
