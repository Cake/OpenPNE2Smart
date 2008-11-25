CREATE TABLE `tmp_c_sns_config_ktai` (
  `c_sns_config_ktai_id` int(11) NOT NULL auto_increment,
  `key_name` varchar(64) NOT NULL default '',
  `bg_01` text NOT NULL,
  `bg_02` text NOT NULL,
  `bg_03` text NOT NULL,
  `bg_04` text NOT NULL,
  `bg_05` text NOT NULL,
  `bg_06` text NOT NULL,
  `bg_07` text NOT NULL,
  `bg_08` text NOT NULL,
  `bg_09` text NOT NULL,
  `bg_10` text NOT NULL,
  `border_01` text NOT NULL,
  `border_02` text NOT NULL,
  `border_03` text NOT NULL,
  `font_01` text NOT NULL,
  `font_02` text NOT NULL,
  `font_03` text NOT NULL,
  `font_04` text NOT NULL,
  `font_05` text NOT NULL,
  `font_06` text NOT NULL,
  `font_07` text NOT NULL,
  `font_08` text NOT NULL,
  `font_09` text NOT NULL,
  `color_1` text NOT NULL,
  `color_2` text NOT NULL,
  `color_3` text NOT NULL,
  `color_4` text NOT NULL,
  `color_5` text NOT NULL,
  `color_6` text NOT NULL,
  `color_7` text NOT NULL,
  `color_8` text NOT NULL,
  `color_9` text NOT NULL,
  `color_10` text NOT NULL,
  `color_11` text NOT NULL,
  `color_12` text NOT NULL,
  `color_13` text NOT NULL,
  `color_14` text NOT NULL,
  `color_15` text NOT NULL,
  `color_16` text NOT NULL,
  `color_17` text NOT NULL,
  `color_18` text NOT NULL,
  `color_19` text NOT NULL,
  `color_20` text NOT NULL,
  `color_21` text NOT NULL,
  `color_22` text NOT NULL,
  `color_23` text NOT NULL,
  `color_24` text NOT NULL,
  `color_25` text NOT NULL,
  `color_26` text NOT NULL,
  `color_27` text NOT NULL,
  `color_28` text NOT NULL,
  `color_29` text NOT NULL,
  `color_30` text NOT NULL,
  PRIMARY KEY  (`c_sns_config_ktai_id`),
  UNIQUE KEY `key_name` (`key_name`)
) ENGINE=MyISAM;

INSERT INTO tmp_c_sns_config_ktai (key_name,bg_01,bg_02,bg_03,bg_04,bg_05,bg_06,
bg_07,bg_08,bg_09,bg_10,border_01,border_02,border_03,font_01,font_02,font_03,
font_04,font_05,font_06,font_07,font_08,font_09,color_1,color_2,color_3,color_4,
color_5,color_6,color_7,color_8,color_9,color_10,color_11,color_12,color_13,color_14,
color_15,color_16,color_17,color_18,color_19,color_20,color_21,color_22,color_23,
color_24,color_25,color_26,color_27,color_28,color_29,color_30)
  (SELECT key_name,bg_09,bg_01,bg_02,bg_03,bg_04,bg_05,bg_08,
bg_06,bg_07,bg_10,border_01,border_02,border_03,font_05,font_06,
font_07,font_08,font_01,font_02,font_03,font_09,font_04,color_1,
color_2,color_3,color_4,color_5,color_6,color_7,color_8,color_9,color_10,color_11,
color_12,color_13,color_14,color_15,color_16,color_17,color_18,color_19,color_20,
color_21,color_22,color_23,color_24,color_25,color_26,color_27,color_28,color_29,
color_30
     FROM c_sns_config_ktai
     WHERE key_name = "default");

INSERT INTO tmp_c_sns_config_ktai (key_name,bg_01,bg_02,bg_03,bg_04,bg_05,bg_06,
bg_07,bg_08,bg_09,bg_10,border_01,border_02,border_03,font_01,font_02,font_03,
font_04,font_05,font_06,font_07,font_08,font_09,color_1,color_2,color_3,color_4,
color_5,color_6,color_7,color_8,color_9,color_10,color_11,color_12,color_13,color_14,
color_15,color_16,color_17,color_18,color_19,color_20,color_21,color_22,color_23,
color_24,color_25,color_26,color_27,color_28,color_29,color_30)
  (SELECT key_name,bg_09,bg_01,bg_02,bg_03,bg_04,bg_05,bg_08,
bg_06,bg_07,bg_10,border_01,border_02,border_03,font_05,font_06,
font_07,font_08,font_01,font_02,font_03,font_09,font_04,color_1,
color_2,color_3,color_4,color_5,color_6,color_7,color_8,color_9,color_10,color_11,
color_12,color_13,color_14,color_15,color_16,color_17,color_18,color_19,color_20,
color_21,color_22,color_23,color_24,color_25,color_26,color_27,color_28,color_29,
color_30
     FROM c_sns_config_ktai
     WHERE key_name = "current");

DROP TABLE c_sns_config_ktai;
ALTER TABLE tmp_c_sns_config_ktai RENAME TO c_sns_config_ktai;