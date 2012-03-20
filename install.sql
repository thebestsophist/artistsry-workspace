
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_bilink` ***
DROP TABLE IF EXISTS `tbl_fields_bilink`;
CREATE TABLE `tbl_fields_bilink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `linked_section_id` int(11) unsigned DEFAULT NULL,
  `linked_field_id` int(11) unsigned DEFAULT NULL,
  `allow_editing` enum('yes','no') DEFAULT 'no',
  `allow_multiple` enum('yes','no') DEFAULT 'no',
  `column_mode` enum('count','first-item','last-item','small-list','large-list') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `linked_section_id` (`linked_section_id`),
  KEY `linked_field_id` (`linked_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_bilink` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (49, 48, 'off', 'Do you wish to allow open registration?');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (50, 52, 'off', 'Show number of views for artwork?');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (48, 57, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (46, 90, 'off', 'Has this been responded to?');

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (34, 81, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (35, 72, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (37, 42, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (30, 87, 'yes');

-- *** STRUCTURE: `tbl_fields_image_upload` ***
DROP TABLE IF EXISTS `tbl_fields_image_upload`;
CREATE TABLE `tbl_fields_image_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  `unique` varchar(50) DEFAULT NULL,
  `min_width` int(11) unsigned DEFAULT NULL,
  `min_height` int(11) unsigned DEFAULT NULL,
  `max_width` int(11) unsigned DEFAULT NULL,
  `max_height` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_image_upload` ***
INSERT INTO `tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`) VALUES (16, 58, '/workspace/uploads/artwork', '/\\.(?:gif|jpe?g|png)$/i', 'yes', 700, 600, 0, 0);

-- *** STRUCTURE: `tbl_fields_incrementnumber` ***
DROP TABLE IF EXISTS `tbl_fields_incrementnumber`;
CREATE TABLE `tbl_fields_incrementnumber` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `developers_only` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_incrementnumber` ***
INSERT INTO `tbl_fields_incrementnumber` (`id`, `field_id`, `developers_only`) VALUES (23, 43, 'yes');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (221, 37, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (220, 36, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (219, 35, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (217, 33, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (218, 34, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (215, 32, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (216, 92, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (214, 31, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (224, 56, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (213, 28, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (222, 38, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (223, 40, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (22, 50, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (130, 69, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (193, 83, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (192, 82, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (199, 78, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (202, 75, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (194, 86, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (200, 88, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (201, 89, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');

-- *** STRUCTURE: `tbl_fields_memberactivation` ***
DROP TABLE IF EXISTS `tbl_fields_memberactivation`;
CREATE TABLE `tbl_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberactivation` ***
INSERT INTO `tbl_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`) VALUES (19, 27, '24 hours', 1, 'yes');

-- *** STRUCTURE: `tbl_fields_memberemail` ***
DROP TABLE IF EXISTS `tbl_fields_memberemail`;
CREATE TABLE `tbl_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberemail` ***
INSERT INTO `tbl_fields_memberemail` (`id`, `field_id`) VALUES (19, 24);

-- *** STRUCTURE: `tbl_fields_memberpassword` ***
DROP TABLE IF EXISTS `tbl_fields_memberpassword`;
CREATE TABLE `tbl_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `code_expiry` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberpassword` ***
INSERT INTO `tbl_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`) VALUES (19, 25, 6, 'weak', 'RLeStoEvLudrleTrlewlaJoewl1fRO28rIezlABr8afoani2diUQousPIepr', '24 hours');

-- *** STRUCTURE: `tbl_fields_memberrole` ***
DROP TABLE IF EXISTS `tbl_fields_memberrole`;
CREATE TABLE `tbl_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberrole` ***
INSERT INTO `tbl_fields_memberrole` (`id`, `field_id`, `default_role`) VALUES (19, 26, 1);

-- *** STRUCTURE: `tbl_fields_memberusername` ***
DROP TABLE IF EXISTS `tbl_fields_memberusername`;
CREATE TABLE `tbl_fields_memberusername` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberusername` ***
INSERT INTO `tbl_fields_memberusername` (`id`, `field_id`, `validator`) VALUES (19, 23, NULL);

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_number` ***

-- *** STRUCTURE: `tbl_fields_oembed` ***
DROP TABLE IF EXISTS `tbl_fields_oembed`;
CREATE TABLE `tbl_fields_oembed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `refresh` int(11) unsigned DEFAULT NULL,
  `driver` varchar(150) DEFAULT NULL,
  `unique` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_oembed` ***
INSERT INTO `tbl_fields_oembed` (`id`, `field_id`, `refresh`, `driver`, `unique`) VALUES (7, 68, NULL, NULL, 'no');

-- *** STRUCTURE: `tbl_fields_publish_tabs` ***
DROP TABLE IF EXISTS `tbl_fields_publish_tabs`;
CREATE TABLE `tbl_fields_publish_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_publish_tabs` ***

-- *** STRUCTURE: `tbl_fields_search_index` ***
DROP TABLE IF EXISTS `tbl_fields_search_index`;
CREATE TABLE `tbl_fields_search_index` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_search_index` ***

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (38, 53, 'yes', 'no', 50, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (39, 70, 'no', 'no', 69, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (34, 76, 'no', 'yes', 23, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (33, 79, 'no', 'yes', 23, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (29, 85, 'no', 'yes', 23, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (40, 91, 'no', 'yes', 23, 20);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_taglist` ***
INSERT INTO `tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (23, 45, NULL, 'existing');

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (12, 51, 'markdown_with_purifier', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (84, 47, 'markdown_with_purifier', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (83, 44, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (82, 29, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (87, 62, 'markdown_with_purifier', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (77, 73, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (78, 74, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (79, 77, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (68, 84, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (76, 80, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (88, 64, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (89, 93, 'markdown', 15);

-- *** STRUCTURE: `tbl_fields_uniqueupload` ***
DROP TABLE IF EXISTS `tbl_fields_uniqueupload`;
CREATE TABLE `tbl_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_uniqueupload` ***
INSERT INTO `tbl_fields_uniqueupload` (`id`, `field_id`, `destination`, `validator`) VALUES (19, 55, '/workspace/uploads/artists', '/\\.(?:jpe?g|png)$/i');

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_upload` ***

-- *** STRUCTURE: `tbl_entries_data_23` ***
DROP TABLE IF EXISTS `tbl_entries_data_23`;
CREATE TABLE `tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`handle`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_23` ***

-- *** STRUCTURE: `tbl_entries_data_24` ***
DROP TABLE IF EXISTS `tbl_entries_data_24`;
CREATE TABLE `tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_24` ***

-- *** STRUCTURE: `tbl_entries_data_25` ***
DROP TABLE IF EXISTS `tbl_entries_data_25`;
CREATE TABLE `tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `recovery-code` varchar(40) DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `reset` enum('yes','no') DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_25` ***

-- *** STRUCTURE: `tbl_entries_data_26` ***
DROP TABLE IF EXISTS `tbl_entries_data_26`;
CREATE TABLE `tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_26` ***

-- *** STRUCTURE: `tbl_entries_data_27` ***
DROP TABLE IF EXISTS `tbl_entries_data_27`;
CREATE TABLE `tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_27` ***

-- *** STRUCTURE: `tbl_entries_data_28` ***
DROP TABLE IF EXISTS `tbl_entries_data_28`;
CREATE TABLE `tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=824 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_28` ***

-- *** STRUCTURE: `tbl_entries_data_29` ***
DROP TABLE IF EXISTS `tbl_entries_data_29`;
CREATE TABLE `tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_29` ***

-- *** STRUCTURE: `tbl_entries_data_31` ***
DROP TABLE IF EXISTS `tbl_entries_data_31`;
CREATE TABLE `tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=622 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_31` ***

-- *** STRUCTURE: `tbl_entries_data_32` ***
DROP TABLE IF EXISTS `tbl_entries_data_32`;
CREATE TABLE `tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=604 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_32` ***

-- *** STRUCTURE: `tbl_entries_data_33` ***
DROP TABLE IF EXISTS `tbl_entries_data_33`;
CREATE TABLE `tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_33` ***

-- *** STRUCTURE: `tbl_entries_data_34` ***
DROP TABLE IF EXISTS `tbl_entries_data_34`;
CREATE TABLE `tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=472 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_34` ***

-- *** STRUCTURE: `tbl_entries_data_35` ***
DROP TABLE IF EXISTS `tbl_entries_data_35`;
CREATE TABLE `tbl_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_35` ***

-- *** STRUCTURE: `tbl_entries_data_36` ***
DROP TABLE IF EXISTS `tbl_entries_data_36`;
CREATE TABLE `tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_36` ***

-- *** STRUCTURE: `tbl_entries_data_37` ***
DROP TABLE IF EXISTS `tbl_entries_data_37`;
CREATE TABLE `tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_37` ***

-- *** STRUCTURE: `tbl_entries_data_38` ***
DROP TABLE IF EXISTS `tbl_entries_data_38`;
CREATE TABLE `tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_38` ***

-- *** STRUCTURE: `tbl_entries_data_40` ***
DROP TABLE IF EXISTS `tbl_entries_data_40`;
CREATE TABLE `tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_40` ***

-- *** STRUCTURE: `tbl_entries_data_42` ***
DROP TABLE IF EXISTS `tbl_entries_data_42`;
CREATE TABLE `tbl_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_42` ***

-- *** STRUCTURE: `tbl_entries_data_43` ***
DROP TABLE IF EXISTS `tbl_entries_data_43`;
CREATE TABLE `tbl_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_43` ***

-- *** STRUCTURE: `tbl_entries_data_44` ***
DROP TABLE IF EXISTS `tbl_entries_data_44`;
CREATE TABLE `tbl_entries_data_44` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_44` ***

-- *** STRUCTURE: `tbl_entries_data_45` ***
DROP TABLE IF EXISTS `tbl_entries_data_45`;
CREATE TABLE `tbl_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_45` ***

-- *** STRUCTURE: `tbl_entries_data_47` ***
DROP TABLE IF EXISTS `tbl_entries_data_47`;
CREATE TABLE `tbl_entries_data_47` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_47` ***
INSERT INTO `tbl_entries_data_47` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 16, NULL, NULL);

-- *** STRUCTURE: `tbl_entries_data_48` ***
DROP TABLE IF EXISTS `tbl_entries_data_48`;
CREATE TABLE `tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_48` ***
INSERT INTO `tbl_entries_data_48` (`id`, `entry_id`, `value`) VALUES (4, 16, 'no');

-- *** STRUCTURE: `tbl_entries_data_50` ***
DROP TABLE IF EXISTS `tbl_entries_data_50`;
CREATE TABLE `tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_50` ***
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (11, 12, 'art-for-sale', 'Art for sale');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (17, 8, 'collaboration', 'Collaboration');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (16, 9, 'mentoring', 'Mentoring');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (15, 15, 'teaching-lessons', 'Teaching/Lessons');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (9, 11, 'performances', 'Performances');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (13, 13, 'open-galleries', 'Open galleries');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (14, 14, 'shared-studio-space', 'Shared studio space');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (18, 155, 'art-supplies-for-sale', 'Art supplies for sale');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (19, 156, 'producer', 'Producer');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (20, 157, 'repairs', 'Repairs');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (21, 158, 'composer', 'Composer');
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `handle`, `value`) VALUES (22, 159, 'accompanist', 'Accompanist ');

-- *** STRUCTURE: `tbl_entries_data_51` ***
DROP TABLE IF EXISTS `tbl_entries_data_51`;
CREATE TABLE `tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_51` ***
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (17, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (16, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (15, 15, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (9, 11, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (11, 12, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (13, 13, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (14, 14, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (18, 155, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (19, 156, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (20, 157, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (21, 158, NULL, NULL);
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (22, 159, NULL, NULL);

-- *** STRUCTURE: `tbl_entries_data_52` ***
DROP TABLE IF EXISTS `tbl_entries_data_52`;
CREATE TABLE `tbl_entries_data_52` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_52` ***
INSERT INTO `tbl_entries_data_52` (`id`, `entry_id`, `value`) VALUES (4, 16, 'yes');

-- *** STRUCTURE: `tbl_entries_data_53` ***
DROP TABLE IF EXISTS `tbl_entries_data_53`;
CREATE TABLE `tbl_entries_data_53` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1463 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_53` ***

-- *** STRUCTURE: `tbl_entries_data_55` ***
DROP TABLE IF EXISTS `tbl_entries_data_55`;
CREATE TABLE `tbl_entries_data_55` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_55` ***

-- *** STRUCTURE: `tbl_entries_data_56` ***
DROP TABLE IF EXISTS `tbl_entries_data_56`;
CREATE TABLE `tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_56` ***

-- *** STRUCTURE: `tbl_entries_data_57` ***
DROP TABLE IF EXISTS `tbl_entries_data_57`;
CREATE TABLE `tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_57` ***

-- *** STRUCTURE: `tbl_entries_data_58` ***
DROP TABLE IF EXISTS `tbl_entries_data_58`;
CREATE TABLE `tbl_entries_data_58` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_58` ***

-- *** STRUCTURE: `tbl_entries_data_62` ***
DROP TABLE IF EXISTS `tbl_entries_data_62`;
CREATE TABLE `tbl_entries_data_62` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_62` ***
INSERT INTO `tbl_entries_data_62` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 53, '# Visitors\r\nThe site belongs to us, but the rights to the artwork posted here belong to the artist. Please respect their rights.\r\n\r\n# Artists\r\nWhatever you post here belongs to you. We hold no special rights over what you create. Everything you upload to our servers for public viewing still belong to you (think of us as an art gallery), you can remove them whenever you like (assuming our servers are running properly). We\'re here to help you publicize the awesome things you create.', '<h1>Visitors</h1>\n\n<p>The site belongs to us, but the rights to the artwork posted here belong to the artist. Please respect their rights.</p>\n\n<h1>Artists</h1>\n\n<p>Whatever you post here belongs to you. We hold no special rights over what you create. Everything you upload to our servers for public viewing still belong to you (think of us as an art gallery), you can remove them whenever you like (assuming our servers are running properly). We\'re here to help you publicize the awesome things you create.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_64` ***
DROP TABLE IF EXISTS `tbl_entries_data_64`;
CREATE TABLE `tbl_entries_data_64` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_64` ***
INSERT INTO `tbl_entries_data_64` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 53, '# Everyone\r\n\r\nWe don\'t share your information without your consent. Ever.\r\n\r\n## Artists\r\nWe require your email address so we can confirm your account and in case you lose your password.', NULL);

-- *** STRUCTURE: `tbl_entries_data_68` ***
DROP TABLE IF EXISTS `tbl_entries_data_68`;
CREATE TABLE `tbl_entries_data_68` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `res_id` varchar(128) DEFAULT NULL,
  `url` varchar(2048) DEFAULT NULL,
  `url_oembed_xml` varchar(2048) DEFAULT NULL,
  `title` varchar(2048) DEFAULT NULL,
  `thumbnail_url` varchar(2048) DEFAULT NULL,
  `oembed_xml` text,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_68` ***

-- *** STRUCTURE: `tbl_entries_data_69` ***
DROP TABLE IF EXISTS `tbl_entries_data_69`;
CREATE TABLE `tbl_entries_data_69` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_69` ***
INSERT INTO `tbl_entries_data_69` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 64, 'full-page-photo', 'Full Page Photo');
INSERT INTO `tbl_entries_data_69` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 65, 'gallery', 'Gallery');

-- *** STRUCTURE: `tbl_entries_data_70` ***
DROP TABLE IF EXISTS `tbl_entries_data_70`;
CREATE TABLE `tbl_entries_data_70` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=733 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_70` ***

-- *** STRUCTURE: `tbl_entries_data_72` ***
DROP TABLE IF EXISTS `tbl_entries_data_72`;
CREATE TABLE `tbl_entries_data_72` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_72` ***

-- *** STRUCTURE: `tbl_entries_data_73` ***
DROP TABLE IF EXISTS `tbl_entries_data_73`;
CREATE TABLE `tbl_entries_data_73` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_73` ***

-- *** STRUCTURE: `tbl_entries_data_74` ***
DROP TABLE IF EXISTS `tbl_entries_data_74`;
CREATE TABLE `tbl_entries_data_74` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_74` ***

-- *** STRUCTURE: `tbl_entries_data_75` ***
DROP TABLE IF EXISTS `tbl_entries_data_75`;
CREATE TABLE `tbl_entries_data_75` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_75` ***

-- *** STRUCTURE: `tbl_entries_data_76` ***
DROP TABLE IF EXISTS `tbl_entries_data_76`;
CREATE TABLE `tbl_entries_data_76` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_76` ***

-- *** STRUCTURE: `tbl_entries_data_77` ***
DROP TABLE IF EXISTS `tbl_entries_data_77`;
CREATE TABLE `tbl_entries_data_77` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_77` ***

-- *** STRUCTURE: `tbl_entries_data_78` ***
DROP TABLE IF EXISTS `tbl_entries_data_78`;
CREATE TABLE `tbl_entries_data_78` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_78` ***
INSERT INTO `tbl_entries_data_78` (`id`, `entry_id`, `handle`, `value`) VALUES (10, 152, 'welcome-to-the-artists-and-8217-ry', 'Welcome to the Artists&#8217;ry!');
INSERT INTO `tbl_entries_data_78` (`id`, `entry_id`, `handle`, `value`) VALUES (12, 185, 'introduction-to-the-artistsry', 'Introduction to the Artists\'ry');

-- *** STRUCTURE: `tbl_entries_data_79` ***
DROP TABLE IF EXISTS `tbl_entries_data_79`;
CREATE TABLE `tbl_entries_data_79` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_79` ***
INSERT INTO `tbl_entries_data_79` (`id`, `entry_id`, `relation_id`) VALUES (10, 152, 84);
INSERT INTO `tbl_entries_data_79` (`id`, `entry_id`, `relation_id`) VALUES (12, 185, 84);

-- *** STRUCTURE: `tbl_entries_data_80` ***
DROP TABLE IF EXISTS `tbl_entries_data_80`;
CREATE TABLE `tbl_entries_data_80` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_80` ***
INSERT INTO `tbl_entries_data_80` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (10, 152, 'Thank you for being a part of the first group of beta testers!\r\n\r\nThe first thing you will notice is that the site feels unfinished. It is. We will be making updates and changes to the site all the time. Sometimes even while you&#8217;re using it. Outside of us developers, you are among the first few people who have had a chance to see this site in action, so you are our fresh eyes. We have been living and breathing every aspect of this site for a very long time, so we know it inside and out. You do not. If something confusing to you, it will probably be confusing to someone else, too. So use the feedback button at the bottom right and let us know. Also, you are our first line of defense against the giant pile of undiscovered bugs. When you find a problem, use the Feedback button at the bottom right side of the page. Let us know what you were doing and what went wrong. Finally, if you see something you think needs improvement, or if you think of some improvement–no matter how minor–let us know. Even though you&#8217;re not writing code, you are an important part of our development team.\r\n\r\nWe&#8217;ll be rolling out updates throughout the next few weeks. One of the things that is coming out in the next few days are artist messages for your profile visitors to contact you. Do not worry, we will not be giving out your email address. You&#8217;ll be able to check your messages right here on the site from your account page. I&#8217;ll make a note here on the announcements page when it is up and running.\r\n\r\nIf you have not done so yet, go to the <a href=\"../account/first-time\">First Time</a> page to add your profile information to your account. Here you can add your biography and other information such as your website, Flickr account, and Facebook pages you have for your art or business.\r\n\r\nFinally, use this announcements page to talk to each other. Think of it as the bulletin board, and remember to come back to check it! It is only as useful as you all make it. Again, welcome and thank you for helping out. I hope you&#8217;re as excited about this as we are.', '<p>Thank you for being a part of the first group of beta testers!</p>\n\n<p>The first thing you will notice is that the site feels unfinished. It is. We will be making updates and changes to the site all the time. Sometimes even while you&#8217;re using it. Outside of us developers, you are among the first few people who have had a chance to see this site in action, so you are our fresh eyes. We have been living and breathing every aspect of this site for a very long time, so we know it inside and out. You do not. If something confusing to you, it will probably be confusing to someone else, too. So use the feedback button at the bottom right and let us know. Also, you are our first line of defense against the giant pile of undiscovered bugs. When you find a problem, use the Feedback button at the bottom right side of the page. Let us know what you were doing and what went wrong. Finally, if you see something you think needs improvement, or if you think of some improvement–no matter how minor–let us know. Even though you&#8217;re not writing code, you are an important part of our development team.</p>\n\n<p>We&#8217;ll be rolling out updates throughout the next few weeks. One of the things that is coming out in the next few days are artist messages for your profile visitors to contact you. Do not worry, we will not be giving out your email address. You&#8217;ll be able to check your messages right here on the site from your account page. I&#8217;ll make a note here on the announcements page when it is up and running.</p>\n\n<p>If you have not done so yet, go to the <a href=\"../account/first-time\">First Time</a> page to add your profile information to your account. Here you can add your biography and other information such as your website, Flickr account, and Facebook pages you have for your art or business.</p>\n\n<p>Finally, use this announcements page to talk to each other. Think of it as the bulletin board, and remember to come back to check it! It is only as useful as you all make it. Again, welcome and thank you for helping out. I hope you&#8217;re as excited about this as we are.</p>\n');
INSERT INTO `tbl_entries_data_80` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (12, 185, '<a href=\"http://vimeo.com/35814970\">This video</a> is an introduction to the Artists\'ry. It shows how to create your new profile and upload new artwork.\r\n\r\n', '<p><a href=\"http://vimeo.com/35814970\">This video</a> is an introduction to the Artists\'ry. It shows how to create your new profile and upload new artwork.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_81` ***
DROP TABLE IF EXISTS `tbl_entries_data_81`;
CREATE TABLE `tbl_entries_data_81` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_81` ***
INSERT INTO `tbl_entries_data_81` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (10, 152, '2012-01-23T07:10:00+00:00', 1327302600, 1327302600);
INSERT INTO `tbl_entries_data_81` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (12, 185, '2012-01-29T18:19:00+00:00', 1327861140, 1327861140);

-- *** STRUCTURE: `tbl_entries_data_82` ***
DROP TABLE IF EXISTS `tbl_entries_data_82`;
CREATE TABLE `tbl_entries_data_82` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_82` ***

-- *** STRUCTURE: `tbl_entries_data_83` ***
DROP TABLE IF EXISTS `tbl_entries_data_83`;
CREATE TABLE `tbl_entries_data_83` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_83` ***

-- *** STRUCTURE: `tbl_entries_data_84` ***
DROP TABLE IF EXISTS `tbl_entries_data_84`;
CREATE TABLE `tbl_entries_data_84` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_84` ***

-- *** STRUCTURE: `tbl_entries_data_85` ***
DROP TABLE IF EXISTS `tbl_entries_data_85`;
CREATE TABLE `tbl_entries_data_85` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_85` ***

-- *** STRUCTURE: `tbl_entries_data_86` ***
DROP TABLE IF EXISTS `tbl_entries_data_86`;
CREATE TABLE `tbl_entries_data_86` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_86` ***

-- *** STRUCTURE: `tbl_entries_data_87` ***
DROP TABLE IF EXISTS `tbl_entries_data_87`;
CREATE TABLE `tbl_entries_data_87` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_87` ***

-- *** STRUCTURE: `tbl_entries_data_88` ***
DROP TABLE IF EXISTS `tbl_entries_data_88`;
CREATE TABLE `tbl_entries_data_88` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_88` ***

-- *** STRUCTURE: `tbl_entries_data_89` ***
DROP TABLE IF EXISTS `tbl_entries_data_89`;
CREATE TABLE `tbl_entries_data_89` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_89` ***

-- *** STRUCTURE: `tbl_entries_data_90` ***
DROP TABLE IF EXISTS `tbl_entries_data_90`;
CREATE TABLE `tbl_entries_data_90` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_90` ***

-- *** STRUCTURE: `tbl_entries_data_91` ***
DROP TABLE IF EXISTS `tbl_entries_data_91`;
CREATE TABLE `tbl_entries_data_91` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_91` ***

-- *** STRUCTURE: `tbl_entries_data_92` ***
DROP TABLE IF EXISTS `tbl_entries_data_92`;
CREATE TABLE `tbl_entries_data_92` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_92` ***

-- *** STRUCTURE: `tbl_entries_data_93` ***
DROP TABLE IF EXISTS `tbl_entries_data_93`;
CREATE TABLE `tbl_entries_data_93` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_93` ***

-- *** DATA: `tbl_canofspam_tracking` ***
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (339, 'ce18af60a37e80d60a47e04bf79bae78', '8639e89c35fba9cff10cc4265d4a0832');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (340, '85654783dd877bff6ea9eef8b35bb3d2', 'a81eb94df9f0e886ea02019f6f46562f');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (151, '9122edee6bde3c117156b484ede95b2d', '698b35e6a5dcf8ae1a063d00e6ed029e');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (443, '8ca9b361fffe53896b54732016840d9a', '7f411c7a3b46360a0f651a244c291ad4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (513, 'c90605a3b03af32d6840675c3c2b6c8e', '76e197c793eaafeb9cb5762d167def0b');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (357, 'c727f5d92dfdca5a575ec2e61ce07028', '56e7c03b30b8d57df02ab7c1ebbec30d');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (507, '597376c7db75bd65ece584cd8b6b9715', '5fbfa633f4d7c475910f3e3f01e62696');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (452, 'ebad4b43eaaefed18e540b5e6cb64551', 'f637ea757b93ed73c2ff17bc086fd19f');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (563, '28deece5863746b917c57dbcfa9baac5', '694f43cb6808b79938796221d8478a87');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (577, 'f0f4974ebe73b986fb4c5d8183584900', '46d6477b589b9c2c8da5505b4cd65061');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (584, '41d85284ebee8cdc8fbb0c18f85995ff', '5b64613c9da5d5e0b6f7268f26c359bf');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (487, '8fb31138a170692b11b3d47481328526', 'e0d241258d9fcdde7bd122b9f2dca493');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (488, '29ac6e66d53a048dcfca1cd42f718235', 'a1ed2ae08c46b9e6925e4457db64bf7b');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (556, '167c6fa5cc064afca0a2c8db3c413621', '418e3c50e419617cb65aadfebc08aa47');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (539, '95327f963131a75642a45f8ee3bb477b', '7ea67384c12453269a005303903492b4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (542, '25ce4471c34e7d355c5f9b4bc37ba5e6', '2a399136575070eaa29e4b6493269352');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (551, 'be7985b584c436bf7ced5c59325f6f29', 'b8496ad93acd8550358fa440a69eb186');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (557, '0cd8198d67ff30ddc3d6716b3dbfd3be', 'da57848e62e98b9dd2895f8caec95e27');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (558, '20f71474ed165cb23ef3d7c0ef8da69a', '2b625175972331a70cb29dc5d09337be');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (559, 'acb8a8628368cd8e6fa3771c2752d46e', 'b7c0d989d0839448287fda48bc2ba2db');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (560, '3d270c937464d3c7eb8f9e55cf177ce4', '4a21a89e0c4f0e8594cea11d0dae4bbd');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (561, '52d65f6f0e2b70946c89a08958f27fe5', 'cd0420e0033b97ba3de12efd21d9d725');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (564, 'cb44aa7217cccefe589a8b6a01bf49ad', 'd4bd1aa98e1c644080b7dfe48df82af6');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (565, 'ed5bd13555c1cda25b7abd1991b0ad98', '39177e4f7875218a72f8a0cabfd73116');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (572, 'd2b39b2297b4332d78b292359cd0b010', 'cf19fdbfb54fcc0bdf3f9fd44a992ce4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (573, 'd1db305fba2760e3e2356c31b03feedf', 'c573d1be7e5b484e5ed39793e225b5b5');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (574, '8a0598aa68dc1c909398762de544d9a1', '149032583aed392473793a54aba7f94f');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (575, '629809cc025bea2e22ca7216d02e9877', '9b0416621c821a9ea8fb45839ac56afe');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (580, 'cfd1932c77b8b7df84db186a6161afe7', 'd13af84e8ca4dc694beecc873effdfb1');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (581, '990a6cef9f1e0e3bc77047f0334663a1', 'e9ceb9667261613c4210ad60e073af11');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (582, 'a5fc493f55ab7e861d5d4e0ef0e45e56', 'ebafb8f076638884915c81c180578c95');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (585, 'c1e8598e57173a8b7b5d3ede1f74f007', 'd5badc1e5103bf236fb5bdf553e80e08');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (586, 'bd50ffa29f4158b472691e0fc0bca066', 'a923291a76bd664aa4947da38821277d');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (587, '1093d4966291e374975cc359062564e9', 'b7e200a8f87d352b5f704e585f587410');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (588, '3c501e606da65d217531733e5c743355', '631664d71d265c19a5a9638381f122c6');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (589, '7b51efe6f78ab924f56bad6a956bea75', '9260ac7994152323b0626976b4c4aae5');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (590, '59ac986557412ae72f2c22dc851c868e', 'a955fd4097cb9d2849132167d8be5b53');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (591, '1b067b71be38aa3656e5fb936105a30a', 'f1e6e32ef408f731bb1833bd998e4f45');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (592, 'f584a489f3000aaa00ea1d9fc25bfaf0', 'd42d6cafc25a5e4c7af14fe1df821587');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (593, 'c2d66b550e16f6e0ff26c8e225352ad4', 'a68576ce3e016c21221741a141c64a81');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (594, '17de36390c58bc579389844ac2542780', 'fd9c1eb03aabea866bcdcd7ca325e72c');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (595, '9d1b3860f328f6a465587684ad7e02b1', 'b4cef8d7010a89db826a69704f196fbe');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (596, 'd643bc72a3999e85f78bcd2a5debc5a2', '58d5a2cf37ff3bd8648fdfc7a4f4aab3');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (597, 'b4232ef8154d8adafffc75684c27e45b', '15ef38f97f800a947ce13edd2b9366ab');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (598, '542ded1a4546e8b2ebe89a0e74f59e7f', '23ea21cb47404e7319daf9cbddf7ee3d');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (599, 'ab58adfdea5c8a07920f49d120b67e28', '6b5a097af83e074f9555f1dd7949feab');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (600, 'ad9d4ce9a73d992b9342da9bb414183f', '19772134fe999ab380a96761bbaab720');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (601, '4a450b46b3aa8bbd08ed1c13c64813df', '7d4fc68dc79bea1d7965836304b454ca');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (602, '0c92eafcced9b4205531cf4c4137e3dd', '8275d548fa5dc566647b39f350b42ec2');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (603, '94cb10792da3864817de9a30808e1f4e', '35595c9fa0f29731279fe83e5feffa5c');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (604, 'dd598d2d4e6ada38efe6d773bc71ba20', '9a7894f3c9749e87823626769c0e1159');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (605, 'e08e1ecf5358474c3c14eb64d4e4a6a8', '73948a6864a76bd734fbd851ed28142c');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (606, '99699aa74d81f960e7ace48a2513ec42', '5d6b0c38022e8d0f1a32f4981eacf8f8');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (607, 'cdeca2ba0f0ba29d19e1688944d6ff92', 'ac2c4a223e870bfc45ec858f7f2c0d10');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (608, '4be3b2c00f1fc5afa6178aa940aa1d7d', '19bb383e6f116a712e21f0bc8febb6e5');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (609, '579639370552fb03f590156cd001a2b5', 'cc718908a57003a933ed47fd1267a9cd');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (610, '81c4884949880682b2b53e4d2719d0aa', 'a7945d166ee8961289a154db1c4228a4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (611, 'a14d22123155e9a88043e2d311c2e987', 'ab2fe1d17942d42466bfae3bc3e8f912');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (612, '38b2e62f6927987637bc29eee485a6a9', '07faa539daf5172777932f323117da09');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (613, '0517cc6e9441e4bde12eb620c626ccbf', '6ef506f92f0a95ee503fc0e1270f9ae9');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (614, 'b2c9da8abdec7a8e5e47a3fd128a3c00', 'c3bfe658df3a08d1c585bcc688d02e0d');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (615, '1bbed90cbdd4d303612ec44ec2c8124f', 'b44a866371a9faf31f726f128a1e811e');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (616, 'f3d556359760235192ddda7eeec06d58', '7abf5af2968d842cd5d87c39a79e0e81');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (617, '01ab6d59434b142bc15a85976aefb882', '95406c73670301c141277d50ffeb29bc');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (618, '990bafe50640336692ee4a776040ea4c', '1037ea1bdfa5789fee51e01e80469aeb');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (619, 'f4abccd40f07271b928c108bf98c2b87', 'b19f1c84a3a3af22a23a3f503c92f1b0');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (620, '43b21b353b174ae1c893d927026ffbfa', '43994c08f4ddcb0694282355722ffdb3');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (621, '699fa7a3dc27763db5a4c532271f94a9', '29f8a64f50ca6406404bcf394ab14326');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (622, '9bd3bf8abe9d754ef04c6b328ba3a78e', 'a87765e33c33b17441eb376b3800bd97');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (623, '592c70a856e399809ca05da3844f7828', '5166fee693935aff44b6789abc5318ba');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (624, 'b582b91756e5764eb2e43ffbb82da09e', '3b18ea45528f3ec91eec8471f9d07946');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (625, 'e59fd0318f7366ac1071d14e30167845', '1a2048d0ac9ebc20458b92a0c359b044');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (626, 'e504f9b79b3c08bce378bd26bfb4f68b', 'fcc195a9f1943f054d5b785a1b9053f4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (629, '6cc7c562e96ba5aa82fa2182910e80e3', '6a6a4bec8d87483271a53bae00ad0db4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (630, '850991459b16d61c3d8ae3b210feb2d7', 'd30b7b20cb9c37000704ac1a400089be');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (631, 'e2d4dcc35eeba5fac9a8f3e7cd0b9128', '047d841eb930a4fbe0c5344c59a17e73');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (632, 'e955b20d5b55608b4c6a69bafe6c1dd5', '77c7ea6f7a7878bf8d89122cc94bba76');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (633, '72543a712beab71da4723e68535ef9c9', 'c85ef63276bda6a2778d869de113e7b5');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (634, '29ca428b7404ea79da68db512bc61e93', 'd5b754dc520c4f2a3b9d5729c4186197');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (635, 'fee01bf1bb75dbdeaf25c287b52ed4d6', '8c05828bcc39dd9b30446133ec993b62');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (636, '2587c1b1054984ad0a6f2670029b2991', 'd8a5872649a194b61bb48004c125c655');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (637, '4a7d4249727069d01bb05bdd479e4eab', '092e9ddc17fce40ba6a648890f0fe7c1');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (638, 'f423213d3d4a2ed1910381814f50cd55', '00b491fb12f841f1efef9730abe9b48e');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (639, '6775b65c9a6171c575a5f978bac80490', '7a80360d80381e482f330bf0fd703a68');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (640, '824c4619e9f01e098ba0d52910a87a27', 'e63b15b962ff3a17089477562be5c8bd');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (641, '6fe878405987fa07c51e1a954e35130a', '4ef909d1417725a6caa4c2b64f1b63c8');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (642, 'c81b216f9af2fdcdcf3d6745b81ed375', '748e75ac9ffd416c7cc076709524d9f2');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (643, 'b5aa7571784b1acbba051b14a1fbee6b', 'daa9ffc1e64fac2fba1242f09fdd10d4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (644, 'a237ef168226e2084431390e222d6a66', '05c44ad71dacdb4c6388b6e3232ea6bc');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (645, '658b963d8a6bc344ba214c52d2152818', '32fd48f7652e8645ac79e755774ed28a');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (646, 'cadc8bc64c210aa106c30d6294b80ffc', '77b426cb929443dbc5455f38ebd2c192');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (647, 'a6cb776f7d5febc10450bf2a139b5c5e', 'e3ae99c57d63811540002be06ef00665');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (648, 'b77c0bf5b1581779d3ca46fc0094edee', 'd04dfa915648599538f294653da80196');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (649, 'd11fa9f0a1c0cbab00a4550d5191c7e4', 'd96f48937cb4cd3561e31c8613a4f6a4');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (650, 'e36302a47522c7602938390ac0014bc9', '22d6e1503af8243eb1f922bc26292530');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (651, 'd66550906e66994e27ef7bfa1ebc9fc1', 'a2482f98b7481940e14f9b01bac2bd94');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (652, '89aaf4897815ab37f31371fa32c8a12b', '55d014ad2a71ddeae9fd9a7c00602fad');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (653, 'b8bf3968cf47b83b69175912f320e5f7', 'c34e3787ce62cd11e87d9fbe015efaae');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (654, '43e522bc566abb35e3442ddc2bdd895c', '2b3993c84056896f0fd3aeac439df5c7');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (655, '5a8bbe2f0b6b0c10b30c3dbb90ff85e6', '282ade2b8ec174f926b733d46e84b368');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (656, '2243ffde7ea67fe3c4d5db0abcc5fa30', '474dc27aa85042d2fc9ca044ac1dbc5b');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (657, '2f411a945ea6db8cb48306059a445242', '603e97572f04d91cc30c2a5d7e085cbe');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (658, '25a3a006fcc462d04cc91fd0109d3b79', '694e468ae1fc1c7f968843a5090ff32a');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (659, '1cd5271e0df2bb2bd68ea4e67cfec879', '6a3c3680272becd3870452abfc988037');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (660, '326761c73a17c6fc6394d0cecae6f704', '4b89072ad1052fda7b32ff1dd419d2eb');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (661, '577ed24856f3945616a5325c3fe5e27a', '07517dea4c74f3f64620589a2e7234e1');
INSERT INTO `tbl_canofspam_tracking` (`id`, `client`, `form`) VALUES (664, '28c5da69ad05bf5887ee3795d29ab62e', '8399807e04dddeba14fbd3c9720caed4');

-- *** DATA: `tbl_documentation` ***
INSERT INTO `tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (1, 'Registry URL', '/publish/registry-settings/,/publish/registry-settings/new/,/publish/registry-settings/edit/,/extension/custompreferences/preferences/', 'You only need to fill this field if the root URL of the registry is different Symphony\'s root URL. Do not include the trailing slash.\r\n\r\n(For anyone who isn\'t using the ensemble as standalone and instead as part of a larger website).', 'You only need to fill this field if the root URL of the registry is different Symphony\'s root URL. Do not include the trailing slash.\r\n\r\n(For anyone who isn\'t using the ensemble as standalone and instead as part of a larger website).');
INSERT INTO `tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (2, 'Media queries', '/publish/registry-settings/,/publish/registry-settings/new/,/publish/registry-settings/edit/,/extension/custompreferences/preferences/', 'Currently media queries are set for two sizes: above and below 760px and 960px. Mobile styles are roadmapped for the third release (early 2012).', 'Currently media queries are set for two sizes: above and below 760px and 960px. Mobile styles are roadmapped for the third release (early 2012).');

-- *** DATA: `tbl_entries` ***
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (15, 10, 1, '2011-11-15 14:15:35', '2011-11-15 20:15:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (9, 10, 1, '2011-11-15 14:08:27', '2011-11-15 20:08:27');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (12, 10, 1, '2011-11-15 14:09:24', '2011-11-15 20:09:24');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (11, 10, 1, '2011-11-15 14:08:59', '2011-11-15 20:08:59');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (8, 10, 1, '2011-11-15 14:08:03', '2011-11-15 20:08:03');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (13, 10, 1, '2011-11-15 14:09:34', '2011-11-15 20:09:34');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (14, 10, 1, '2011-11-15 14:15:06', '2011-11-15 20:15:06');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (16, 9, 1, '2011-11-15 21:35:22', '2011-11-16 03:35:22');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (155, 10, 1, '2012-01-26 20:11:12', '2012-01-27 02:11:12');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (53, 11, 1, '2011-11-21 03:57:41', '2011-11-21 09:57:41');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (152, 15, 1, '2012-01-20 19:11:27', '2012-01-21 01:11:27');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (65, 13, 1, '2011-11-22 13:04:12', '2011-11-22 19:04:12');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (64, 13, 1, '2011-11-22 13:04:07', '2011-11-22 19:04:07');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (156, 10, 1, '2012-01-26 20:11:37', '2012-01-27 02:11:37');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (157, 10, 1, '2012-01-26 20:11:53', '2012-01-27 02:11:53');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (158, 10, 1, '2012-01-26 20:12:23', '2012-01-27 02:12:23');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (159, 10, 1, '2012-01-26 20:12:45', '2012-01-27 02:12:45');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (185, 15, 1, '2012-01-29 00:19:13', '2012-01-29 09:19:13');

-- *** DATA: `tbl_etf_conditions` ***

-- *** DATA: `tbl_etf_logs` ***

-- *** DATA: `tbl_etf_templates` ***

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (129, 'debugdevkit', 'enabled', '1.2.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (130, 'export_ensemble', 'enabled', 1.16);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (131, 'selectbox_link_field', 'enabled', 1.22);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (132, 'jit_image_manipulation', 'enabled', 1.14);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (133, 'maintenance_mode', 'enabled', 1.5);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (134, 'profiledevkit', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (135, 'markdown', 'enabled', 1.13);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (136, 'xssfilter', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (137, 'custompreferences', 'enabled', '0.2.2.2');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (138, 'documenter', 'enabled', '1.0RC2');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (140, 'bilinkfield', 'enabled', '1.1.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (141, 'members', 'enabled', '1.1.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (142, 'publish_tabs', 'enabled', '1.0.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (143, 'static_section', 'enabled', '1.6.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (144, 'incrementnumberfield', 'enabled', 1.3);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (145, 'numberfield', 'enabled', 1.5);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (146, 'url_router', 'enabled', 1.3);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (147, 'search_index', 'enabled', '0.9.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (148, 'uniqueuploadfield', 'enabled', 1.5);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (149, 'resizeupload', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (150, 'canofspam', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (151, 'edui', 'enabled', '0.6.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (152, 'image_upload', 'enabled', '1.1.67');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (154, 'oembed_field', 'enabled', '1.3.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (155, 'emailtemplatefilter', 'enabled', '1.1.0');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (157, 'screen_detection', 'enabled', '2012.03.01');

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (186, 129, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (185, 129, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (171, 130, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (193, 133, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (192, 133, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (191, 133, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (190, 133, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (189, 133, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (180, 134, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (181, 134, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (182, 136, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (183, 136, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (184, 136, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (260, 132, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (194, 133, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (195, 133, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (216, 142, '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (258, 138, '/backend/', 'InitaliseAdminPageHead', 'loadAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (257, 138, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (256, 138, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (206, 141, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (207, 141, '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (208, 141, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (209, 141, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (210, 141, '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (211, 141, '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (212, 141, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (213, 141, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (214, 141, '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (215, 141, '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (217, 143, '/backend/', 'InitaliseAdminPageHead', 'redirectRules');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (218, 143, '/blueprints/sections/', 'AddSectionElements', 'addSectionSettings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (219, 143, '/blueprints/sections/', 'SectionPreCreate', 'saveSectionSettings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (220, 143, '/blueprints/sections/', 'SectionPreEdit', 'saveSectionSettings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (221, 143, '/backend/', 'AppendElementBelowView', 'appendElementBelowView');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (222, 137, '/backend/', 'AppendPageAlert', 'dependenciesCheck');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (264, 146, '/system/preferences/', 'Save', 'save');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (263, 146, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'addCustomPreferenceFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (262, 146, '/frontend/', 'FrontendPrePageResolve', 'frontendPrePageResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (227, 147, '/publish/new/', 'EntryPostCreate', 'indexEntry');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (228, 147, '/publish/edit/', 'EntryPostEdit', 'indexEntry');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (229, 147, '/publish/', 'Delete', 'deleteEntryIndex');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (230, 147, '/frontend/', 'EventPostSaveFilter', 'indexEntry');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (231, 147, '/backend/', 'DashboardPanelRender', 'renderPanel');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (232, 147, '/backend/', 'DashboardPanelTypes', 'dashboardPanelTypes');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (233, 149, '/system/preferences/', 'AddCustomPreferenceFieldsets', '__appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (234, 149, '/publish/edit/', 'EntryPostEdit', 'resizeUpload');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (235, 149, '/publish/new/', 'EntryPostCreate', 'resizeUpload');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (236, 150, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (237, 150, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (238, 150, '/blueprints/events/new/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (239, 150, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (240, 150, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'addCustomPreferenceFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (241, 150, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (242, 150, '/frontend/', 'EventPostSaveFilter', 'eventPostSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (243, 150, '/frontend/', 'FrontendParamsResolve', 'frontendParamsResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (244, 151, '/backend/', 'NavigationPreRender', 'deleteComponentsItem');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (245, 151, '/backend/', 'AdminPagePreGenerate', 'setRedirects');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (246, 154, '/backend/', 'InitaliseAdminPageHead', 'appendJS');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (247, 155, '/blueprints/events/edit/', 'AppendEventFilter', 'addFilterToEventEditor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (248, 155, '/blueprints/events/new/', 'AppendEventFilter', 'addFilterToEventEditor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (249, 155, '/frontend/', 'EventFinalSaveFilter', 'eventFinalSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (250, 155, '/frontend/', 'FrontendPageResolved', 'setPage');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (251, 155, '/frontend/', 'FrontendParamsResolve', 'setParams');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (255, 157, '/frontend/', 'FrontendParamsResolve', 'addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (259, 138, '/backend/', 'AppendElementBelowView', 'appendDocs');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (261, 132, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (265, 146, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'Flickr', 'flickr', 'input', 7, 'no', 16, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (35, 'Google Plus', 'google-plus', 'input', 7, 'no', 15, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'Twitter', 'twitter', 'input', 7, 'no', 14, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'Facebook', 'facebook', 'input', 7, 'no', 13, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'Website', 'website', 'input', 7, 'no', 11, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'Phone', 'phone', 'input', 7, 'no', 10, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (55, 'Profile Image', 'profile-image', 'uniqueupload', 7, 'no', 8, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'Biography', 'biography', 'textarea', 7, 'no', 6, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'Name', 'name', 'input', 7, 'no', 5, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'Activation', 'activation', 'memberactivation', 7, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'Role', 'role', 'memberrole', 7, 'yes', 3, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'Password', 'password', 'memberpassword', 7, 'yes', 2, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'Email', 'email', 'memberemail', 7, 'yes', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'Username', 'username', 'memberusername', 7, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'Youtube', 'youtube', 'input', 7, 'no', 17, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'Vimeo', 'vimeo', 'input', 7, 'no', 18, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (92, 'Etsy', 'etsy', 'input', 7, 'no', 12, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'Title', 'title', 'input', 8, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (42, 'Upload Time', 'upload-time', 'date', 8, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (43, 'Views', 'views', 'incrementnumber', 8, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (44, 'Description', 'description', 'textarea', 8, 'no', 5, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (45, 'Artwork Tags', 'artwork-tags', 'taglist', 8, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (91, 'Artist', 'artist', 'selectbox_link', 8, 'yes', 7, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (47, 'Sign up text', 'sign-up-text', 'textarea', 9, 'no', 0, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'open registration', 'open-registration', 'checkbox', 9, 'no', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (93, 'Code of Conduct', 'code-of-conduct', 'textarea', 11, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (50, 'Title', 'title', 'input', 10, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Description', 'description', 'textarea', 10, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (52, 'Counter', 'counter', 'checkbox', 9, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (53, 'Interests', 'interests', 'selectbox_link', 7, 'no', 7, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (58, 'Artwork', 'artwork', 'image_upload', 8, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Registry URL', 'registry-url', 'input', 9, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Publish', 'publish', 'checkbox', 8, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (62, 'Copyright Notice', 'copyright-notice', 'textarea', 11, 'no', 0, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (78, 'Title', 'title', 'input', 15, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (64, 'Privacy Notice', 'privacy-notice', 'textarea', 11, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (69, 'Type', 'type', 'input', 13, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (68, 'External Media', 'external-media', 'oembed', 8, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (70, 'Profile Type', 'profile-type', 'selectbox_link', 7, 'no', 9, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (88, 'Name', 'name', 'input', 17, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (72, 'Date Submitted', 'date-submitted', 'date', 14, 'no', 0, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (73, 'Comment', 'comment', 'textarea', 14, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (74, 'xml', 'xml', 'textarea', 14, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (75, 'URL', 'url', 'input', 14, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (76, 'User', 'user', 'selectbox_link', 14, 'no', 4, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (77, 'Browser', 'browser', 'textarea', 14, 'no', 5, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (79, 'Author', 'author', 'selectbox_link', 15, 'yes', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (80, 'Message', 'message', 'textarea', 15, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (81, 'Published', 'published', 'date', 15, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (82, 'From', 'from', 'input', 16, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (83, 'Email', 'email', 'input', 16, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (84, 'Message', 'message', 'textarea', 16, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (85, 'Artist', 'artist', 'selectbox_link', 16, 'yes', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (86, 'URL', 'url', 'input', 16, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (87, 'Time Sent', 'time-sent', 'date', 16, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (89, 'Email', 'email', 'input', 17, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (90, 'Responded?', 'responded', 'checkbox', 14, 'no', 6, 'sidebar', 'yes');

-- *** DATA: `tbl_members_roles` ***
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (1, 'Public', 'public');
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (2, 'Artist', 'artist');
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (3, 'Administrator', 'administrator');

-- *** DATA: `tbl_members_roles_event_permissions` ***
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (310, 2, 'upload_art', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (309, 2, 'upload_art', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (308, 2, 'sign_ups', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (307, 2, 'sign_ups', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (306, 2, 'send_message', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (328, 1, 'sign_ups', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (327, 1, 'sign_ups', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (326, 1, 'send_message', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (324, 1, 'send_feedback', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (305, 2, 'send_message', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (325, 1, 'send_message', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (323, 1, 'send_feedback', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (304, 2, 'send_feedback', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (303, 2, 'send_feedback', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (237, 3, 'login', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (236, 3, 'edit_artwork', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (235, 3, 'edit_artwork', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (234, 3, 'edit_account', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (233, 3, 'edit_account', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (232, 3, 'cancel_upload', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (231, 3, 'cancel_upload', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (302, 2, 'new_registration', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (301, 2, 'new_registration', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (300, 2, 'new_announcement', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (299, 2, 'new_announcement', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (298, 2, 'login', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (297, 2, 'login', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (296, 2, 'edit_artwork', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (295, 2, 'edit_artwork', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (294, 2, 'edit_account', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (293, 2, 'edit_account', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (292, 2, 'cancel_upload', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (322, 1, 'new_registration', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (321, 1, 'new_registration', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (320, 1, 'new_announcement', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (319, 1, 'new_announcement', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (318, 1, 'login', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (317, 1, 'login', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (316, 1, 'edit_artwork', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (315, 1, 'edit_artwork', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (238, 3, 'login', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (239, 3, 'new_announcement', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (240, 3, 'new_announcement', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (241, 3, 'new_registration', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (242, 3, 'new_registration', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (243, 3, 'send_feedback', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (244, 3, 'send_feedback', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (245, 3, 'send_message', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (246, 3, 'send_message', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (247, 3, 'sign_ups', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (248, 3, 'sign_ups', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (249, 3, 'upload_art', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (250, 3, 'upload_art', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (291, 2, 'cancel_upload', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (314, 1, 'edit_account', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (313, 1, 'edit_account', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (312, 1, 'cancel_upload', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (311, 1, 'cancel_upload', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (329, 1, 'upload_art', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (330, 1, 'upload_art', 'edit', 0);

-- *** DATA: `tbl_members_roles_forbidden_pages` ***
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (37, 1, 99);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (36, 1, 98);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (35, 1, 97);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (34, 1, 94);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (33, 1, 92);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (32, 1, 88);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (31, 1, 86);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (30, 1, 83);

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (83, NULL, 'Registry pages', 'back', NULL, NULL, 'registry_logged_in_artist,registry_settings', 'send_feedback', 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (77, NULL, 'Explore', 'explore', NULL, NULL, 'registry_logged_in_artist,registry_recent_art,registry_settings', 'send_feedback', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (67, NULL, 'RSS', 'rss', NULL, NULL, 'rss_articles', NULL, 12);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (78, NULL, 'Sign in', 'sign-in', NULL, NULL, 'registry_logged_in_artist,registry_settings', 'send_feedback,sign_ups', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (79, NULL, 'Interest', 'interest', NULL, 'interest', 'registry_artist_by_interest,registry_current_interest,registry_interest_list,registry_logged_in_artist,registry_settings', 'members_reset_password,send_feedback', 9);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (80, NULL, 'Tags', 'tag', NULL, 'tag', 'registry_current_tag,registry_logged_in_artist,registry_settings,tag_cloud', 'send_feedback', 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (81, NULL, 'Search', 'search', NULL, NULL, 'registry_logged_in_artist,registry_search_artist_results,registry_search_artwork_results,registry_settings,search', 'send_feedback', 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (82, NULL, 'Account', 'account', NULL, NULL, 'registry_logged_in_artist,registry_settings,registry_unpublished_artwork_list', 'edit_account,send_feedback', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (75, NULL, 'Maintenance', 'maintenance', NULL, NULL, 'registry_logged_in_artist,registry_settings', NULL, 13);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (76, NULL, 'Page Not Found', 'page-not-found', NULL, NULL, 'registry_logged_in_artist,registry_settings', NULL, 14);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (84, 83, 'Artist Profile', 'artist', 'back', 'username', 'registry_current_artist,registry_current_artist_artwork_list,registry_logged_in_artist,registry_settings', 'send_feedback,send_message', 15);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (85, 83, 'Artwork Page', 'artwork', 'back', 'username/artwork', 'registry_current_artist,registry_current_artwork,registry_logged_in_artist,registry_settings', 'send_feedback,send_message', 16);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (86, NULL, 'Upload new', 'new', NULL, NULL, 'registry_edit_new_upload,registry_logged_in_artist,registry_settings', 'cancel_upload,login,send_feedback,upload_art', 11);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (87, NULL, 'All Artists', 'artist', NULL, NULL, 'registry_all_artists,registry_logged_in_artist,registry_settings', 'send_feedback', 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (88, 86, 'Add a description', 'publish', 'new', NULL, 'registry_logged_in_artist,registry_settings', 'send_feedback,upload_art', 18);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (92, 83, 'Edit Artwork', 'edit', 'back', 'username/artwork/edit', 'registry_edit_current_artwork,registry_logged_in_artist,registry_settings', 'cancel_upload,edit_artwork,send_feedback,upload_art', 21);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (94, 82, 'Delete Account', 'delete', 'account', NULL, 'registry_logged_in_artist', 'send_feedback', 22);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (95, 82, 'First Time', 'first-time', 'account', NULL, 'registry_edit_current_artist,registry_interest_list,registry_logged_in_artist,registry_settings', 'edit_account,send_feedback', 23);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (96, NULL, 'Announcements', 'announcements', NULL, NULL, 'registry_announcements,registry_announcements_authors,registry_logged_in_artist,registry_settings', 'login,new_announcement,send_feedback', 16);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (97, 82, 'Messages', 'messages', 'account', 'message-id', 'registry_logged_in_artist,registry_logged_in_artist_messages,registry_settings', 'login,send_feedback', 24);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (98, 82, 'Edit your account', 'edit', 'account', NULL, 'registry_edit_current_artist,registry_interest_list,registry_logged_in_artist,registry_settings', 'edit_account,login,send_feedback', 25);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (99, 82, 'Change your profile picture', 'photo', 'account', NULL, 'registry_edit_current_artist,registry_logged_in_artist,registry_settings', 'edit_account,login,send_feedback', 26);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (100, NULL, 'Privacy', 'privacy', NULL, NULL, 'registry_legalese,registry_logged_in_artist,registry_settings', 'login', 27);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (101, NULL, 'Copyright', 'copyright', NULL, NULL, 'registry_legalese,registry_logged_in_artist,registry_settings', 'login,send_feedback', 28);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (102, NULL, 'Conduct', 'conduct', NULL, NULL, 'registry_legalese,registry_logged_in_artist,registry_settings', 'login,send_feedback', 29);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (697, 76, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (701, 77, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (686, 75, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (702, 83, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (463, 67, 'XML');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (462, 67, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (687, 75, 'maintenance');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (696, 76, 404);

-- *** DATA: `tbl_search_index` ***
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (13, 27, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (10, 24, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (12, 26, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (8, 22, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (32, 43, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (33, 44, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (34, 45, 8, 'Artists thebestsophist');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (60, 59, 8, 'Artists thebestsophist  retest retests again test  description of descriptions \n woot');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (61, 60, 8, 'Artists thebestsophist  \n Untitled');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (62, 61, 8, 'Artists thebestsophist  \n Untitled');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (64, 62, 8, 'Artists thebestsophist  test restest  it\'s a bernard \n 038_lzn.jpg');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (536, 199, 8, 'to_fairy_glen.jpg');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (370, 151, 8, 'Artists gail  dance movement self development  The feet are the foundation of this practice. Feet are the conduit between body and soul, earth and heaven, self and other. \n Sole Peace');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (296, 138, 8, 'Artists Bernard  stuffs \n to_fairy_glen.jpg');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (314, 140, 8, 'Artists Bernard  \n to_fairy_glen.jpg');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (315, 141, 8, 'Artists Bernard  \n Untitled');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (327, 143, 8, 'Artists gail  movement self awareness self development soul  The beauty of this movement practice is that there is no right or wrong way to \"do\" it. The dance is not about what you look like. You move in response rhythm, a map of rhythms: flowing, staccato, chaos, lyrical, stillness. The rhythms wake up what is possible in you.  \n imageless');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (333, 145, 8, 'Artists Bernard  \n to_fairy_glen.jpg');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (334, 146, 8, 'Artists gail  dance movement self development  The beauty of this movement practice is that there is no right or wrong way to \"do\" it. The dance is not about what you look like. You move in response rhythm, a map of rhythms: flowing, staccato, chaos, lyrical, stillness. The rhythms wake up what is possible in you.  \n imageless');
INSERT INTO `tbl_search_index` (`id`, `entry_id`, `section_id`, `data`) VALUES (338, 147, 8, 'Artists Bernard  \n to_fairy_glen.jpg');

-- *** DATA: `tbl_search_index_entry_keywords` ***
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (24, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (27, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (27, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (26, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (26, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (24, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (44, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (22, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (22, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (44, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (43, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (43, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (45, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (45, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 41, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 42, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 43, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 44, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 45, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 46, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (59, 47, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (60, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (60, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (60, 40, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (61, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (61, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (61, 40, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 6, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 37, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 44, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 48, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (62, 49, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (199, 555, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 305, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 311, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 190, 4);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (138, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (138, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (138, 475, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (138, 555, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 634, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 633, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 632, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (140, 555, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (140, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (140, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (141, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (141, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (141, 40, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 631, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 630, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 629, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 628, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 627, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 626, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 625, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 624, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 623, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 622, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 621, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 620, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 619, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 618, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 617, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 616, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 615, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 614, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 613, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 612, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 559, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 558, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 557, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 556, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 545, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 423, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 383, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 378, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 366, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 305, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 311, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 190, 4);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (143, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (145, 555, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (145, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (145, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 311, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 190, 4);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 305, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 366, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 378, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 383, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 423, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 545, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 556, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 558, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 617, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 618, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 619, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 620, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 621, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 622, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 623, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 630, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 629, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 628, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 627, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 626, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 625, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 624, 3);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 616, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 615, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 614, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 613, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 612, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 631, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 632, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 633, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (146, 634, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (147, 555, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (147, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (147, 5, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 12, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 613, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 570, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 569, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 568, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 567, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 566, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 565, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 564, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 563, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 562, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 560, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 559, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 558, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 556, 2);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 402, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 383, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 378, 1);
INSERT INTO `tbl_search_index_entry_keywords` (`entry_id`, `keyword_id`, `frequency`) VALUES (151, 326, 3);

-- *** DATA: `tbl_search_index_keywords` ***
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (475, 'stuffs');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (5, 'bernard');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (6, 'thebestsophist');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (12, 'artists');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (37, 'it\'s');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (40, 'untitled');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (41, 'retest');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (42, 'retests');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (43, 'again');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (44, 'test');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (45, 'description');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (46, 'descriptions');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (47, 'woot');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (48, 'restest');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (49, '038_lzn.jpg');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (190, 'the');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (311, 'movement');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (305, 'gail');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (326, 'and');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (366, 'that');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (378, 'practice');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (383, 'dance');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (402, 'other');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (423, 'about');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (545, 'not');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (555, 'to_fairy_glen.jpg');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (556, 'self');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (557, 'awareness');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (558, 'development');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (559, 'soul');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (560, 'foundation');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (562, 'feet');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (563, 'earth');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (564, 'are');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (565, 'conduit');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (566, 'between');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (567, 'heaven');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (568, 'body');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (569, 'sole');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (570, 'peace');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (617, 'way');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (618, 'what');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (619, 'you');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (620, 'look');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (621, 'like');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (622, 'move');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (623, 'response');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (630, 'lyrical');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (629, 'chaos');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (628, 'staccato');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (627, 'flowing');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (626, 'rhythms');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (625, 'map');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (624, 'rhythm');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (616, 'wrong');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (615, 'right');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (614, 'there');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (613, 'this');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (612, 'beauty');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (631, 'stillness');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (632, 'wake');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (633, 'possible');
INSERT INTO `tbl_search_index_keywords` (`id`, `keyword`) VALUES (634, 'imageless');

-- *** DATA: `tbl_search_index_logs` ***
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (1, '2012-01-26 20:26:16', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (2, '2012-01-26 20:27:54', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (3, '2012-01-26 20:28:04', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (4, '2012-01-26 20:28:30', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (5, '2012-01-26 20:33:43', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (6, '2012-01-26 20:34:46', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (7, '2012-01-26 20:34:47', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (8, '2012-01-26 20:38:36', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (9, '2012-01-27 15:15:44', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (10, '2012-01-27 15:16:04', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (11, '2012-01-27 15:19:09', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (12, '2012-01-27 15:19:30', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (13, '2012-01-27 15:20:40', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (14, '2012-01-27 15:21:32', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (15, '2012-01-27 15:22:10', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (16, '2012-01-27 15:24:37', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (17, '2012-01-27 15:27:04', 'test', 'test', 'artists,artwork', 1, 0, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (18, '2012-01-27 15:27:22', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (19, '2012-01-27 15:27:56', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (20, '2012-01-27 15:28:37', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (21, '2012-01-27 15:29:03', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (22, '2012-01-27 15:36:15', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (23, '2012-01-27 15:37:05', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (24, '2012-01-27 15:37:41', 'bernard', 'bernard', 'artists,artwork', 1, 1, 'b0a5ed5544a4d4315ab830a215f99756');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (25, '2012-01-30 16:54:53', 'scott', 'scott', 'artists,artwork', 1, 0, 'qvcs0eeshqj2ib02logtc2djv6');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (26, '2012-01-30 16:55:10', 'wooden diamonds', 'wooden diamonds', 'artists,artwork', 1, 1, 'qvcs0eeshqj2ib02logtc2djv6');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (27, '2012-01-30 16:57:02', 'wooden diamonds', 'wooden diamonds', 'artists,artwork', 1, 1, 'qvcs0eeshqj2ib02logtc2djv6');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (28, '2012-01-30 16:57:53', 'wooden diamonds', 'wooden diamonds', 'artists,artwork', 1, 1, 'qvcs0eeshqj2ib02logtc2djv6');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (29, '2012-02-01 14:54:40', NULL, NULL, 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (30, '2012-02-01 16:28:33', 'Arctic Floral Designs', 'arctic floral designs', 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (31, '2012-02-01 16:30:35', NULL, NULL, 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (32, '2012-02-02 15:44:56', 'announcements', 'announcements', 'artists,artwork', 1, 0, 'm547158vcnii23c5hqoaj3heo7');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (33, '2012-02-02 19:16:40', 'alaskachristina@gmail.com', 'alaskachristina@gmail.com', 'artists,artwork', 1, 0, 'fe06t5k2k3o29vu1kafe3h2875');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (34, '2012-02-03 07:19:25', NULL, NULL, 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (35, '2012-02-03 07:20:37', 'pressed flower plates', 'pressed flower plates', 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (36, '2012-02-03 07:21:13', 'Lauri Farmer', 'lauri farmer', 'artists,artwork', 1, 0, 'kip0q4rsamprn0li638hbe6ft3');
INSERT INTO `tbl_search_index_logs` (`id`, `date`, `keywords`, `keywords_manipulated`, `sections`, `page`, `results`, `session_id`) VALUES (37, '2012-02-05 10:58:42', 'wooden diamonds', 'wooden diamonds', 'artists,artwork', 1, 1, 'qvcs0eeshqj2ib02logtc2djv6');

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (7, 'Artists', 'artists', 2, NULL, 'asc', 'no', 'no', 'Registry');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (8, 'Artwork', 'artwork', 1, NULL, 'asc', 'no', 'no', 'Registry');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (9, 'Registry Settings', 'registry-settings', 4, NULL, 'asc', 'yes', 'yes', 'Settings');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (10, 'Interests', 'interests', 3, 50, 'asc', 'no', 'no', 'Registry');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (11, 'Legalese', 'legalese', 5, NULL, 'asc', 'yes', 'yes', 'Settings');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (13, 'Profile Types', 'profile-types', 6, NULL, 'asc', 'no', 'no', 'Settings');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (14, 'Feedback', 'feedback', 7, NULL, 'asc', 'no', 'no', 'Settings');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (15, 'Announcements', 'announcements', 8, NULL, 'asc', 'no', 'no', 'Registry');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (16, 'Artist Messages', 'artist-messages', 9, NULL, 'asc', 'no', 'no', 'Registry');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (17, 'Sign ups', 'sign-ups', 10, NULL, 'asc', 'no', 'no', 'Registry');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (39, 13, 69, 7, 70, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (38, 10, 50, 7, 53, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (34, 7, 23, 14, 76, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (33, 7, 23, 15, 79, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (29, 7, 23, 16, 85, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (40, 7, 23, 8, 91, 'no');

-- *** DATA: `tbl_url_router` ***
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (150, '/\\/artist\\/([A-Za-z-0-9-]+?\\/[0-9-]+?)\\/edit/i', '/back/edit/$1', 'route', 'no');
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (151, '/\\/artist\\/([A-Za-z-0-9-]+?\\/[0-9-]+?)/i', '/back/artwork/$1', 'route', 'no');
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (152, '/\\/artist\\/([A-Za-z-0-9-]+?)/i', '/back/artist/$1', 'route', 'no');
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (153, '/\\/tags/i', '/tag/$1', 'route', 'no');
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (154, '/\\/interests/i', '/interests/$1', 'route', 'no');
INSERT INTO `tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (155, '/\\/artists/i', '/artist/$1', 'route', 'no');
