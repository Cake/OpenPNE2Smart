ALTER TABLE `c_sns_config`
ADD `bg_11` TEXT NOT NULL,
ADD `bg_12` TEXT NOT NULL,
ADD `bg_13` TEXT NOT NULL ,
ADD `caption` varchar(100)  NOT NULL,
ADD `symbol` TEXT NOT NULL;

UPDATE `c_sns_config` SET 
bg_11 = 'C1C6CF',bg_12 = 'FFFFFF',bg_13 = 'E9EAF0',caption = '戻す',symbol='E9EAF0'
WHERE c_sns_config_id=1;

INSERT INTO `c_sns_config` VALUES
(2,'red',    'FFFFFF','DCAA9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','DCAA9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','DCAA9D','FFFFFF','FFFFFF','DCAA9D','FFFFFF','DCAA9D','DCAA9D','FFFFFF','FFFFFF','DCAA9D','E5A6A6','FFFFFF','FAE1DB','赤','E66161'),
(3,'yellow', 'FFFFFF','E9DC90','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','E9DC90','FFFFFF','FFFFFF','FFFFFF','FFFFFF','E9DC90','FFFFFF','FFFFFF','E9DC90','FFFFFF','E9DC90','E9DC90','FFFFFF','FFFFFF','E9DC90','F2D299','FFFFFF','FFF9D6','黄色','FFDE1E'),
(4,'green',  'FFFFFF','AEDC9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','AEDC9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','AEDC9D','FFFFFF','FFFFFF','AEDC9D','FFFFFF','AEDC9D','AEDC9D','FFFFFF','FFFFFF','AEDC9D','C5E5A6','FFFFFF','E3FADB','緑','6FDD46'),
(5,'gold',   'FFFFFF','C6C4B7','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C6C4B7','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C6C4B7','FFFFFF','FFFFFF','C6C4B7','FFFFFF','C6C4B7','C6C4B7','FFFFFF','FFFFFF','C6C4B7','CFCAC1','FFFFFF','F0EFE9','黄金','DEC079'),
(6,'water',  'FFFFFF','95CEEA','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','95CEEA','FFFFFF','FFFFFF','FFFFFF','FFFFFF','95CEEA','FFFFFF','FFFFFF','95CEEA','FFFFFF','95CEEA','95CEEA','FFFFFF','FFFFFF','95CEEA','9BE6F0','FFFFFF','D6F2FF','水色','2BD1E7'),
(7,'purple', 'FFFFFF','C29EE3','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C29EE3','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C29EE3','FFFFFF','FFFFFF','C29EE3','FFFFFF','C29EE3','C29EE3','FFFFFF','FFFFFF','C29EE3','BCA7EC','FFFFFF','EEDCFE','紫','8A1EEA'),
(8,'default','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','B7B9C6','FFFFFF','B7B9C6','B7B9C6','FFFFFF','FFFFFF','B7B9C6','C1C6CF','FFFFFF','E9EAF0','初期設定','E9EAF0');
