<div class="subNavi">
({strip})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})">コミュニティカテゴリ設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})">初期コミュニティ設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})">祝日設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})">メール送信設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">メール文言変更</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_USE_POINT_RANK})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">ポイント・ランク設定</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})">招待メールドメイン制限</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})">ブラックリストメンバー管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">CMD設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})">API設定</a>&nbsp;|&nbsp;
({/strip})
</div>
