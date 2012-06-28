({strip})<span class="public">
({if $item.public_flag == "public"})（全員に公開）
({elseif $item.public_flag == "friend"})（({$WORD_MY_FRIEND})まで公開）
({elseif $item.public_flag == "private"})（公開しない）
({/if})
</span>({/strip})
