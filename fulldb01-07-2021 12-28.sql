#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'quos', '2012-04-23 15:26:53', '2002-11-03 09:46:49');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'itaque', '2019-01-11 22:41:43', '2002-04-19 23:25:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'aut', '1976-08-02 16:38:36', '1976-12-18 07:11:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'illo', '2016-07-11 09:36:44', '1997-09-21 19:06:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'nulla', '2017-11-30 08:24:55', '2017-02-20 00:35:50');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'saepe', '1970-02-23 23:12:14', '1990-08-28 10:32:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'commodi', '1993-10-26 21:53:36', '1993-01-13 06:35:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'deleniti', '2002-12-01 01:44:04', '1983-06-22 09:23:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'ratione', '2012-11-01 03:31:36', '1973-04-09 08:55:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'vel', '1970-08-27 20:00:12', '1975-08-24 12:19:17');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'suscipit', '1989-05-24 09:49:15', '2011-04-18 13:52:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'vero', '2002-07-22 07:01:18', '2001-07-26 19:57:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'optio', '2015-02-18 12:58:12', '2010-05-24 21:04:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'odit', '2018-10-29 21:02:50', '1990-12-09 20:44:12');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'qui', '1994-07-31 06:12:23', '1988-07-07 09:49:04');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'veniam', '2002-02-21 11:44:33', '1997-06-28 08:50:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'sint', '1992-08-06 16:22:37', '2001-03-25 06:14:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'ab', '1985-02-25 03:01:45', '1999-12-30 13:35:59');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'dolores', '1976-07-26 13:44:36', '1971-02-07 21:18:44');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'dolor', '1990-05-06 02:44:45', '1998-01-21 18:51:59');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_communities_user_id` (`user_id`),
  CONSTRAINT `fk_communities_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 1, '1972-10-11 10:41:47', '1971-02-08 20:17:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 21, '1998-10-12 20:55:19', '1982-10-01 00:46:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 41, '2000-01-30 05:39:01', '1997-06-17 22:46:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 61, '1978-06-06 10:58:19', '1995-08-27 09:46:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 81, '1994-08-15 09:09:57', '1992-05-04 06:21:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 2, '1982-10-02 14:22:20', '1987-08-10 14:35:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 22, '1970-12-20 00:27:10', '1988-06-29 00:59:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 42, '1999-09-03 03:55:52', '1986-06-10 11:20:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 62, '1977-03-31 05:41:07', '2002-04-06 07:13:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 82, '2001-02-18 02:51:49', '1982-06-09 22:56:24');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (3, 3, '1997-09-05 16:13:51', '2010-07-03 07:26:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (3, 23, '1984-09-10 02:20:31', '1996-08-14 09:45:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (3, 43, '1983-04-12 09:17:59', '1976-02-14 11:52:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (3, 63, '1970-08-17 00:47:53', '2014-11-22 18:01:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (3, 83, '1982-02-22 11:50:00', '2011-10-08 21:00:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (4, 4, '2004-10-24 08:58:33', '1975-01-27 12:12:42');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (4, 24, '1974-10-30 09:48:13', '2008-05-05 23:22:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (4, 44, '1994-11-15 04:40:01', '1979-03-11 20:02:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (4, 64, '2021-02-21 15:12:23', '1999-04-17 08:41:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (4, 84, '2012-07-08 12:47:46', '1971-06-01 18:02:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (5, 5, '2020-10-10 03:54:52', '2013-07-18 21:16:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (5, 25, '1999-08-02 13:48:22', '1986-07-13 10:16:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (5, 45, '1983-11-22 15:11:30', '2018-11-05 18:06:12');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (5, 65, '1997-05-21 19:28:12', '1989-07-22 03:34:10');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (5, 85, '1976-05-23 06:15:08', '1983-06-28 13:49:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (6, 6, '2007-05-08 20:29:41', '1985-02-02 04:06:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (6, 26, '2014-04-25 19:03:09', '2018-06-13 04:55:51');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (6, 46, '1985-08-27 11:46:24', '2011-12-14 14:04:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (6, 66, '1975-02-12 00:28:23', '1979-05-09 08:50:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (6, 86, '1992-08-21 15:24:21', '1987-11-20 11:15:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (7, 7, '1986-04-24 13:08:53', '1983-10-16 08:01:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (7, 27, '2011-03-07 20:43:19', '1995-03-05 06:02:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (7, 47, '2008-01-16 17:11:57', '2003-08-20 13:09:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (7, 67, '2000-12-12 21:03:50', '1998-11-18 20:53:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (7, 87, '2015-07-29 15:58:21', '1996-04-12 10:03:13');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (8, 8, '1993-02-06 03:12:12', '1998-12-14 09:02:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (8, 28, '2004-07-15 23:14:42', '1984-09-09 14:42:42');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (8, 48, '2018-02-16 03:11:22', '1974-06-28 20:35:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (8, 68, '1979-08-20 00:24:38', '1979-01-07 21:22:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (8, 88, '1978-01-28 00:53:41', '1990-09-19 07:03:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (9, 9, '1984-07-27 23:42:43', '2007-09-22 07:25:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (9, 29, '1986-08-19 10:41:05', '2010-04-10 10:32:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (9, 49, '2010-06-01 19:51:19', '1973-07-13 07:07:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (9, 69, '2001-04-23 12:17:45', '2018-01-04 12:12:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (9, 89, '2000-01-04 03:00:22', '2015-05-10 15:33:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (10, 10, '1980-03-12 04:36:26', '1990-12-09 18:34:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (10, 30, '1989-03-11 20:56:34', '1989-08-18 06:10:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (10, 50, '2015-04-11 02:14:32', '2004-06-01 18:08:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (10, 70, '1982-10-26 01:59:07', '2002-03-15 19:55:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (10, 90, '1970-10-02 11:15:23', '2016-07-18 12:49:55');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (11, 11, '1983-08-24 22:58:45', '1974-11-02 14:01:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (11, 31, '1991-11-26 04:15:15', '2002-03-06 00:25:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (11, 51, '1990-07-31 05:22:46', '1996-10-16 22:37:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (11, 71, '1999-08-01 03:03:02', '1979-12-24 10:23:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (11, 91, '1973-09-24 05:13:18', '1999-01-28 09:02:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (12, 12, '2011-07-09 11:17:48', '1994-02-03 19:32:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (12, 32, '1972-11-25 17:36:34', '2016-08-07 00:38:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (12, 52, '1993-06-11 13:17:40', '1982-12-28 21:28:12');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (12, 72, '1984-04-29 16:35:19', '1992-04-29 21:11:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (12, 92, '2000-12-21 08:49:01', '1985-01-10 23:02:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (13, 13, '1977-01-18 00:34:50', '1982-04-30 13:24:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (13, 33, '1996-04-27 05:13:21', '1986-10-26 14:27:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (13, 53, '1994-05-31 18:47:39', '2008-09-05 06:22:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (13, 73, '2005-05-11 20:27:24', '1996-03-08 02:17:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (13, 93, '1981-09-28 15:17:01', '1970-05-07 08:42:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (14, 14, '2020-10-25 09:46:10', '2005-09-04 05:38:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (14, 34, '2011-05-24 13:04:28', '2012-08-07 15:37:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (14, 54, '1983-02-16 12:01:17', '1986-10-10 05:43:37');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (14, 74, '1986-05-19 04:31:19', '2015-02-25 17:40:42');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (14, 94, '1984-08-15 21:22:45', '2010-04-03 12:49:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (15, 15, '1974-05-13 00:52:49', '1989-02-28 03:00:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (15, 35, '1977-01-06 17:40:30', '1980-04-15 11:04:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (15, 55, '2015-10-08 14:03:26', '1986-07-27 08:51:31');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (15, 75, '1971-12-03 06:16:46', '1990-07-18 09:38:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (15, 95, '2009-12-19 03:00:20', '1997-08-19 17:30:05');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (16, 16, '1990-11-04 07:03:04', '2006-10-29 20:14:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (16, 36, '2006-05-13 12:58:33', '1981-03-01 08:13:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (16, 56, '1991-06-07 00:51:04', '1973-08-28 20:46:51');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (16, 76, '1971-05-25 21:32:52', '2000-04-12 22:19:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (16, 96, '1987-02-15 15:01:24', '1970-03-16 03:00:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (17, 17, '1990-03-16 03:29:39', '2019-11-08 22:37:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (17, 37, '1993-10-26 15:48:53', '2002-10-31 04:44:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (17, 57, '1990-10-22 10:56:28', '2003-02-09 16:23:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (17, 77, '1978-01-24 20:15:13', '2001-12-28 15:30:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (17, 97, '1970-01-20 18:28:34', '2000-03-13 19:01:23');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (18, 18, '1981-11-23 05:41:50', '2005-10-01 21:53:09');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (18, 38, '2011-05-29 07:00:15', '2007-06-02 10:31:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (18, 58, '1983-06-26 00:20:05', '2007-07-16 07:54:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (18, 78, '1988-07-31 16:53:39', '1981-01-25 08:32:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (18, 98, '1992-04-18 18:06:53', '1971-08-05 07:51:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (19, 19, '2011-07-18 06:58:47', '1979-10-19 06:45:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (19, 39, '1973-10-16 15:24:33', '2008-07-29 23:02:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (19, 59, '2009-07-13 15:28:09', '2017-09-01 08:17:37');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (19, 79, '1988-07-27 14:13:30', '2000-11-01 06:42:14');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (19, 99, '1997-11-17 12:17:55', '2018-06-26 20:39:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (20, 20, '1989-09-03 23:34:00', '2012-10-15 15:59:48');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (20, 40, '2015-08-13 00:16:43', '1988-04-15 15:35:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (20, 60, '2014-04-30 22:19:09', '1981-06-06 20:05:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (20, 80, '1993-05-05 02:11:28', '2020-07-04 14:11:28');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`, `updated_at`) VALUES (20, 100, '2012-01-15 23:39:49', '1989-02-06 10:38:06');


#
# TABLE STRUCTURE FOR: entity_types
#

DROP TABLE IF EXISTS `entity_types`;

CREATE TABLE `entity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `entity_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя сущности',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_name` (`entity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Справочная таблица с перечнем сущностей, которым можно поставить лайк';

INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (14, 'accusantium');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (21, 'alias');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (13, 'amet');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (10, 'asperiores');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (24, 'aspernatur');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (20, 'aut');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (1, 'debitis');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (7, 'dicta');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (22, 'dolor');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (28, 'dolorem');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (27, 'earum');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (12, 'et');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (11, 'ipsum');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (6, 'itaque');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (26, 'laboriosam');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (16, 'laudantium');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (2, 'magni');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (5, 'natus');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (18, 'nihil');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (30, 'nulla');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (8, 'omnis');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (9, 'possimus');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (23, 'quasi');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (17, 'qui');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (29, 'quia');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (19, 'quis');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (3, 'ratione');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (15, 'sint');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (25, 'sit');
INSERT INTO `entity_types` (`id`, `entity_name`) VALUES (4, 'ut');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип отношений',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `fk_friend_id` (`friend_id`),
  CONSTRAINT `fk_friend_id` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friendship_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (1, 1, 'Deleniti itaque ut sed earum vel neque. Nesciunt quas earum voluptatibus sit ducimus quo. Aut reicie', '1996-04-07 05:34:27', '2020-07-28 15:05:30', '2004-09-24 01:42:59', '1977-10-10 16:45:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (2, 2, 'Qui quia inventore quaerat neque officiis accusantium dolorum ab. Consequatur praesentium a unde mol', '1971-04-26 23:17:45', '1986-05-18 18:24:00', '1998-08-03 06:17:34', '1979-02-09 08:54:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (3, 3, 'Nulla maiores aliquam et asperiores officiis enim dolore. Eligendi aut nesciunt corporis quo aut mai', '2010-02-27 10:21:39', '1970-06-22 10:23:11', '2016-01-02 09:28:32', '1996-02-10 07:33:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (4, 4, 'Dicta et esse facere odio repudiandae eos illo. Tenetur excepturi laudantium dolor dignissimos expli', '1970-12-05 11:19:30', '1973-09-16 17:38:33', '2007-01-11 06:07:46', '1971-09-20 15:17:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (5, 5, 'Amet officiis ut autem delectus fugit neque ipsam. Sit amet voluptatibus quia aut voluptas quam. Est', '1996-11-09 06:28:44', '1992-05-04 10:48:32', '1977-01-08 03:44:30', '1990-11-26 18:04:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (6, 6, 'Omnis distinctio error quia deserunt nulla. Fugiat ea placeat excepturi veritatis. Voluptatem sequi ', '2005-10-17 12:51:26', '2014-06-05 16:39:11', '2002-03-28 07:01:05', '2019-12-14 07:06:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (7, 7, 'Error velit aut ea explicabo officia aut nulla omnis. Delectus tempore ex beatae. Qui fugit quia fug', '1976-01-14 06:20:48', '1988-04-25 10:18:17', '1972-03-19 01:02:24', '1981-01-07 12:40:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (8, 8, 'Fugit rerum in est illum. Ipsa aut omnis tempore repellat nesciunt.', '1993-03-10 04:56:28', '2000-06-19 11:25:33', '1985-09-02 13:55:02', '2005-11-18 03:34:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (9, 9, 'Ab tempore ipsam aut dicta maiores ad. Porro sed voluptas sunt. Velit optio sed sapiente. Beatae rei', '2005-06-11 17:07:26', '1971-04-01 18:57:08', '1986-05-29 09:43:54', '1981-02-08 04:28:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (10, 10, 'Reiciendis itaque optio qui rem et dolorem. Nihil non quidem pariatur itaque ipsum. Est reiciendis q', '2016-05-18 15:58:44', '1971-01-20 19:35:34', '1986-08-12 05:43:39', '2003-02-20 05:06:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (11, 11, 'Quas ipsum corrupti possimus laudantium non quia id. Eos voluptatem voluptatem quas maxime. Sed offi', '2001-02-24 18:00:32', '1993-07-31 12:53:20', '2002-06-18 15:09:44', '1986-01-02 04:31:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (12, 12, 'Est nesciunt mollitia error ea aliquid. Aliquid in quam maxime sint. Exercitationem qui neque volupt', '2016-07-05 14:39:32', '1978-02-14 15:55:09', '2014-04-20 17:26:44', '2001-01-18 17:25:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (13, 13, 'Quis in ut dicta accusantium dignissimos error autem. Et minus quis mollitia suscipit fugit placeat.', '2009-06-08 18:06:02', '1982-08-08 09:26:16', '1994-07-26 18:56:58', '2003-09-30 04:27:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (14, 14, 'Ut atque neque enim eveniet ut nostrum. Consequatur ut deleniti quis non. Ut quis cupiditate sit eni', '2012-09-11 00:05:13', '1983-05-29 20:13:41', '1988-11-07 21:01:57', '2006-02-19 19:34:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (15, 15, 'Aperiam tempore eius quo harum harum id. Dolorem reiciendis eius sunt itaque. Ratione dolorum illo a', '2004-05-25 01:54:54', '1991-09-25 23:05:09', '1984-12-29 19:27:46', '2005-02-15 10:11:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (16, 16, 'Praesentium veniam ratione corporis consequuntur excepturi et ea amet. Aut vel ratione enim quo quia', '1977-05-03 07:19:13', '2002-12-14 13:40:54', '1979-07-19 14:41:17', '1992-09-19 17:30:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (17, 17, 'Necessitatibus possimus alias dicta. Est accusantium consequatur error. Libero explicabo ut non corr', '2001-11-07 02:45:53', '1986-02-11 18:20:20', '1971-01-02 12:15:03', '2009-11-14 02:26:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (18, 18, 'Quo voluptatem aut facilis qui quia unde. Ea veritatis error hic accusamus. Unde beatae dolorem ut d', '1995-10-13 15:20:06', '1976-09-08 08:16:57', '1980-09-30 06:07:34', '2005-09-16 05:11:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (19, 19, 'Quam corrupti numquam rerum odit. Cumque sequi quisquam aspernatur voluptates. Consequatur eaque aut', '1992-01-07 02:08:54', '2016-09-15 18:26:38', '2003-05-25 14:19:42', '1974-03-19 05:58:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (20, 20, 'Consequuntur at ullam adipisci molestiae ut repellat. Laborum nulla sed unde ut nam. Inventore possi', '1970-08-24 08:35:09', '2008-02-17 08:19:22', '2013-12-30 16:20:07', '1994-01-29 16:47:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (21, 21, 'Necessitatibus non ut in qui molestiae. Repellendus dolorum id assumenda et. Dicta ut consequatur ac', '2009-07-25 04:48:47', '1995-10-31 15:00:24', '1978-01-01 13:53:44', '1971-12-31 23:46:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (22, 22, 'Voluptas impedit dignissimos molestiae voluptate similique repellendus nulla. Aut tenetur est expedi', '2002-11-13 12:31:19', '1998-08-29 14:32:45', '2011-06-24 10:28:39', '2018-06-30 17:51:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (23, 23, 'Fugit blanditiis saepe rerum minus voluptatem ex. Voluptatem et laudantium deleniti magni. Explicabo', '1972-11-04 11:30:21', '1991-03-19 09:27:16', '1988-04-24 13:23:37', '1982-05-30 18:41:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (24, 24, 'Omnis dignissimos alias et doloribus. Molestias quae perspiciatis atque corrupti laudantium quae rer', '2016-02-25 05:57:31', '1990-02-24 17:41:14', '2003-11-13 07:22:01', '1989-10-01 17:21:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (25, 25, 'Iure qui aliquam vel modi nam. Libero et tempora reprehenderit consequuntur recusandae qui accusanti', '2014-01-05 15:11:59', '2012-03-22 06:38:20', '1974-07-28 08:27:32', '2018-09-22 23:30:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (26, 26, 'Ut voluptatem deleniti nesciunt a. Iste cumque necessitatibus ex illo voluptatem. Modi perspiciatis ', '1987-06-25 00:55:34', '1986-12-25 02:23:52', '2011-12-31 05:18:11', '1972-02-11 05:33:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (27, 27, 'Doloremque voluptates et distinctio. Delectus dolorum in consectetur. Sit et dolorem quam repellat c', '2021-04-05 18:42:08', '1991-12-27 05:45:45', '1970-12-03 17:13:41', '1976-09-14 09:07:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (28, 28, 'Rem soluta veniam sed quia impedit quia. Reprehenderit amet aut expedita. Minima ad quibusdam iste c', '2007-03-09 21:22:04', '2021-05-08 20:51:38', '2002-04-30 08:57:31', '1974-06-29 16:17:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (29, 29, 'Officiis eius distinctio magnam praesentium doloremque saepe aliquid. Error nostrum dolorem blanditi', '1996-05-07 09:05:36', '2020-04-23 17:38:39', '2021-03-24 04:19:18', '1988-10-25 03:25:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (30, 30, 'Magnam voluptatem ea ratione voluptatem vero aperiam est. Placeat nostrum dolores eum illo minima ni', '2007-03-23 19:22:59', '2013-12-03 02:53:53', '1982-04-25 09:59:34', '1981-12-14 20:04:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (31, 31, 'Harum est quas quis ut. Aperiam iste aliquid fugiat quae porro reiciendis voluptates. Velit est est ', '2001-03-04 03:04:54', '2001-08-07 17:27:44', '1979-12-12 13:48:13', '1987-05-31 23:01:08');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (32, 32, 'Totam sunt deleniti illo omnis voluptatem. Quibusdam animi vitae deleniti porro. Consequatur sunt no', '2010-05-26 15:39:08', '2000-08-22 21:28:32', '1982-02-07 09:05:28', '2014-08-25 16:02:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (33, 33, 'Voluptatem qui ut est nam natus asperiores. Eos cum sint vel quisquam maiores occaecati id.', '1982-07-31 05:30:02', '2018-08-25 08:14:42', '2020-08-13 00:10:00', '1974-01-19 08:34:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (34, 34, 'Autem nemo debitis sit illo pariatur perspiciatis doloribus. Velit doloremque pariatur eos unde quis', '1977-02-22 09:01:12', '2011-05-07 22:10:07', '2000-04-18 05:22:25', '2005-03-24 06:10:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (35, 35, 'Dolorum quae ea est explicabo. Velit minima minus quasi libero asperiores consequatur. Asperiores si', '2006-07-25 16:39:43', '1981-11-20 08:02:42', '1971-04-19 22:19:20', '1981-11-25 20:00:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (36, 36, 'Sit laudantium aperiam pariatur saepe sit at. Tenetur autem facere inventore dignissimos voluptates.', '1978-07-14 00:10:54', '2004-08-27 06:07:15', '2011-06-10 19:40:51', '2000-06-05 00:16:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (37, 37, 'Expedita quo tempora omnis aut. Ratione officiis in enim adipisci qui. Expedita voluptas necessitati', '1976-12-23 05:48:28', '2012-06-03 11:19:56', '1998-02-28 09:29:09', '1972-11-25 07:38:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (38, 38, 'Tenetur nihil aspernatur aliquid non facilis. Et nobis consequatur cumque dicta. Dolor voluptatem co', '1992-03-09 14:12:50', '1976-12-15 02:15:14', '1997-09-02 18:26:16', '1995-08-25 06:19:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (39, 39, 'Quo sunt earum repellat tenetur. Ut incidunt quasi vel eos. Asperiores voluptas voluptatum provident', '1971-02-26 00:14:51', '1980-10-30 20:19:48', '2020-07-05 09:50:23', '1975-01-23 14:42:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (40, 40, 'In earum reprehenderit in. Aliquam et enim voluptatem modi dolores deserunt. Adipisci dolorum fugiat', '1985-02-11 21:43:10', '2012-03-12 04:29:27', '1992-03-10 23:19:23', '2004-06-22 21:08:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (41, 41, 'Illo autem vel consequatur labore eius fuga aut. Velit qui quisquam et magni culpa. Reiciendis animi', '1996-06-18 17:58:58', '2009-05-01 12:18:57', '2005-07-07 20:16:55', '2007-03-13 08:51:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (42, 42, 'Itaque sit dolorem et quo sed velit officia. Necessitatibus et at deleniti ea. Ea officiis deserunt ', '1981-04-10 08:16:55', '2015-08-17 20:15:04', '1987-12-21 06:01:11', '1985-02-27 12:51:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (43, 43, 'Ea omnis totam qui nulla sunt maxime voluptatum provident. Impedit maxime sint vitae dolores omnis. ', '2017-02-16 17:36:35', '1982-01-15 04:15:56', '1973-04-04 03:21:12', '2016-09-23 08:52:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (44, 44, 'Odit aut odit quos sint facere deleniti. Debitis enim delectus aut et aut dolore omnis voluptatem. D', '1997-07-31 19:51:26', '2008-12-07 04:05:03', '1977-10-21 00:54:42', '1971-05-04 15:27:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (45, 45, 'Harum doloribus quia numquam quidem incidunt blanditiis velit. Omnis ipsam facilis vero alias nisi u', '2014-06-13 18:56:08', '2015-04-09 13:11:19', '1970-01-31 17:25:10', '1999-06-13 07:58:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (46, 46, 'Quae sed consequatur labore qui neque quod. Dolor numquam quisquam ex dolorem voluptatum. Laudantium', '1997-09-16 16:17:12', '2004-09-07 02:15:56', '2016-08-12 13:18:26', '1974-02-19 02:46:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (47, 47, 'Animi et recusandae recusandae. Dignissimos laboriosam sequi et. Velit eaque nobis laudantium repreh', '2007-08-25 19:39:12', '1979-01-09 15:19:21', '1986-03-21 22:42:36', '1983-07-29 08:15:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (48, 48, 'Sed temporibus deleniti reprehenderit deserunt praesentium sed. Sed facilis natus veritatis. Dolorem', '2017-11-24 22:05:58', '2018-12-09 23:06:08', '2005-05-20 20:02:57', '1988-09-20 15:11:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (49, 49, 'Illo est quo voluptate est. Nulla vitae quisquam aut nihil quibusdam consectetur nobis. Quo velit ra', '2009-10-16 22:12:17', '2006-03-28 15:12:51', '1972-01-21 11:39:01', '2007-06-09 07:35:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (50, 50, 'Voluptatibus ex a soluta voluptates. Non repellendus unde et quod culpa. Pariatur earum voluptatem v', '1996-11-03 21:06:31', '1975-08-07 07:42:52', '1992-07-12 04:00:14', '2020-03-09 04:04:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (51, 51, 'Occaecati molestias ullam blanditiis et eveniet adipisci. Sit quibusdam odit sequi a recusandae. Mol', '1988-12-12 01:39:15', '2017-07-05 19:48:36', '1984-08-16 04:02:36', '2009-11-22 07:52:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (52, 52, 'Pariatur quasi at assumenda et. Ea voluptatem unde facere iste eveniet voluptates qui. Consequatur s', '1988-08-07 18:30:54', '2013-06-27 15:24:19', '2005-09-19 21:56:07', '2013-09-17 14:41:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (53, 53, 'Quod labore officia nobis a quia fugiat et. Nihil voluptas nisi tempore quaerat consequatur tempora ', '2009-03-06 17:57:47', '1978-08-20 01:00:49', '1982-03-09 19:17:32', '1989-05-13 14:45:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (54, 54, 'Ducimus sit illo quia labore architecto. Voluptas non voluptatem libero repellendus soluta. Nesciunt', '1981-02-08 10:12:35', '2014-01-21 07:46:06', '1977-09-07 19:24:11', '2011-12-18 08:04:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (55, 55, 'Unde et esse veritatis nulla harum accusamus. Hic quisquam enim ut libero. Quis nisi incidunt offici', '1994-12-06 19:51:36', '1983-12-27 09:16:13', '2002-07-12 18:10:38', '1988-08-08 14:18:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (56, 56, 'Est aliquid omnis alias illo labore. Aut pariatur dolor mollitia temporibus ut qui. Soluta nostrum e', '1986-05-24 15:13:41', '2019-09-02 06:23:55', '1991-03-21 16:00:06', '2002-01-03 11:57:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (57, 57, 'Vel enim id et temporibus magnam incidunt hic est. Nobis reprehenderit quod sapiente velit expedita.', '2012-07-18 16:42:40', '1998-04-02 18:40:24', '1988-11-24 21:55:09', '1978-11-11 07:46:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (58, 58, 'Magnam quod omnis nesciunt enim incidunt rem repellendus. Atque et adipisci ut incidunt.', '1999-10-16 18:13:49', '1977-09-10 09:34:53', '1996-12-28 06:03:40', '2005-06-07 22:39:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (59, 59, 'Magnam reiciendis dolores quidem atque consequatur ut. Sed omnis omnis et eveniet hic et quaerat rep', '2017-04-04 08:52:48', '1995-05-06 13:36:26', '1993-03-29 14:09:27', '1973-07-31 22:42:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (60, 60, 'Qui et sed illo est dolores. Non enim beatae id sint occaecati. Et alias non ad doloremque voluptate', '2006-06-01 19:21:40', '1977-06-12 12:47:12', '1978-12-08 06:29:10', '2004-12-20 10:36:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (61, 61, 'Assumenda voluptas earum vero qui quos minima. Ipsa reprehenderit quo harum qui. Repudiandae sunt ip', '1971-12-29 20:52:08', '1977-11-27 14:31:16', '2012-05-13 04:45:31', '1987-11-15 08:46:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (62, 62, 'Blanditiis culpa ut asperiores debitis optio non. Minima quam modi ut quisquam doloribus excepturi f', '1970-07-01 02:46:21', '2019-10-03 15:07:55', '1972-07-06 00:01:27', '1976-08-03 14:02:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (63, 63, 'Eos et laborum ab est ea. Repellat quis omnis voluptatem qui. Eius tempora voluptate cumque.', '1986-01-25 01:07:10', '1997-05-28 17:04:13', '1976-05-31 11:42:08', '2003-02-06 13:29:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (64, 64, 'Qui dolorem qui in ullam. Sunt harum sit nemo quae et.', '1995-07-31 18:47:22', '2012-01-24 20:39:59', '2011-09-23 07:32:21', '2015-04-26 18:19:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (65, 65, 'Dolorum molestiae et est laudantium illo consectetur. Aut velit est quam corrupti reprehenderit. Off', '1988-07-16 16:59:49', '1999-10-09 16:42:56', '1980-01-21 01:36:15', '1996-03-10 16:10:57');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (66, 66, 'Doloribus architecto qui minima culpa ducimus saepe. Officiis consequatur sunt libero eos culpa ea s', '1999-06-01 21:41:27', '1985-06-02 11:12:27', '1994-08-09 23:57:45', '1981-06-18 22:27:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (67, 67, 'Illo officia doloremque distinctio. Earum magnam error neque et enim necessitatibus. Placeat volupta', '1989-12-17 22:29:57', '1998-08-19 14:20:30', '2000-11-25 21:56:20', '1993-11-05 06:32:08');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (68, 68, 'Quisquam eius qui est est provident incidunt sequi. Sequi aspernatur corrupti ea ad delectus eveniet', '2011-08-29 10:52:57', '1999-04-07 16:53:07', '1992-04-22 08:34:41', '1991-04-05 05:34:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (69, 69, 'Cum et quidem deserunt expedita et et tempore. Nemo aut dicta aut porro expedita. Magnam repellendus', '1989-06-20 00:54:04', '2009-06-16 07:01:35', '1993-06-27 09:04:04', '2016-02-25 16:15:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (70, 70, 'Dolores nostrum vel cumque ducimus voluptatibus. Perferendis alias cumque tempore sed. Sequi dolor d', '2009-12-16 20:18:09', '2013-06-25 21:52:37', '1970-05-14 02:09:05', '1995-02-28 00:13:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (71, 71, 'Sed reprehenderit eos ut et. Culpa vitae accusantium necessitatibus ut. Qui ratione dolorem ut magni', '1997-05-06 01:35:34', '1978-06-22 14:25:37', '2000-08-13 14:03:39', '2020-07-30 02:03:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (72, 72, 'Maxime occaecati est odit ut. Numquam voluptatem quisquam et dolores.', '1980-08-10 01:16:14', '1972-01-22 04:32:39', '1982-02-19 19:42:55', '2007-05-06 12:49:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (73, 73, 'Voluptas maxime omnis quo recusandae quibusdam. Est sint maxime quaerat aliquid libero atque tempori', '1994-11-29 16:29:55', '1990-03-30 08:19:31', '2002-05-17 11:41:40', '1981-01-19 00:34:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (74, 74, 'Cumque voluptatem magnam fuga ad molestias. Quia odio et consequuntur aliquid aut. Excepturi quia vo', '1983-11-20 21:01:17', '2012-04-10 08:45:05', '2008-02-01 01:37:19', '1986-11-18 03:49:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (75, 75, 'Labore quis praesentium non deserunt et aperiam. Quasi qui consequatur quod maxime dolore accusantiu', '2020-10-19 20:39:34', '1987-07-12 16:31:12', '1997-12-26 19:05:06', '1991-12-20 16:22:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (76, 76, 'Minima numquam amet quis. Itaque et debitis labore voluptatem sit. Mollitia officia vel quis vel et ', '2009-10-19 04:12:24', '1992-02-07 17:08:35', '1971-10-30 04:45:03', '2012-11-26 02:24:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (77, 77, 'Impedit quibusdam aliquid rerum animi. Ab quas laboriosam non et laudantium. Distinctio laudantium c', '1977-01-10 23:33:39', '2002-04-28 12:51:31', '2008-12-05 19:29:31', '1977-01-30 12:21:36');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (78, 78, 'Vitae harum et odio. Vero ut quia odit adipisci repudiandae est dolorem a. Ea inventore vitae culpa ', '2012-01-08 01:02:11', '1994-07-02 00:46:41', '1979-08-28 22:08:45', '1983-10-31 12:55:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (79, 79, 'Non fugiat nulla nostrum qui ea. Voluptatum est assumenda deleniti soluta consequatur et. Iure sint ', '1993-03-16 05:45:32', '1978-04-21 20:27:42', '1989-08-08 19:05:56', '1970-07-01 17:51:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (80, 80, 'Ipsam quisquam minima nostrum sint quod ut repellendus sed. Fugiat rerum nihil quisquam non error in', '1992-07-07 19:51:56', '1982-05-21 05:03:06', '1998-10-15 12:47:13', '1988-04-26 23:56:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (81, 81, 'Eligendi nihil repellat necessitatibus consequatur aut quasi aut. Consectetur porro voluptas rerum n', '1998-09-16 05:08:00', '1979-11-25 11:44:51', '1994-07-28 16:53:13', '2016-03-27 13:06:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (82, 82, 'Qui voluptate modi necessitatibus voluptatem et. Libero ullam molestias laborum dolorem ad asperiore', '1978-03-19 10:23:19', '1996-02-16 11:06:22', '2004-02-06 03:45:54', '1979-11-03 14:05:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (83, 83, 'Autem quo quaerat nostrum vero vero. Rem quos doloremque omnis perferendis. Et id accusamus sunt ips', '2008-06-29 20:18:35', '1979-01-12 02:38:49', '2018-08-30 00:31:20', '1987-04-11 08:01:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (84, 84, 'Et ut voluptas quos aut ea consequatur modi. Autem labore omnis qui. Dolorem et voluptatem nam fugit', '1974-11-24 14:32:10', '2000-08-25 18:49:52', '2020-10-06 10:07:35', '1977-12-28 23:47:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (85, 85, 'Tempora eius ratione dolores deleniti id dicta. Molestiae qui voluptatum et accusamus doloremque. Pr', '1985-10-24 20:40:49', '1972-02-02 04:39:27', '1987-05-14 01:14:47', '2015-05-22 08:25:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (86, 86, 'Sapiente dolorum quia eos. Aperiam ut sed quae architecto et dolor. In voluptatem excepturi repellat', '2008-07-12 08:50:00', '1981-11-27 12:21:15', '1970-05-23 18:59:45', '2016-05-14 17:11:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (87, 87, 'Quis quia sint et voluptates sit maiores eius. Velit ab eveniet in non et sint amet illum.', '1978-04-04 22:39:36', '2011-05-18 22:13:51', '1973-01-29 14:54:05', '1995-08-30 13:23:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (88, 88, 'Dolorum quas delectus ipsa sed sunt deserunt. Ut in qui nostrum in nisi est consectetur. Sequi sit v', '2020-02-16 18:04:21', '1985-05-31 04:35:52', '2005-10-27 03:39:49', '1971-07-27 12:36:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (89, 89, 'Debitis hic praesentium est non mollitia consequuntur. Quos aliquam dicta molestias qui voluptas ven', '1986-03-07 10:31:24', '2007-07-19 11:06:42', '2015-09-07 11:28:37', '1972-02-27 00:34:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (90, 90, 'Esse consequatur aspernatur et non rerum quas consequuntur nemo. Inventore id maiores illo delectus ', '1973-08-04 23:39:46', '1999-05-10 18:22:55', '1984-05-09 23:37:15', '2007-10-25 15:48:39');


#
# TABLE STRUCTURE FOR: like_types
#

DROP TABLE IF EXISTS `like_types`;

CREATE TABLE `like_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `like_type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название варианта лайка',
  PRIMARY KEY (`id`),
  UNIQUE KEY `like_type_name` (`like_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Справочная таблица с типами лайков';

INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (13, 'consequuntur');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (5, 'dicta');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (3, 'dolor');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (19, 'eos');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (16, 'error');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (14, 'est');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (15, 'et');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (1, 'excepturi');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (10, 'facere');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (8, 'harum');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (12, 'laboriosam');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (2, 'nemo');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (9, 'neque');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (6, 'nihil');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (17, 'numquam');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (11, 'perspiciatis');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (7, 'qui');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (20, 'reiciendis');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (4, 'similique');
INSERT INTO `like_types` (`id`, `like_type_name`) VALUES (18, 'veritatis');


#
# TABLE STRUCTURE FOR: likes
#

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор сущности',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор пользователя',
  `like_type_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип лайка',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_likes_entity_id` (`entity_id`),
  KEY `fk_likes_type_id` (`like_type_id`),
  CONSTRAINT `fk_likes_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity_types` (`id`),
  CONSTRAINT `fk_likes_type_id` FOREIGN KEY (`like_type_id`) REFERENCES `like_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица лайков';

INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, '2020-10-10 13:15:15', '1975-02-08 21:32:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (2, 2, 2, 2, '1979-07-01 12:21:06', '1970-10-23 02:22:54');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (3, 3, 3, 3, '1972-07-09 04:52:07', '1975-02-18 13:38:08');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (4, 4, 4, 4, '2001-08-19 04:01:53', '1996-06-25 15:22:36');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (5, 5, 5, 5, '2009-02-06 08:05:17', '1980-12-15 11:26:57');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (6, 6, 6, 6, '1982-01-25 16:14:44', '2015-11-04 14:03:17');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (7, 7, 7, 7, '2008-03-02 01:12:29', '2002-05-08 22:34:45');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (8, 8, 8, 8, '1987-12-16 00:35:11', '2006-06-29 11:19:09');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (9, 9, 9, 9, '2016-06-13 21:33:28', '1971-07-07 00:57:52');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (10, 10, 10, 10, '2005-09-01 03:02:09', '1990-08-06 09:11:20');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (11, 11, 11, 11, '1995-01-11 07:24:17', '2021-02-15 19:34:59');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (12, 12, 12, 12, '2014-12-14 12:02:25', '1993-10-06 11:13:39');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (13, 13, 13, 13, '1981-11-05 04:31:31', '1979-10-09 14:35:14');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (14, 14, 14, 14, '1990-04-04 06:41:16', '2015-08-10 18:39:16');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (15, 15, 15, 15, '2012-03-18 05:41:58', '1971-01-17 17:58:13');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (16, 16, 16, 16, '1972-12-07 02:15:00', '2020-10-02 10:30:08');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (17, 17, 17, 17, '1978-05-25 10:38:06', '2013-12-28 04:44:04');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (18, 18, 18, 18, '2013-06-11 04:13:38', '1982-09-21 07:35:33');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (19, 19, 19, 19, '1975-11-08 20:42:35', '2015-12-09 15:47:02');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (20, 20, 20, 20, '2005-12-23 22:57:56', '1971-03-26 01:29:14');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (21, 21, 21, 1, '1979-01-22 11:53:54', '1985-05-10 12:28:34');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (22, 22, 22, 2, '2002-03-23 17:25:26', '1973-06-02 05:58:57');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (23, 23, 23, 3, '1989-07-24 23:52:11', '1997-12-03 06:28:54');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (24, 24, 24, 4, '1987-09-15 20:42:45', '1986-05-29 22:26:49');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (25, 25, 25, 5, '1987-04-21 14:45:10', '2009-09-23 21:46:16');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (26, 26, 26, 6, '1994-10-12 04:00:40', '2015-01-26 19:44:22');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (27, 27, 27, 7, '1977-12-07 14:12:33', '1982-06-23 09:56:56');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (28, 28, 28, 8, '2007-05-05 03:16:38', '1976-09-28 03:07:24');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (29, 29, 29, 9, '2018-03-26 08:50:15', '1977-06-15 14:38:03');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (30, 30, 30, 10, '1970-10-04 23:17:27', '1983-03-26 03:51:27');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (31, 1, 31, 11, '1982-06-07 04:08:06', '1998-07-30 22:49:19');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (32, 2, 32, 12, '1999-05-12 12:48:44', '2009-02-08 23:12:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (33, 3, 33, 13, '1990-05-03 09:15:57', '1974-03-27 11:39:50');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (34, 4, 34, 14, '1978-08-28 08:26:00', '1995-11-17 21:40:49');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (35, 5, 35, 15, '1998-01-28 11:24:22', '2002-05-11 05:25:00');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (36, 6, 36, 16, '2018-11-15 07:46:42', '2006-06-16 00:34:43');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (37, 7, 37, 17, '1984-05-05 19:59:59', '2001-02-02 16:59:57');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (38, 8, 38, 18, '2000-01-13 16:24:48', '1971-07-31 12:35:34');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (39, 9, 39, 19, '1982-01-01 15:22:47', '2020-04-20 06:25:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (40, 10, 40, 20, '1992-05-13 22:26:05', '1982-06-04 19:13:19');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (41, 11, 41, 1, '2001-05-12 10:06:19', '2010-07-07 23:58:26');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (42, 12, 42, 2, '1997-12-26 07:45:38', '2008-10-05 10:24:31');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (43, 13, 43, 3, '1990-06-08 22:10:53', '2000-06-24 18:09:56');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (44, 14, 44, 4, '2010-07-23 13:32:09', '1995-01-11 15:22:59');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (45, 15, 45, 5, '2009-10-08 02:32:21', '1993-08-22 08:26:00');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (46, 16, 46, 6, '2019-10-27 20:10:50', '1989-05-03 08:54:06');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (47, 17, 47, 7, '1999-08-22 20:06:09', '1990-11-29 21:43:24');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (48, 18, 48, 8, '2015-11-29 07:58:39', '1985-06-16 19:48:43');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (49, 19, 49, 9, '2001-02-08 18:12:10', '1970-05-17 12:01:03');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (50, 20, 50, 10, '1979-12-05 07:43:05', '1999-03-23 22:16:03');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (51, 21, 51, 11, '2009-11-03 21:14:41', '1989-01-01 06:19:36');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (52, 22, 52, 12, '1992-09-24 14:28:20', '2010-12-27 19:54:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (53, 23, 53, 13, '1996-08-19 04:15:24', '2017-09-08 22:46:22');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (54, 24, 54, 14, '1977-03-15 11:33:05', '1978-12-01 17:59:13');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (55, 25, 55, 15, '2010-02-24 04:49:26', '1975-12-13 15:05:45');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (56, 26, 56, 16, '2009-02-15 16:10:24', '1989-08-25 06:25:36');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (57, 27, 57, 17, '1981-01-13 22:36:14', '1980-01-26 00:37:50');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (58, 28, 58, 18, '2016-04-29 16:35:43', '1984-01-10 12:19:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (59, 29, 59, 19, '1997-12-16 21:26:27', '1978-05-27 20:49:30');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (60, 30, 60, 20, '2015-06-11 09:30:23', '1994-05-16 16:38:53');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (61, 1, 61, 1, '1983-07-13 02:35:22', '1975-10-22 14:05:02');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (62, 2, 62, 2, '2014-04-05 18:43:04', '2021-01-16 00:58:26');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (63, 3, 63, 3, '1998-02-21 12:23:57', '1983-10-25 09:50:52');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (64, 4, 64, 4, '1990-03-17 01:20:35', '1990-07-15 19:44:11');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (65, 5, 65, 5, '2009-04-21 00:27:26', '1992-08-04 16:32:10');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (66, 6, 66, 6, '2002-01-04 06:04:59', '1982-10-26 22:18:34');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (67, 7, 67, 7, '1992-07-16 02:03:07', '2019-07-07 01:39:55');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (68, 8, 68, 8, '1972-02-28 17:55:03', '1993-02-15 09:04:40');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (69, 9, 69, 9, '1991-01-08 11:49:19', '1983-12-13 17:27:37');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (70, 10, 70, 10, '1980-11-11 03:28:12', '2006-06-18 20:01:06');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (71, 11, 71, 11, '2001-02-21 12:50:03', '1972-01-22 16:21:25');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (72, 12, 72, 12, '2010-01-10 08:05:23', '1972-06-10 16:47:55');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (73, 13, 73, 13, '1972-01-12 07:21:32', '1972-09-26 05:50:52');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (74, 14, 74, 14, '1999-07-11 18:22:00', '1974-03-27 12:55:17');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (75, 15, 75, 15, '2018-08-24 19:27:49', '2013-06-21 03:23:34');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (76, 16, 76, 16, '1987-09-01 09:21:40', '1996-08-16 02:01:45');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (77, 17, 77, 17, '1985-08-15 18:46:38', '1996-06-26 09:18:09');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (78, 18, 78, 18, '1983-07-31 19:01:57', '1995-01-03 15:51:39');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (79, 19, 79, 19, '1976-03-14 08:43:59', '2017-10-29 11:44:58');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (80, 20, 80, 20, '1977-10-08 19:16:01', '1993-04-14 08:04:37');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (81, 21, 81, 1, '2002-02-27 05:48:03', '2018-02-08 14:15:02');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (82, 22, 82, 2, '1980-02-22 10:57:37', '2003-06-21 21:54:15');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (83, 23, 83, 3, '1981-09-21 20:01:25', '1982-11-28 08:16:35');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (84, 24, 84, 4, '1999-12-09 15:53:57', '1982-06-12 13:06:00');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (85, 25, 85, 5, '1979-07-31 02:06:08', '1998-05-08 15:25:31');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (86, 26, 86, 6, '1971-03-30 10:14:06', '1987-03-20 12:21:47');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (87, 27, 87, 7, '1997-12-08 15:22:23', '2004-01-29 01:05:43');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (88, 28, 88, 8, '1974-09-23 16:39:50', '1975-01-07 08:58:13');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (89, 29, 89, 9, '2002-04-16 18:31:25', '1978-01-07 23:36:48');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (90, 30, 90, 10, '2004-05-26 10:11:08', '1995-07-19 02:05:29');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (91, 1, 91, 11, '1989-02-21 04:57:54', '1977-08-29 00:59:35');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (92, 2, 92, 12, '1977-01-15 10:26:17', '2000-07-29 20:42:01');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (93, 3, 93, 13, '1972-03-26 23:57:56', '1998-08-02 08:01:05');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (94, 4, 94, 14, '1979-01-17 00:26:15', '1992-11-13 22:04:01');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (95, 5, 95, 15, '2011-10-10 21:47:02', '2009-08-13 08:10:07');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (96, 6, 96, 16, '1977-05-05 15:12:35', '1976-09-04 12:29:10');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (97, 7, 97, 17, '1987-03-08 23:58:51', '1977-06-08 11:27:32');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (98, 8, 98, 18, '2003-12-28 04:51:09', '1975-11-11 16:03:33');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (99, 9, 99, 19, '1979-05-27 10:03:13', '1987-05-09 04:32:11');
INSERT INTO `likes` (`id`, `entity_id`, `from_user_id`, `like_type_id`, `created_at`, `updated_at`) VALUES (100, 10, 100, 20, '1974-04-16 10:07:43', '1987-01-29 15:11:58');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `media_type_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `filename` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Путь в файлу',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_media_type_id` (`media_type_id`),
  CONSTRAINT `fk_media_type_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиа';

INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (1, 1, 'magni', '2012-04-28 02:37:23', '1991-10-24 06:53:31');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (2, 2, 'consectetur', '2019-10-04 01:21:04', '1978-07-05 18:23:47');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (3, 3, 'id', '1974-09-21 20:08:35', '1978-10-17 14:20:30');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (4, 4, 'incidunt', '2002-09-03 18:25:34', '1972-04-09 06:24:28');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (5, 5, 'maxime', '2015-08-23 20:17:36', '2000-06-24 03:13:25');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (6, 6, 'earum', '1978-11-06 11:33:34', '2006-09-05 22:12:00');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (7, 7, 'harum', '1981-06-07 10:13:59', '2009-10-22 03:39:40');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (8, 8, 'omnis', '1996-10-19 15:02:50', '1987-08-07 22:29:03');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (9, 9, 'aut', '1993-04-20 16:37:13', '2008-12-24 05:24:39');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (10, 10, 'quis', '2016-09-08 16:17:43', '1975-03-05 13:57:55');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (11, 11, 'praesentium', '2002-01-01 18:47:58', '1998-10-14 04:09:33');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (12, 12, 'autem', '1976-01-07 11:00:23', '1978-08-08 15:23:39');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (13, 13, 'possimus', '2013-02-02 19:50:41', '2016-10-04 09:37:22');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (14, 14, 'consequatur', '2002-10-08 21:16:42', '2000-05-28 11:41:59');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (15, 15, 'minus', '1976-07-07 17:03:29', '1990-08-03 00:43:11');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (16, 16, 'recusandae', '2019-02-02 22:19:50', '2014-09-07 13:37:51');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (17, 17, 'dignissimos', '2002-06-03 11:15:04', '1984-09-30 21:12:06');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (18, 18, 'velit', '2020-04-24 14:55:25', '1986-04-04 19:38:05');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (19, 19, 'eius', '1991-08-09 03:36:43', '1981-09-22 16:11:24');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (20, 20, 'numquam', '1970-07-24 16:02:36', '1999-11-25 18:14:11');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (21, 1, 'quia', '1992-08-08 02:43:24', '2016-01-30 21:34:08');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (22, 2, 'aut', '2010-09-04 06:56:56', '2009-11-04 06:05:35');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (23, 3, 'vel', '1995-02-28 19:11:46', '1975-10-27 09:23:30');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (24, 4, 'natus', '1992-07-19 00:10:13', '1975-10-08 17:14:52');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (25, 5, 'nihil', '2007-06-26 15:15:20', '2013-06-19 13:42:43');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (26, 6, 'ea', '2016-10-11 11:42:17', '2005-08-29 07:32:25');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (27, 7, 'ratione', '2015-02-19 16:19:22', '1974-01-25 12:58:56');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (28, 8, 'ut', '2000-10-17 00:44:16', '1978-12-21 16:33:51');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (29, 9, 'quis', '2008-05-13 19:50:39', '2011-05-10 21:33:58');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (30, 10, 'accusantium', '1973-01-21 21:33:35', '1999-12-05 18:47:06');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (31, 11, 'distinctio', '1971-10-07 10:36:34', '1970-02-22 00:55:06');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (32, 12, 'explicabo', '1997-01-09 00:17:42', '1985-10-22 15:20:59');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (33, 13, 'distinctio', '1971-07-29 16:18:03', '1989-02-21 17:47:06');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (34, 14, 'non', '2019-05-02 23:27:07', '2017-12-12 21:37:05');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (35, 15, 'dicta', '1982-04-03 10:55:34', '1991-12-17 14:44:56');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (36, 16, 'sit', '2004-06-11 00:26:31', '1996-06-27 14:56:19');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (37, 17, 'ipsa', '1971-03-12 07:20:11', '1998-11-24 21:20:43');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (38, 18, 'voluptatibus', '2017-10-25 17:59:51', '2020-11-05 23:14:53');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (39, 19, 'laborum', '1989-09-08 13:55:47', '2000-08-14 14:59:24');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (40, 20, 'quibusdam', '2021-06-30 16:16:36', '1973-07-01 08:44:46');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (41, 1, 'non', '1996-02-28 22:51:31', '1976-07-20 09:28:32');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (42, 2, 'adipisci', '2007-12-24 11:24:46', '1971-01-26 14:52:02');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (43, 3, 'aliquam', '1997-06-06 00:27:51', '1995-06-04 21:04:29');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (44, 4, 'earum', '1970-03-06 06:31:26', '1978-01-26 14:37:00');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (45, 5, 'consequatur', '2021-05-30 04:02:43', '1982-05-19 15:36:25');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (46, 6, 'alias', '1971-02-25 19:59:14', '1992-04-09 01:38:47');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (47, 7, 'accusantium', '1991-01-03 04:22:09', '2003-05-26 14:12:54');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (48, 8, 'distinctio', '1998-04-29 06:54:47', '2009-12-10 10:04:19');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (49, 9, 'architecto', '1980-02-12 16:23:35', '1992-12-27 04:55:08');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (50, 10, 'reprehenderit', '1988-01-29 10:04:11', '1982-12-30 01:50:37');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (51, 11, 'inventore', '2020-02-17 06:36:35', '2013-11-08 18:35:03');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (52, 12, 'officia', '2007-07-25 22:22:21', '1998-03-20 17:00:34');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (53, 13, 'voluptas', '1978-11-07 08:17:03', '1996-04-22 01:17:35');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (54, 14, 'pariatur', '2004-05-14 11:10:19', '1997-10-30 20:13:00');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (55, 15, 'sint', '1996-06-18 19:10:22', '2000-05-30 09:03:38');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (56, 16, 'animi', '1998-09-23 18:48:07', '2017-03-06 15:35:18');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (57, 17, 'velit', '2005-06-28 05:19:41', '1987-06-04 16:28:29');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (58, 18, 'aut', '1989-09-30 10:42:15', '1993-08-30 17:03:06');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (59, 19, 'laborum', '2000-05-15 00:38:51', '2015-01-10 21:46:17');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (60, 20, 'dolor', '2009-08-11 06:53:41', '1974-02-26 09:48:45');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (61, 1, 'est', '2004-05-20 22:09:51', '1986-02-10 04:00:28');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (62, 2, 'natus', '2016-08-04 00:30:27', '1991-09-06 14:13:43');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (63, 3, 'voluptas', '1975-08-20 13:46:07', '1976-04-16 12:34:34');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (64, 4, 'doloribus', '2013-02-03 10:29:55', '1975-12-09 19:00:09');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (65, 5, 'unde', '1970-08-07 00:41:32', '2006-02-22 16:54:49');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (66, 6, 'tempora', '2019-12-07 03:26:00', '1987-12-01 12:10:21');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (67, 7, 'quae', '2017-12-11 00:00:53', '1978-05-22 13:00:05');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (68, 8, 'libero', '1991-01-30 16:25:11', '2006-01-30 03:06:43');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (69, 9, 'rerum', '2014-03-30 03:43:53', '1980-01-29 21:47:14');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (70, 10, 'vel', '1985-09-29 06:42:37', '1971-11-21 21:58:57');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (71, 11, 'odit', '1989-08-09 09:26:37', '2009-09-26 13:36:55');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (72, 12, 'debitis', '1988-12-05 09:13:45', '1987-07-02 05:16:22');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (73, 13, 'vel', '2016-03-23 14:06:19', '2014-08-08 04:36:35');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (74, 14, 'perferendis', '1992-04-22 20:21:42', '2012-08-24 18:19:51');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (75, 15, 'aut', '1977-03-26 23:17:26', '1998-04-04 21:46:21');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (76, 16, 'molestias', '1993-01-31 04:48:28', '1978-11-21 20:14:41');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (77, 17, 'non', '1986-07-27 04:29:37', '1970-01-04 01:46:10');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (78, 18, 'eius', '1989-05-12 18:04:34', '1971-10-11 20:19:34');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (79, 19, 'blanditiis', '2000-09-16 11:51:10', '2009-08-27 03:18:32');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (80, 20, 'et', '2000-05-13 00:44:34', '1998-10-12 07:59:33');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (81, 1, 'qui', '1971-11-26 16:03:00', '1976-08-09 02:47:46');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (82, 2, 'ab', '2011-04-08 04:41:14', '2014-10-17 09:54:50');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (83, 3, 'delectus', '2005-01-27 03:47:12', '2016-07-11 03:58:44');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (84, 4, 'suscipit', '2021-06-03 20:21:23', '1992-04-02 19:56:49');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (85, 5, 'accusantium', '1992-08-13 01:24:45', '2000-10-23 15:43:19');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (86, 6, 'quo', '1986-03-04 13:28:47', '1986-06-12 05:02:04');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (87, 7, 'suscipit', '1971-04-28 10:09:16', '1980-05-07 22:34:48');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (88, 8, 'facilis', '2015-09-04 08:25:24', '1992-07-01 21:38:32');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (89, 9, 'aut', '1992-01-30 21:27:04', '2020-01-08 22:07:33');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (90, 10, 'necessitatibus', '1999-03-10 21:31:06', '1981-12-21 23:24:43');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (91, 11, 'voluptas', '2014-11-17 07:08:19', '2009-03-08 03:28:08');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (92, 12, 'commodi', '2016-12-11 04:56:11', '1989-11-10 13:18:59');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (93, 13, 'voluptas', '1987-12-21 05:28:17', '1999-10-18 14:46:33');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (94, 14, 'suscipit', '1976-11-11 19:32:24', '1999-12-29 23:12:27');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (95, 15, 'id', '2010-10-21 23:20:12', '1970-10-12 04:28:52');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (96, 16, 'magnam', '1981-11-09 01:30:27', '1976-12-23 06:17:52');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (97, 17, 'aut', '1979-11-29 20:48:10', '1985-10-01 18:38:36');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (98, 18, 'vitae', '1975-06-17 22:48:08', '2012-04-05 07:01:51');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (99, 19, 'earum', '2016-02-17 02:17:42', '1972-01-24 08:38:08');
INSERT INTO `media` (`id`, `media_type_id`, `filename`, `created_at`, `updated_at`) VALUES (100, 20, 'est', '2018-01-13 04:54:36', '1987-12-19 17:20:16');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип медиайла',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип медиа контента';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'quidem', '2014-06-22 02:21:59', '1985-03-25 03:39:20');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'consequatur', '1985-07-13 08:28:04', '2012-04-01 10:14:57');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'aspernatur', '1974-10-08 17:06:17', '1977-03-22 05:35:29');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'dolorum', '1999-04-16 08:29:36', '1994-11-12 12:31:38');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'fugiat', '2014-01-26 05:37:20', '1996-10-22 08:51:32');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'repudiandae', '2020-05-29 01:43:08', '1998-08-11 10:01:46');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'totam', '1972-11-17 17:44:03', '1971-02-09 02:18:28');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'necessitatibus', '2016-12-08 22:01:55', '1987-10-31 20:11:41');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'est', '1975-01-07 19:56:24', '2006-10-29 13:39:21');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'nihil', '1975-12-03 17:43:03', '1981-06-12 13:11:39');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'voluptas', '2008-11-10 07:57:40', '2021-04-17 14:38:16');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'qui', '2020-08-13 19:28:00', '2018-05-26 22:39:55');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'impedit', '1984-11-15 07:14:08', '1993-10-09 15:10:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'quia', '1999-04-16 00:29:17', '1994-09-25 21:26:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'rerum', '1995-12-11 11:08:56', '1978-02-11 02:18:29');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'quod', '1980-05-24 06:19:09', '2013-06-18 07:38:54');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'facere', '1992-01-27 20:17:45', '2003-02-10 08:18:41');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'dolore', '1977-03-29 21:54:57', '1980-08-21 10:53:20');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'illo', '2007-02-23 20:49:12', '1982-06-13 23:30:57');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'sed', '1971-08-10 18:34:16', '1975-08-11 07:36:46');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `sender_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор отправителя',
  `reciever_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор получателя',
  `send_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления сообщения',
  `recieved_at` datetime DEFAULT NULL COMMENT 'Время получения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_sender_id` (`sender_id`),
  KEY `reciever_id` (`reciever_id`),
  CONSTRAINT `fk_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reciever_id` FOREIGN KEY (`reciever_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (1, 1, 1, '1995-08-09 15:57:53', '2002-05-01 04:15:19', '1983-08-13 22:35:09', '2002-08-24 23:58:08');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (2, 2, 2, '1984-04-24 13:16:48', '1990-05-27 19:54:10', '2018-06-18 21:50:38', '1996-08-05 02:45:10');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (3, 3, 3, '2005-09-12 07:47:51', '2014-06-07 18:04:14', '1997-03-27 00:03:12', '1978-11-27 13:06:38');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (4, 4, 4, '1987-09-29 22:56:06', '2019-08-16 20:31:44', '2010-02-27 19:33:54', '1992-02-21 03:53:02');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (5, 5, 5, '2004-07-20 11:01:58', '2008-12-12 04:12:59', '1996-05-20 10:27:20', '1982-02-28 23:19:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (6, 6, 6, '2011-12-15 16:22:55', '2007-09-04 20:53:40', '2010-11-05 17:00:03', '1973-06-01 08:06:11');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (7, 7, 7, '1997-07-11 09:31:16', '1991-08-16 21:48:54', '1991-06-08 01:38:53', '1978-09-06 13:53:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (8, 8, 8, '1996-04-08 00:00:39', '1988-09-26 18:56:36', '2005-04-07 02:33:16', '2014-07-02 12:47:12');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (9, 9, 9, '1971-09-23 10:08:45', '1993-08-21 03:49:33', '1972-06-08 07:23:57', '1986-02-06 05:16:16');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (10, 10, 10, '1977-07-16 21:06:19', '1994-04-26 07:26:36', '2007-05-31 11:23:10', '1984-09-11 03:01:19');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (11, 11, 11, '1984-04-21 06:26:28', '1975-12-08 20:29:18', '1993-07-08 06:11:19', '1981-03-15 09:29:11');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (12, 12, 12, '1999-07-20 11:10:15', '1970-01-28 02:52:31', '2016-12-20 09:04:42', '1972-12-03 15:43:26');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (13, 13, 13, '2017-11-03 09:31:39', '1983-01-29 15:01:50', '2001-08-09 08:53:22', '1999-11-23 00:11:11');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (14, 14, 14, '1981-05-10 14:30:34', '2000-11-21 14:09:48', '2013-08-02 10:59:14', '1972-04-05 02:12:04');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (15, 15, 15, '1988-03-19 03:58:49', '1978-10-13 02:14:03', '1977-08-29 14:19:42', '2013-03-13 05:56:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (16, 16, 16, '2014-06-18 07:51:45', '2001-04-23 23:59:25', '1977-06-08 08:28:07', '2020-01-02 01:46:15');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (17, 17, 17, '2019-04-07 19:11:25', '2009-01-01 05:13:17', '1984-08-25 18:00:58', '1980-08-09 17:04:08');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (18, 18, 18, '1970-12-31 02:21:43', '2009-12-27 05:44:52', '1986-05-15 20:45:34', '2017-04-01 01:59:37');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (19, 19, 19, '2013-09-04 04:23:38', '1976-03-06 22:52:09', '2004-05-05 18:22:33', '2003-10-30 21:48:14');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (20, 20, 20, '2012-10-16 14:48:53', '1987-11-12 18:18:29', '1994-09-07 12:20:10', '1978-02-02 15:51:48');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (21, 21, 21, '2019-10-13 21:04:17', '1986-03-28 02:28:49', '1975-05-25 18:55:56', '2014-12-19 23:17:57');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (22, 22, 22, '1981-12-03 16:22:20', '2003-07-21 10:54:03', '2008-02-06 19:35:53', '1997-02-07 05:12:45');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (23, 23, 23, '2010-12-28 06:21:58', '1982-01-08 07:29:21', '1976-03-27 13:05:03', '1982-12-07 13:40:04');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (24, 24, 24, '1999-05-02 08:16:45', '1980-03-27 13:32:56', '1976-11-14 02:44:42', '1998-11-12 08:42:39');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (25, 25, 25, '1994-05-08 01:20:59', '1989-08-01 14:03:16', '2011-03-04 09:53:55', '2019-05-01 17:49:37');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (26, 26, 26, '2013-03-24 12:51:14', '2017-08-08 21:01:17', '1977-09-21 00:41:29', '2008-10-29 23:02:07');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (27, 27, 27, '2015-07-25 00:01:16', '2015-08-22 11:51:33', '1988-07-27 20:13:36', '1994-02-04 07:57:20');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (28, 28, 28, '1975-12-04 01:57:32', '2011-10-27 16:24:38', '1996-03-20 12:52:33', '1990-10-26 15:49:49');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (29, 29, 29, '1988-09-13 16:50:17', '1976-04-11 20:57:36', '1999-02-28 19:26:50', '1981-10-10 19:34:10');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (30, 30, 30, '1983-08-07 04:33:02', '2004-01-13 08:36:44', '1970-03-17 14:16:53', '1985-12-25 15:46:14');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (31, 31, 31, '2013-01-04 02:49:31', '1997-06-14 18:47:12', '1985-04-07 03:24:35', '2019-02-04 21:03:05');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (32, 32, 32, '1988-11-15 15:00:08', '1970-12-11 03:53:21', '2017-05-28 17:51:36', '1988-11-14 19:12:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (33, 33, 33, '2015-02-12 13:39:01', '2006-09-12 21:33:13', '1993-02-09 15:58:23', '1986-11-26 16:44:29');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (34, 34, 34, '1980-09-09 02:54:36', '1989-10-15 22:19:21', '2020-04-27 10:09:07', '1972-06-16 07:31:47');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (35, 35, 35, '1976-01-15 01:27:10', '1997-07-06 09:45:31', '2020-07-24 06:48:52', '1982-03-21 17:15:59');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (36, 36, 36, '1978-04-30 17:29:04', '1995-01-10 13:42:46', '2011-02-09 09:27:33', '2008-06-23 04:33:10');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (37, 37, 37, '2016-03-27 00:50:12', '1999-03-26 22:45:54', '1996-05-10 04:52:11', '1971-10-14 16:00:17');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (38, 38, 38, '2016-08-29 12:26:51', '1997-06-17 02:59:46', '1990-09-26 11:37:58', '1983-03-03 12:53:47');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (39, 39, 39, '1984-02-11 03:56:09', '1973-03-02 04:26:08', '1993-08-11 18:34:59', '2006-07-17 19:04:46');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (40, 40, 40, '1991-11-27 04:38:25', '1993-06-11 13:20:28', '1976-01-18 16:31:00', '1970-12-09 11:28:11');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (41, 41, 41, '2000-12-27 19:33:29', '1989-08-15 20:42:05', '2007-08-21 01:08:00', '2016-12-19 06:51:33');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (42, 42, 42, '2005-08-10 03:15:09', '2010-08-01 00:25:19', '1986-02-01 07:46:10', '2002-06-08 22:56:36');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (43, 43, 43, '2013-07-30 05:09:37', '1991-05-12 21:58:14', '1993-12-26 00:21:22', '2008-02-07 23:40:18');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (44, 44, 44, '1972-10-21 03:18:18', '2016-03-19 20:23:48', '1972-01-07 00:00:23', '1980-01-29 15:47:42');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (45, 45, 45, '2018-05-03 23:13:37', '2005-05-12 13:34:58', '2015-07-25 21:55:34', '1973-04-15 04:51:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (46, 46, 46, '1998-11-01 17:37:03', '1977-04-15 03:53:23', '1983-11-22 08:07:49', '1975-11-25 12:02:46');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (47, 47, 47, '2004-08-03 17:35:28', '2017-10-04 03:08:13', '1998-07-07 13:27:31', '1972-05-10 16:07:47');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (48, 48, 48, '1999-07-15 22:45:54', '1980-07-22 21:52:08', '2010-02-17 23:02:09', '2013-11-09 03:44:40');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (49, 49, 49, '1986-05-20 11:32:15', '1992-10-31 01:45:10', '2005-03-16 00:23:33', '1995-09-23 01:46:28');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (50, 50, 50, '1987-06-23 17:42:34', '2007-03-06 23:25:31', '2021-05-14 19:09:06', '1999-04-13 00:30:38');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (51, 51, 51, '1996-05-23 10:09:04', '2016-06-16 20:22:39', '1971-08-10 04:59:07', '1997-04-22 23:09:28');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (52, 52, 52, '1972-11-09 11:21:42', '1993-11-30 09:05:34', '2010-08-16 04:04:02', '2017-05-10 04:15:58');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (53, 53, 53, '1996-08-31 07:30:43', '1984-07-24 17:39:50', '1987-07-25 00:03:12', '1974-06-20 19:25:46');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (54, 54, 54, '1994-06-28 22:51:11', '2017-10-26 18:31:02', '1974-06-22 12:47:56', '1972-08-18 06:32:16');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (55, 55, 55, '1975-10-24 22:00:47', '2004-03-05 05:41:06', '1984-11-25 23:39:20', '2009-11-13 08:20:32');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (56, 56, 56, '1984-11-21 17:00:51', '1976-06-11 20:15:03', '1984-02-04 18:22:23', '2009-01-26 09:54:27');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (57, 57, 57, '1979-05-13 14:08:07', '2011-09-02 13:28:00', '1977-02-18 20:06:32', '1986-05-06 04:22:16');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (58, 58, 58, '1996-07-05 14:20:51', '1970-07-04 03:09:33', '1979-05-30 03:53:32', '2012-07-08 07:20:25');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (59, 59, 59, '1976-04-17 12:21:09', '1999-06-16 22:30:47', '2005-06-20 08:28:07', '2017-02-04 06:25:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (60, 60, 60, '1981-08-28 07:10:37', '1982-05-04 06:33:12', '1976-07-09 16:20:56', '1987-08-04 01:18:13');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (61, 61, 61, '2000-10-10 05:53:36', '1976-02-04 18:40:26', '1981-09-17 13:07:32', '2020-12-21 01:11:34');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (62, 62, 62, '1988-09-18 20:03:10', '1998-11-13 23:48:20', '1988-06-28 21:59:02', '2020-11-09 16:38:17');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (63, 63, 63, '1992-06-02 09:17:43', '1991-11-23 07:05:51', '2011-07-16 11:00:45', '2013-02-26 23:21:52');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (64, 64, 64, '2003-10-31 14:31:06', '1986-05-29 01:36:19', '1983-10-28 05:12:18', '1973-05-01 16:17:50');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (65, 65, 65, '2010-01-20 23:51:44', '2007-03-17 15:15:54', '2010-08-31 06:35:58', '1987-07-26 20:11:35');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (66, 66, 66, '1981-08-17 18:52:30', '2002-07-31 08:02:50', '2010-10-21 05:32:23', '2004-09-06 00:53:58');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (67, 67, 67, '1981-06-23 17:59:15', '1995-12-23 17:42:10', '1979-08-28 08:44:44', '2013-03-02 13:32:40');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (68, 68, 68, '1972-08-04 20:37:38', '1985-08-10 20:13:39', '1985-10-12 03:51:14', '2001-12-06 05:12:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (69, 69, 69, '1983-06-18 11:12:10', '1988-01-19 10:52:23', '1979-08-24 13:29:40', '1999-11-14 08:59:18');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (70, 70, 70, '1991-03-13 10:20:10', '2009-03-19 19:21:35', '2014-10-23 06:51:58', '1996-01-24 03:53:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (71, 71, 71, '1996-06-18 05:34:18', '1986-05-25 08:36:37', '2000-07-18 22:48:26', '2001-02-21 22:37:19');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (72, 72, 72, '1977-05-01 02:27:40', '2010-12-17 04:23:39', '2020-11-05 01:04:53', '1974-07-06 06:04:28');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (73, 73, 73, '2008-06-08 05:02:24', '2007-05-21 06:36:34', '1996-06-08 01:22:05', '1973-06-08 10:13:15');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (74, 74, 74, '1976-05-16 16:10:11', '1977-02-21 23:23:47', '2017-08-22 03:57:28', '2004-07-29 19:06:24');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (75, 75, 75, '2017-06-11 08:24:42', '2008-02-14 10:50:45', '1992-06-09 08:44:43', '1980-05-01 14:31:26');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (76, 76, 76, '1997-10-16 05:24:13', '1992-08-08 03:11:43', '2005-10-06 13:39:24', '2016-04-26 18:43:39');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (77, 77, 77, '1989-11-13 16:00:47', '1973-03-18 06:27:59', '2012-01-01 23:04:50', '2008-07-19 11:12:10');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (78, 78, 78, '2020-01-25 17:31:38', '1978-04-30 03:00:52', '1986-07-18 23:36:15', '1998-01-15 23:36:59');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (79, 79, 79, '2017-05-24 01:45:14', '2010-01-29 03:36:15', '1974-08-25 10:19:05', '1972-02-05 00:49:23');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (80, 80, 80, '2011-03-03 12:20:39', '1997-08-20 02:27:40', '2007-06-25 13:47:21', '2020-01-22 17:47:55');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (81, 81, 81, '1995-05-21 03:32:03', '2010-06-17 06:21:53', '1970-03-12 19:11:30', '2013-12-04 12:54:42');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (82, 82, 82, '1990-09-17 01:23:42', '1973-03-23 00:17:52', '1990-02-06 16:28:24', '1986-07-19 12:19:17');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (83, 83, 83, '1983-03-11 04:45:52', '2005-09-23 04:33:32', '2008-10-02 02:28:15', '1996-03-13 15:56:53');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (84, 84, 84, '2004-03-06 21:20:41', '2001-07-22 05:50:46', '2002-01-04 15:38:15', '2003-05-20 08:15:37');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (85, 85, 85, '1987-10-31 14:02:30', '1991-11-05 09:34:31', '1988-10-06 23:55:04', '1983-03-07 03:04:36');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (86, 86, 86, '2016-07-05 18:39:04', '1991-12-01 00:46:15', '1978-12-17 23:45:58', '2003-06-13 19:32:32');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (87, 87, 87, '2012-10-24 07:37:50', '1990-06-06 06:55:18', '2006-05-24 08:08:20', '2003-12-19 23:22:42');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (88, 88, 88, '1986-06-06 23:36:34', '2011-06-08 12:51:08', '1974-12-28 22:52:35', '2013-07-22 00:42:25');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (89, 89, 89, '1995-04-16 06:45:53', '1994-07-14 19:20:51', '2010-12-14 10:47:53', '1974-09-07 19:49:32');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (90, 90, 90, '2010-12-05 20:15:49', '2014-10-05 10:43:53', '1970-09-20 13:56:30', '2016-07-06 21:40:52');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (91, 91, 91, '2015-02-20 01:20:35', '1992-11-15 23:57:00', '2021-02-07 03:40:49', '2014-06-15 13:53:37');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (92, 92, 92, '1977-06-01 18:41:59', '1987-04-02 19:19:46', '1996-06-10 19:16:45', '2007-12-24 00:59:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (93, 93, 93, '2008-11-25 05:40:29', '1990-12-04 18:43:08', '2009-04-19 17:31:41', '2002-03-12 21:08:45');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (94, 94, 94, '1992-03-17 05:52:19', '1976-12-08 07:28:18', '1985-12-09 07:20:10', '1990-06-12 00:50:09');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (95, 95, 95, '2018-06-16 23:44:52', '2006-10-17 08:23:03', '1976-10-24 07:23:13', '1971-01-26 14:04:05');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (96, 96, 96, '1989-01-18 12:50:22', '1989-08-07 19:16:43', '1993-05-18 08:34:04', '1997-07-30 07:17:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (97, 97, 97, '2013-09-12 23:19:37', '1981-12-24 14:19:05', '1987-07-07 12:18:45', '1982-09-09 16:21:11');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (98, 98, 98, '1987-07-06 17:49:22', '1975-05-23 07:07:57', '1973-07-07 09:29:53', '1973-09-15 17:04:03');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (99, 99, 99, '2015-09-19 10:48:03', '1973-06-05 05:42:27', '1988-07-20 18:43:21', '2008-10-26 04:21:25');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (100, 100, 100, '1991-12-13 17:48:25', '1978-07-26 13:55:47', '2003-08-15 12:02:00', '2007-12-07 22:20:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (101, 1, 1, '1970-10-18 09:25:43', '1980-09-17 04:03:13', '2018-08-26 15:15:39', '1973-02-04 07:45:29');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (102, 2, 2, '2007-10-27 17:39:14', '2008-08-07 10:35:30', '2009-01-17 01:02:28', '2003-01-12 12:44:31');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (103, 3, 3, '1995-09-03 06:41:19', '2016-08-22 15:40:26', '2006-02-08 15:40:17', '1986-09-07 00:14:35');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (104, 4, 4, '2015-01-24 09:17:47', '2003-03-05 18:20:00', '2010-01-20 06:51:28', '1975-11-27 04:25:03');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (105, 5, 5, '2012-04-22 14:13:53', '1995-08-20 07:33:33', '2002-08-22 19:25:19', '1992-05-25 08:48:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (106, 6, 6, '1994-05-08 18:05:13', '1989-09-01 19:13:58', '2011-01-06 20:14:27', '1984-01-27 08:53:18');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (107, 7, 7, '2002-10-20 23:21:54', '1979-03-05 15:14:21', '2004-07-13 08:16:26', '2003-02-13 07:57:02');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (108, 8, 8, '1986-03-11 21:02:30', '1973-09-09 22:46:05', '2020-07-04 23:32:14', '1977-03-17 03:37:07');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (109, 9, 9, '1990-03-29 06:01:22', '1995-05-04 23:08:02', '1995-08-06 03:00:21', '2000-02-16 23:54:27');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (110, 10, 10, '2013-04-16 14:42:04', '1973-02-07 11:56:17', '1981-01-26 06:10:21', '2008-08-11 15:53:23');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (111, 11, 11, '1996-06-07 12:59:25', '2013-05-20 11:23:18', '1981-03-08 16:23:00', '1976-04-22 20:48:23');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (112, 12, 12, '2019-04-14 09:19:35', '2006-09-28 13:54:23', '1979-08-05 00:44:37', '2004-05-01 12:29:05');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (113, 13, 13, '2019-05-15 02:34:18', '2003-08-21 23:22:18', '2017-09-07 22:44:53', '1998-10-26 14:36:23');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (114, 14, 14, '2003-03-08 08:09:14', '2002-09-16 14:24:33', '2007-12-28 22:09:09', '2020-12-11 04:13:53');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (115, 15, 15, '2009-06-07 11:06:05', '1995-09-26 19:51:35', '1995-10-08 16:13:34', '2011-07-21 05:29:16');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (116, 16, 16, '2016-01-04 04:26:56', '1974-11-11 15:23:55', '2020-02-04 21:32:55', '1972-06-19 04:00:47');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (117, 17, 17, '1983-09-02 16:01:59', '1994-10-22 03:54:24', '1997-01-20 01:11:04', '1988-07-25 02:14:40');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (118, 18, 18, '1971-08-05 14:00:39', '1970-03-03 00:28:54', '1995-05-09 17:14:10', '2005-04-11 22:14:21');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (119, 19, 19, '2000-05-13 20:33:10', '1971-07-13 17:09:44', '2007-12-29 09:53:18', '2018-09-28 04:30:52');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (120, 20, 20, '1993-11-22 10:56:19', '2004-04-17 23:47:57', '1991-06-29 17:33:33', '2018-09-12 04:43:04');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (121, 21, 21, '1992-12-30 02:27:53', '1973-11-28 02:49:11', '1994-01-03 21:28:52', '1973-10-30 08:07:34');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (122, 22, 22, '2006-04-28 15:06:58', '1992-01-23 23:24:37', '2018-06-21 22:39:36', '2008-06-22 20:10:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (123, 23, 23, '1972-03-15 22:18:02', '1979-06-03 19:22:10', '1992-04-06 05:29:26', '1980-10-28 04:39:46');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (124, 24, 24, '1973-09-21 06:11:12', '1978-07-06 18:26:18', '1980-02-25 17:03:03', '1998-01-02 02:34:41');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (125, 25, 25, '1976-09-25 09:00:52', '1987-12-04 19:34:29', '2008-01-19 21:36:12', '1992-04-03 14:06:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (126, 26, 26, '1972-04-20 00:42:12', '1996-03-29 17:44:55', '1978-02-25 00:51:01', '1999-01-28 15:24:53');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (127, 27, 27, '2003-01-17 14:37:24', '2006-10-25 06:43:42', '1998-01-31 16:44:45', '1993-04-18 09:00:08');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (128, 28, 28, '1996-01-28 20:34:07', '1972-10-06 22:18:34', '1994-04-21 03:25:46', '1982-08-09 03:49:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (129, 29, 29, '1987-11-21 15:08:14', '1989-05-29 16:26:24', '1983-12-11 07:52:58', '1976-03-11 09:09:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (130, 30, 30, '2009-07-30 05:38:55', '2013-01-25 04:28:48', '2015-02-20 02:03:43', '1992-11-06 21:31:55');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (131, 31, 31, '2010-05-30 12:03:38', '2005-06-08 16:25:15', '1996-01-14 04:47:01', '1981-08-12 16:32:20');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (132, 32, 32, '1978-11-03 23:44:25', '1979-09-11 23:53:12', '1991-01-02 05:31:59', '1979-05-08 06:00:26');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (133, 33, 33, '1987-11-17 09:38:49', '1996-03-17 15:52:10', '2012-02-17 16:46:21', '2016-12-25 05:23:08');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (134, 34, 34, '2017-06-27 11:58:31', '1982-07-19 04:29:52', '1992-01-15 05:54:00', '1995-04-08 16:25:35');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (135, 35, 35, '1979-02-01 07:32:21', '1997-07-28 14:27:41', '1998-11-14 11:16:40', '1974-04-01 20:52:40');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (136, 36, 36, '1986-05-05 18:12:42', '2021-03-16 01:50:48', '2014-05-29 01:09:23', '1992-09-07 18:43:51');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (137, 37, 37, '1991-11-10 06:05:11', '1999-08-10 14:13:23', '2000-04-22 09:05:49', '1981-05-08 16:18:32');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (138, 38, 38, '1992-09-11 10:42:29', '2005-11-30 13:36:54', '2014-02-15 20:17:40', '1971-08-03 01:52:08');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (139, 39, 39, '1990-06-30 13:34:48', '2011-05-02 16:50:45', '1977-07-12 22:10:41', '1987-01-07 16:37:27');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (140, 40, 40, '1983-06-11 15:25:22', '2006-12-31 01:26:26', '2005-10-02 05:18:45', '2001-05-16 04:04:25');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (141, 41, 41, '1979-08-18 10:45:36', '1979-09-22 21:05:56', '1991-05-09 13:54:35', '1995-02-23 05:42:04');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (142, 42, 42, '1987-02-23 20:45:31', '2010-12-29 08:23:35', '1996-02-20 06:52:18', '2020-07-24 00:04:58');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (143, 43, 43, '2006-06-26 21:05:07', '1984-04-07 11:15:42', '2009-10-24 15:59:32', '1997-03-07 00:09:07');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (144, 44, 44, '2009-03-27 18:45:07', '1976-06-14 03:11:52', '1971-09-19 10:08:48', '1988-09-14 00:54:14');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (145, 45, 45, '1990-09-04 12:05:11', '2015-01-01 09:21:28', '2008-06-25 05:00:04', '2017-08-05 23:47:29');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (146, 46, 46, '1993-06-20 01:30:01', '2003-05-29 19:48:04', '2004-02-06 18:08:46', '1973-03-29 12:11:01');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (147, 47, 47, '1983-12-15 14:41:45', '1988-10-19 23:35:11', '2020-07-14 21:11:58', '1971-03-23 02:26:23');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (148, 48, 48, '1978-03-15 23:04:28', '2007-07-03 06:59:09', '1988-01-05 19:13:35', '2007-02-27 16:26:54');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (149, 49, 49, '1980-10-01 22:40:47', '1992-03-30 01:12:57', '1988-04-10 01:50:05', '1989-09-27 05:00:00');
INSERT INTO `messages` (`id`, `sender_id`, `reciever_id`, `send_at`, `recieved_at`, `created_at`, `updated_at`) VALUES (150, 50, 50, '1988-05-10 06:38:34', '1993-12-14 00:19:13', '2006-06-26 13:51:50', '1981-09-28 10:38:52');


#
# TABLE STRUCTURE FOR: messages_media
#

DROP TABLE IF EXISTS `messages_media`;

CREATE TABLE `messages_media` (
  `message_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор сообшения',
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор медиа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  KEY `fk_mm_media_id` (`media_id`),
  KEY `fk_mm_message_id` (`message_id`),
  CONSTRAINT `fk_mm_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_mm_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь сообщений и медиа';

INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (1, 1, '1999-04-10 19:29:55', '2015-03-08 06:38:39');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (2, 2, '2011-04-17 12:05:00', '1997-06-08 16:24:44');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (3, 3, '1975-04-22 00:43:23', '2008-11-08 08:12:03');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (4, 4, '2002-06-14 19:28:08', '1994-01-24 10:19:59');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (5, 5, '2015-02-16 00:58:27', '2001-04-30 16:54:17');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (6, 6, '2020-02-08 13:15:26', '1979-10-26 06:38:59');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (7, 7, '2016-05-24 22:50:28', '1994-04-02 21:47:22');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (8, 8, '2014-05-28 18:58:19', '1988-08-17 12:53:54');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (9, 9, '1974-11-12 20:29:33', '1979-08-25 08:24:36');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (10, 10, '1986-01-19 01:29:24', '2002-12-31 18:11:39');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (11, 11, '1984-08-28 21:45:43', '1974-08-22 01:35:51');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (12, 12, '1985-03-12 01:38:44', '2014-08-09 07:20:24');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (13, 13, '1999-11-01 20:31:57', '2012-12-22 22:04:43');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (14, 14, '1981-11-13 13:52:35', '2017-05-11 00:59:56');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (15, 15, '2005-09-13 20:51:33', '1983-06-23 05:45:01');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (16, 16, '1987-08-28 18:34:41', '1973-05-27 07:19:43');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (17, 17, '2004-01-21 13:11:17', '2008-01-06 22:42:45');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (18, 18, '2014-10-09 08:57:48', '2004-07-02 09:48:26');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (19, 19, '1975-05-16 21:46:18', '1979-05-17 03:30:00');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (20, 20, '1990-03-28 10:52:08', '1973-01-29 17:50:52');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (21, 21, '1973-04-12 14:08:01', '1974-10-19 14:29:25');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (22, 22, '2000-09-02 14:28:01', '1980-04-07 17:37:15');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (23, 23, '2015-05-02 21:26:34', '2005-12-16 21:46:53');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (24, 24, '2015-01-01 23:58:36', '1972-03-06 06:54:09');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (25, 25, '2016-10-01 18:54:25', '1980-03-17 21:46:51');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (26, 26, '2001-12-20 01:10:21', '2018-02-22 12:33:38');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (27, 27, '2003-07-28 19:27:14', '1973-05-01 20:52:14');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (28, 28, '2003-09-13 18:05:56', '1976-03-09 12:07:25');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (29, 29, '1977-07-14 07:11:25', '2013-06-10 13:30:28');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (30, 30, '1990-12-03 21:36:29', '1985-10-14 12:55:37');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (31, 31, '2017-05-05 22:55:19', '1976-11-07 08:00:52');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (32, 32, '2003-07-10 19:19:20', '1988-10-25 18:13:36');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (33, 33, '1987-05-05 23:32:54', '1994-09-18 09:14:02');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (34, 34, '1975-05-22 03:28:09', '1980-11-25 04:45:08');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (35, 35, '1993-01-18 18:26:37', '2001-10-04 15:05:23');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (36, 36, '1982-12-19 20:08:29', '1989-07-12 03:30:21');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (37, 37, '1985-10-12 05:24:39', '1977-07-08 18:25:51');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (38, 38, '1994-09-25 20:43:35', '1990-01-29 10:07:57');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (39, 39, '1986-09-18 00:01:17', '2011-04-20 04:54:15');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (40, 40, '2011-12-23 06:58:58', '2004-01-07 06:27:15');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (41, 41, '2012-05-31 18:28:42', '1985-01-03 05:23:18');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (42, 42, '1982-06-07 08:46:09', '1985-10-25 09:48:52');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (43, 43, '2019-04-17 03:18:10', '2013-12-23 02:12:03');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (44, 44, '1994-12-27 20:04:26', '2008-06-13 04:54:54');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (45, 45, '1976-05-15 07:03:42', '2020-03-10 01:24:09');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (46, 46, '1971-12-19 18:55:17', '2009-09-03 18:04:35');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (47, 47, '1998-05-01 16:37:44', '1980-01-15 02:50:28');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (48, 48, '1998-09-14 04:31:14', '2012-10-27 15:29:58');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (49, 49, '2019-01-03 09:23:56', '2012-05-06 03:27:50');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (50, 50, '1971-11-14 15:07:27', '2008-01-15 15:32:32');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (51, 51, '1991-10-27 12:31:33', '1974-08-11 23:09:40');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (52, 52, '1993-12-17 15:48:12', '1973-04-30 16:19:10');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (53, 53, '2010-10-15 00:10:20', '1999-06-20 10:56:21');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (54, 54, '1995-08-05 10:19:40', '2002-06-26 06:21:37');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (55, 55, '2006-03-02 02:01:44', '2014-10-05 15:40:55');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (56, 56, '2016-09-09 04:11:36', '2011-02-20 23:45:11');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (57, 57, '2011-01-12 17:35:06', '1985-03-17 17:17:22');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (58, 58, '1979-11-09 03:48:33', '1987-07-13 02:45:40');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (59, 59, '2012-04-07 12:37:52', '2019-05-12 20:20:43');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (60, 60, '1983-12-01 11:00:18', '1978-08-02 10:39:10');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (61, 61, '1976-04-01 23:11:04', '2003-05-18 00:13:42');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (62, 62, '1986-12-24 11:33:47', '2004-05-28 12:52:30');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (63, 63, '2010-08-22 14:02:12', '1989-11-29 11:59:27');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (64, 64, '1972-05-26 14:08:44', '2017-08-17 23:14:36');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (65, 65, '2004-06-23 10:56:20', '2017-04-23 04:03:34');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (66, 66, '2014-04-20 00:37:29', '2003-09-10 14:52:56');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (67, 67, '2011-11-23 23:17:14', '1977-08-03 10:43:38');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (68, 68, '2007-05-11 16:41:55', '1991-08-27 12:48:11');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (69, 69, '1988-09-23 12:25:00', '1985-02-12 15:18:25');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (70, 70, '1989-11-24 05:04:54', '2018-11-16 08:29:25');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (71, 71, '1996-08-28 05:21:24', '1978-03-17 07:54:25');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (72, 72, '1972-08-18 22:09:51', '1996-11-26 00:38:13');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (73, 73, '1977-09-09 13:13:48', '1973-02-17 04:21:24');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (74, 74, '1999-06-02 02:37:46', '1983-01-29 00:59:31');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (75, 75, '2006-04-12 23:02:30', '2001-08-20 22:50:42');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (76, 76, '2009-03-08 04:59:25', '2021-04-16 17:52:59');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (77, 77, '1977-10-04 15:58:51', '1995-02-09 05:46:32');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (78, 78, '1991-09-16 06:28:10', '2004-04-27 21:42:43');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (79, 79, '2002-07-27 07:50:24', '2018-03-15 19:21:58');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (80, 80, '2008-05-24 05:45:46', '1989-03-22 11:10:33');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (81, 81, '1978-05-29 15:32:40', '1983-04-05 21:41:57');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (82, 82, '2019-08-16 19:07:53', '2016-04-13 16:23:04');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (83, 83, '1979-02-13 05:13:57', '1986-09-23 17:14:29');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (84, 84, '2015-12-21 07:11:46', '1974-07-13 16:51:31');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (85, 85, '1998-11-08 04:41:24', '1981-01-11 17:04:39');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (86, 86, '2004-10-25 21:24:40', '1982-07-10 10:39:05');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (87, 87, '1976-10-31 19:01:53', '2016-08-08 20:58:31');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (88, 88, '2015-01-14 23:31:14', '1971-04-15 13:33:01');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (89, 89, '2016-02-01 04:11:55', '1983-07-25 23:06:23');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (90, 90, '1975-03-09 00:37:21', '1989-05-15 14:06:12');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (91, 91, '2013-01-24 07:52:51', '1979-07-04 05:13:31');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (92, 92, '1981-07-28 02:10:08', '2001-09-23 03:16:04');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (93, 93, '1987-01-28 02:23:25', '1998-09-11 17:45:55');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (94, 94, '1988-06-21 06:36:34', '1981-05-21 14:11:41');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (95, 95, '2017-12-17 12:37:23', '1978-10-20 17:11:36');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (96, 96, '1988-03-30 17:51:11', '2013-05-01 15:38:09');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (97, 97, '1994-06-15 17:15:25', '2018-01-16 03:58:04');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (98, 98, '2004-01-02 20:42:06', '1988-09-13 16:30:52');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (99, 99, '2008-09-06 19:57:09', '1978-07-13 19:58:01');
INSERT INTO `messages_media` (`message_id`, `media_id`, `created_at`, `updated_at`) VALUES (100, 100, '1976-08-08 11:46:19', '1993-04-15 19:42:07');


#
# TABLE STRUCTURE FOR: posts
#

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на идентификатор пользователя который опубликовал пост',
  `community_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на дентификатор пользователя который опубликовал пост',
  `post_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Текст произвольной длины',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время публикации поста',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_post_user_id` (`user_id`),
  KEY `fk_post_community_id` (`community_id`),
  CONSTRAINT `fk_post_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_post_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Посты пользователей и групп';

INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, '1996-01-21 00:13:53', '1996-09-11 12:24:44');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (2, 2, 2, NULL, '1987-11-15 18:07:04', '1973-10-01 18:41:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (3, 3, 3, NULL, '1979-09-29 04:56:26', '1982-02-26 04:01:34');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (4, 4, 4, NULL, '2011-02-17 20:58:01', '1987-05-05 13:59:39');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (5, 5, 5, NULL, '2002-11-01 15:43:04', '2015-11-26 21:30:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (6, 6, 6, NULL, '1972-12-23 13:54:02', '2013-07-27 20:20:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (7, 7, 7, NULL, '2008-02-15 03:17:00', '2021-06-13 00:44:53');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (8, 8, 8, NULL, '1994-12-12 17:46:56', '2015-06-25 05:23:23');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (9, 9, 9, NULL, '1985-03-21 11:10:58', '1992-06-12 01:36:44');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (10, 10, 10, NULL, '1983-09-26 21:45:25', '2010-07-17 06:53:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (11, 11, 11, NULL, '1981-04-30 18:36:56', '2013-08-06 19:00:05');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (12, 12, 12, NULL, '1983-07-19 03:32:21', '1993-01-01 02:29:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (13, 13, 13, NULL, '1989-01-15 17:26:21', '2017-03-20 15:21:35');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (14, 14, 14, NULL, '1990-08-08 20:44:43', '1983-12-19 03:59:30');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (15, 15, 15, NULL, '1994-05-27 11:07:53', '1979-07-11 06:02:28');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (16, 16, 16, NULL, '1988-06-17 06:01:23', '1986-04-12 17:50:34');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (17, 17, 17, NULL, '1975-04-30 10:43:22', '1999-01-15 15:32:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (18, 18, 18, NULL, '2014-09-13 04:10:10', '2008-12-03 11:31:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (19, 19, 19, NULL, '2010-05-09 12:40:04', '1992-11-22 21:27:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (20, 20, 20, NULL, '2016-09-16 15:42:55', '1975-04-26 08:11:39');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (21, 21, 1, NULL, '1971-05-17 11:10:23', '1983-04-30 09:54:10');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (22, 22, 2, NULL, '1973-06-21 17:28:10', '2000-02-26 09:02:42');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (23, 23, 3, NULL, '1977-12-16 13:13:47', '1982-03-08 07:54:18');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (24, 24, 4, NULL, '1992-10-19 09:56:47', '2021-01-20 01:32:59');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (25, 25, 5, NULL, '1996-01-07 11:20:52', '2008-12-31 04:08:31');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (26, 26, 6, NULL, '2020-07-17 08:41:05', '1972-09-28 20:09:13');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (27, 27, 7, NULL, '1983-01-05 19:31:22', '2013-04-01 17:24:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (28, 28, 8, NULL, '1980-01-22 18:49:01', '1988-07-17 15:48:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (29, 29, 9, NULL, '1991-06-30 16:26:09', '1984-03-27 05:03:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (30, 30, 10, NULL, '1998-03-17 17:39:12', '1974-10-27 14:01:33');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (31, 31, 11, NULL, '2016-01-03 04:11:53', '2000-06-01 08:28:42');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (32, 32, 12, NULL, '1995-09-16 11:00:42', '1976-10-09 13:37:45');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (33, 33, 13, NULL, '1990-08-24 12:02:43', '1979-02-10 23:17:04');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (34, 34, 14, NULL, '2003-10-14 22:21:56', '1973-11-29 15:55:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (35, 35, 15, NULL, '2018-06-12 21:31:46', '1978-02-01 06:39:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (36, 36, 16, NULL, '1971-04-22 13:09:41', '1973-07-26 06:33:23');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (37, 37, 17, NULL, '2012-07-28 23:57:20', '1989-02-19 16:32:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (38, 38, 18, NULL, '1987-10-11 22:22:27', '2016-10-04 17:50:53');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (39, 39, 19, NULL, '1981-07-30 06:52:15', '1981-11-22 11:36:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (40, 40, 20, NULL, '2009-10-31 03:35:27', '1983-02-16 23:01:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (41, 41, 1, NULL, '2019-02-03 18:30:32', '1978-09-22 07:22:04');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (42, 42, 2, NULL, '1978-10-06 04:20:59', '2007-11-05 14:45:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (43, 43, 3, NULL, '2002-12-20 02:41:25', '2002-05-28 11:56:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (44, 44, 4, NULL, '2010-05-31 20:56:39', '2009-07-23 16:57:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (45, 45, 5, NULL, '2014-01-28 17:15:59', '1976-10-07 08:34:45');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (46, 46, 6, NULL, '2002-08-10 17:15:48', '2007-11-02 18:17:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (47, 47, 7, NULL, '1981-05-15 18:59:54', '2001-08-24 16:24:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (48, 48, 8, NULL, '1970-08-18 13:06:15', '2011-06-02 06:04:40');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (49, 49, 9, NULL, '2001-10-12 07:03:01', '2000-08-27 21:34:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (50, 50, 10, NULL, '1995-03-25 03:34:01', '1993-05-04 22:50:53');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (51, 51, 11, NULL, '2013-10-29 07:23:51', '2017-04-30 13:27:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (52, 52, 12, NULL, '1984-04-10 14:12:30', '1996-06-05 06:51:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (53, 53, 13, NULL, '1982-08-30 17:17:39', '2007-04-29 08:54:52');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (54, 54, 14, NULL, '2020-04-24 17:18:07', '1977-02-11 06:47:27');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (55, 55, 15, NULL, '2021-06-21 20:20:02', '2006-08-16 16:19:23');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (56, 56, 16, NULL, '2012-08-20 05:17:16', '1974-09-25 09:01:00');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (57, 57, 17, NULL, '2002-12-20 06:11:22', '2001-11-16 10:33:07');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (58, 58, 18, NULL, '1973-05-01 22:05:42', '1975-07-21 11:47:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (59, 59, 19, NULL, '2011-05-07 21:45:44', '2008-01-19 10:20:12');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (60, 60, 20, NULL, '2011-01-16 02:41:28', '2018-11-07 16:53:36');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (61, 61, 1, NULL, '2011-10-04 07:05:00', '2020-10-09 15:34:05');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (62, 62, 2, NULL, '1972-11-20 08:14:21', '1974-05-19 12:48:16');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (63, 63, 3, NULL, '1997-03-20 12:04:36', '1971-12-11 09:24:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (64, 64, 4, NULL, '1989-12-16 03:13:34', '2003-09-26 05:22:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (65, 65, 5, NULL, '2011-04-08 04:10:44', '2006-10-27 10:53:30');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (66, 66, 6, NULL, '1995-12-25 15:17:06', '2014-08-29 07:17:57');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (67, 67, 7, NULL, '1997-12-10 15:22:02', '1978-01-25 22:47:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (68, 68, 8, NULL, '2016-02-24 06:57:48', '2020-09-05 02:12:51');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (69, 69, 9, NULL, '1970-11-29 22:33:56', '1993-03-03 20:02:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (70, 70, 10, NULL, '1976-06-16 10:22:03', '2009-05-01 08:58:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (71, 71, 11, NULL, '2013-08-26 14:31:32', '2010-07-22 06:41:11');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (72, 72, 12, NULL, '2013-04-14 10:14:32', '2011-09-01 06:19:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (73, 73, 13, NULL, '1970-09-11 18:13:46', '1972-03-25 10:26:36');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (74, 74, 14, NULL, '2010-05-09 20:53:24', '1997-06-21 02:17:16');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (75, 75, 15, NULL, '1980-12-04 10:17:24', '1989-03-15 08:27:41');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (76, 76, 16, NULL, '1979-06-05 23:25:59', '1990-01-22 07:52:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (77, 77, 17, NULL, '1997-05-06 17:51:43', '1970-09-02 06:19:11');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (78, 78, 18, NULL, '1979-01-15 00:54:58', '2002-02-10 07:42:45');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (79, 79, 19, NULL, '2008-07-29 06:39:39', '1976-02-18 00:05:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (80, 80, 20, NULL, '1996-05-01 12:33:02', '1999-03-30 00:23:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (81, 81, 1, NULL, '1994-03-05 09:41:47', '1989-10-14 06:29:25');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (82, 82, 2, NULL, '1999-12-11 16:00:57', '2011-04-28 13:57:29');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (83, 83, 3, NULL, '1975-09-14 11:44:16', '1972-06-13 21:21:25');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (84, 84, 4, NULL, '1990-03-23 01:41:04', '2013-03-24 00:28:11');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (85, 85, 5, NULL, '2010-03-12 15:27:06', '1989-05-28 00:45:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (86, 86, 6, NULL, '1972-09-02 06:30:30', '2007-07-17 12:42:51');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (87, 87, 7, NULL, '1974-07-01 17:55:57', '2007-06-16 11:43:35');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (88, 88, 8, NULL, '2004-07-25 14:31:15', '1999-07-13 22:29:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (89, 89, 9, NULL, '1982-02-05 11:49:58', '1997-09-13 06:19:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (90, 90, 10, NULL, '1986-01-14 04:36:21', '2012-04-03 08:50:51');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (91, 91, 11, NULL, '1974-11-19 08:01:47', '1984-09-07 21:32:29');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (92, 92, 12, NULL, '1981-05-03 05:16:17', '1991-03-15 03:54:15');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (93, 93, 13, NULL, '1995-07-21 18:25:17', '1991-12-24 22:12:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (94, 94, 14, NULL, '2000-08-07 21:31:33', '1989-04-06 16:19:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (95, 95, 15, NULL, '2021-05-01 02:10:24', '2004-08-07 15:19:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (96, 96, 16, NULL, '1976-06-22 03:17:32', '2006-10-12 04:39:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (97, 97, 17, NULL, '2005-02-10 21:52:34', '2000-01-13 14:55:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (98, 98, 18, NULL, '1974-08-30 02:00:54', '1998-03-06 08:38:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (99, 99, 19, NULL, '1971-05-13 12:25:58', '1990-06-05 01:06:52');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `post_content`, `created_at`, `updated_at`) VALUES (100, 100, 20, NULL, '1977-06-14 03:36:53', '1995-12-13 14:16:02');


#
# TABLE STRUCTURE FOR: posts_media
#

DROP TABLE IF EXISTS `posts_media`;

CREATE TABLE `posts_media` (
  `post_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор поста',
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор медиа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`post_id`,`media_id`),
  KEY `fk_pm_media_id` (`media_id`),
  CONSTRAINT `fk_pm_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_pm_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь постов и медиа';

INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (1, 1, '2015-09-28 07:51:31', '1972-11-20 12:11:02');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (2, 2, '2019-01-18 21:57:06', '1975-09-15 22:41:54');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (3, 3, '1981-06-22 20:27:26', '1978-04-26 02:15:29');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (4, 4, '1973-05-03 08:45:24', '1994-08-08 04:32:44');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (5, 5, '1976-02-29 13:35:56', '2013-05-08 14:57:10');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (6, 6, '1992-08-01 10:50:06', '1975-12-28 08:45:12');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (7, 7, '2015-11-09 16:53:40', '2011-03-25 04:51:04');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (8, 8, '1985-07-27 19:27:08', '2003-04-28 03:48:29');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (9, 9, '1989-04-02 03:38:10', '2011-12-26 13:58:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (10, 10, '2011-01-26 21:27:37', '1998-11-06 12:14:46');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (11, 11, '2019-11-09 15:34:49', '2002-11-04 23:00:36');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (12, 12, '2016-08-30 19:32:21', '1977-01-17 09:46:52');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (13, 13, '2000-01-01 11:12:36', '1984-02-06 13:31:59');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (14, 14, '1972-12-01 10:02:56', '2009-10-13 19:08:32');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (15, 15, '1982-06-06 22:20:58', '1973-04-03 09:16:33');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (16, 16, '1996-03-10 16:28:45', '1992-12-24 03:37:01');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (17, 17, '2008-04-08 06:57:43', '1983-08-30 05:20:21');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (18, 18, '1974-04-28 05:03:44', '2008-10-21 12:48:23');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (19, 19, '1998-02-26 17:59:02', '1980-11-14 20:14:05');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (20, 20, '1978-04-16 08:47:47', '2019-10-29 08:31:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (21, 21, '1976-01-23 18:23:51', '1971-07-23 02:13:54');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (22, 22, '1999-06-23 18:51:28', '2002-03-21 14:39:33');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (23, 23, '2018-08-05 16:54:52', '1996-01-05 09:31:44');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (24, 24, '1995-02-05 08:59:29', '1983-08-31 19:30:21');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (25, 25, '1987-11-18 20:36:24', '2006-07-25 18:18:59');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (26, 26, '1970-04-14 22:15:34', '2009-05-09 21:56:23');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (27, 27, '1993-03-12 12:41:23', '2012-12-30 12:09:12');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (28, 28, '2012-11-08 12:17:04', '2003-04-28 06:55:05');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (29, 29, '1972-07-06 13:29:22', '1993-01-08 21:33:12');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (30, 30, '1980-10-09 12:07:28', '1981-11-25 12:57:05');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (31, 31, '2002-11-29 13:09:01', '2010-04-10 23:12:33');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (32, 32, '2020-11-08 15:27:29', '1971-08-06 07:14:30');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (33, 33, '2011-10-03 13:15:25', '2003-04-28 14:09:46');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (34, 34, '1990-09-03 06:06:07', '1996-10-25 00:42:54');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (35, 35, '2009-09-13 21:11:23', '1987-03-16 14:46:49');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (36, 36, '1987-09-18 11:19:11', '1987-03-16 13:21:52');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (37, 37, '1986-10-07 14:08:23', '2013-12-20 19:36:22');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (38, 38, '1997-08-14 03:17:00', '2008-01-13 08:38:52');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (39, 39, '1980-09-03 17:44:20', '1973-11-05 04:06:44');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (40, 40, '2001-07-20 11:28:19', '1983-01-19 19:54:43');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (41, 41, '2005-07-13 02:05:09', '1993-06-07 12:52:18');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (42, 42, '2017-05-27 22:30:11', '2004-01-23 08:05:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (43, 43, '1992-07-24 09:45:40', '1994-07-31 13:08:14');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (44, 44, '1999-12-04 19:57:16', '1973-03-10 03:27:43');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (45, 45, '1997-03-03 15:05:56', '1988-11-22 06:47:23');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (46, 46, '2016-07-07 05:10:33', '2000-08-09 12:09:17');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (47, 47, '1991-07-08 14:59:33', '2019-05-24 15:55:24');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (48, 48, '1974-08-13 09:26:23', '1994-05-23 15:24:44');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (49, 49, '1971-08-15 05:14:24', '1998-06-06 11:13:59');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (50, 50, '1987-03-03 15:50:01', '2004-02-28 17:38:48');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (51, 51, '1988-09-21 13:22:15', '1970-05-18 21:25:48');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (52, 52, '1975-11-12 16:36:27', '1977-08-27 22:17:41');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (53, 53, '1981-10-27 05:12:45', '2004-03-16 22:43:55');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (54, 54, '2012-01-14 04:06:11', '1982-12-08 01:06:31');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (55, 55, '1985-07-01 16:19:16', '2018-09-28 01:16:20');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (56, 56, '1996-11-26 03:48:24', '1976-08-07 18:35:33');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (57, 57, '2001-05-14 07:57:01', '1998-09-23 11:33:43');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (58, 58, '1989-09-22 00:52:15', '1987-07-28 06:54:26');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (59, 59, '1989-09-22 06:45:13', '1981-05-20 20:02:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (60, 60, '1998-08-22 08:57:28', '1978-04-13 23:44:37');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (61, 61, '1979-02-11 11:22:29', '1981-08-02 12:04:38');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (62, 62, '2000-04-13 22:06:28', '1989-09-10 19:14:07');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (63, 63, '1970-11-21 11:36:16', '2011-06-07 13:41:17');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (64, 64, '2006-12-17 03:23:32', '2009-06-13 12:41:41');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (65, 65, '1973-04-10 06:14:12', '2005-01-23 18:22:55');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (66, 66, '1993-04-15 11:16:14', '1996-07-27 02:45:07');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (67, 67, '2004-09-11 05:21:09', '1997-08-30 17:15:02');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (68, 68, '2007-10-18 19:26:36', '1972-10-18 15:30:52');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (69, 69, '1974-07-08 07:01:15', '2016-11-27 16:12:21');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (70, 70, '1988-01-15 03:09:39', '1989-04-18 06:25:25');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (71, 71, '1998-04-08 12:00:41', '1993-02-03 08:40:01');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (72, 72, '2000-05-25 20:47:40', '1988-12-25 12:52:58');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (73, 73, '2003-04-21 01:43:30', '1973-10-05 23:46:35');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (74, 74, '2006-11-22 21:59:25', '1996-10-01 08:45:39');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (75, 75, '1999-09-29 17:45:37', '1994-11-15 21:56:21');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (76, 76, '1984-12-11 23:44:11', '1986-02-19 00:12:29');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (77, 77, '1992-05-18 17:34:04', '2007-06-14 20:58:54');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (78, 78, '1980-06-28 05:19:19', '1990-11-09 00:05:08');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (79, 79, '1994-05-31 03:29:02', '2000-02-18 08:15:44');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (80, 80, '1982-08-04 02:29:57', '1984-02-10 02:42:01');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (81, 81, '1990-02-17 00:25:17', '2018-01-26 08:14:46');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (82, 82, '1989-12-05 21:37:17', '2021-05-16 08:47:33');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (83, 83, '1978-03-03 11:45:06', '2002-01-27 13:53:16');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (84, 84, '2008-11-27 14:29:33', '2003-05-26 05:45:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (85, 85, '1991-08-06 14:11:36', '2001-03-14 17:29:51');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (86, 86, '2016-01-31 22:08:30', '1993-03-25 18:08:47');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (87, 87, '2019-09-07 20:38:39', '2002-05-18 00:09:15');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (88, 88, '2018-06-26 09:59:18', '1987-10-02 15:50:31');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (89, 89, '2011-12-31 16:19:21', '2013-11-11 23:14:42');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (90, 90, '2006-08-02 16:45:44', '2016-08-31 10:38:53');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (91, 91, '1986-03-05 21:34:23', '2012-10-12 01:03:09');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (92, 92, '2006-09-22 02:44:53', '2020-02-23 07:01:59');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (93, 93, '1995-04-04 20:01:55', '2013-12-23 06:01:57');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (94, 94, '2004-05-18 06:49:42', '1995-12-02 04:02:11');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (95, 95, '2019-05-04 19:30:49', '2004-03-14 22:05:54');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (96, 96, '1981-05-02 06:30:17', '1989-12-31 01:08:45');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (97, 97, '2007-05-15 08:53:05', '2016-02-06 18:23:31');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (98, 98, '1994-03-19 05:55:35', '1994-08-05 12:39:41');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (99, 99, '2015-04-15 09:05:43', '2011-03-04 21:47:15');
INSERT INTO `posts_media` (`post_id`, `media_id`, `created_at`, `updated_at`) VALUES (100, 100, '1974-09-06 03:16:58', '2019-09-16 11:48:25');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `city` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (1, 1, 'Pedro', 'Daniel', '', '1981-02-21', 'North Eusebiotown', '57970033', '2018-05-03 06:31:13', '2001-01-25 21:02:13');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (2, 2, 'Solon', 'Quigley', '', '1976-02-01', 'North Revaview', '95928803', '2007-12-13 10:54:18', '1991-01-02 00:15:50');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (3, 3, 'Hertha', 'Nolan', '', '1982-01-10', 'West Winston', '66694562', '1972-08-11 02:35:52', '1984-10-26 11:59:11');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (4, 4, 'Kristian', 'Wiza', '', '2010-09-17', 'Whitneyton', '84722', '1998-07-15 01:27:24', '1984-10-26 11:30:34');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (5, 5, 'Hellen', 'Willms', '', '1982-11-29', 'Joneston', '647009', '1974-10-02 18:41:29', '1988-07-17 06:35:38');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (6, 6, 'Philip', 'Weimann', '', '1992-03-22', 'South Aishahaven', '5342232', '1990-01-18 10:34:00', '1988-05-30 14:41:59');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (7, 7, 'Jeromy', 'Fay', '', '1986-10-22', 'Millerview', '167', '2014-04-01 03:25:05', '1987-06-13 13:31:00');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (8, 8, 'Breana', 'Bogan', '', '1981-06-23', 'Wiegandside', '9596', '1997-04-05 23:50:27', '1996-03-24 22:37:13');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (9, 9, 'Timmy', 'Wiza', '', '2015-06-29', 'Ernestofort', '907', '2020-11-28 01:00:36', '2020-05-22 02:38:40');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (10, 10, 'Graham', 'Mueller', '', '2020-04-14', 'South Ruth', '', '1981-11-09 14:45:39', '1982-09-08 05:29:55');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (11, 11, 'Makenna', 'Hettinger', '', '2016-02-07', 'Abshiremouth', '23', '2011-10-24 18:59:44', '1996-09-28 18:46:39');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (12, 12, 'Natalie', 'Little', '', '2003-03-22', 'Hillaryfort', '6307', '2017-04-14 23:11:36', '2020-10-16 11:31:35');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (13, 13, 'Madisyn', 'Wiegand', '', '1978-06-19', 'Hilpertmouth', '148041', '1986-02-10 02:22:15', '1991-05-22 03:26:41');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (14, 14, 'Jasmin', 'Witting', '', '1970-08-14', 'Edmundshire', '15297680', '2000-10-05 13:12:52', '1990-08-28 10:02:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (15, 15, 'Elisa', 'DuBuque', '', '2000-01-24', 'North Dexter', '1161', '2005-07-24 14:18:41', '2016-09-09 07:55:50');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (16, 16, 'Nick', 'Bernier', '', '1976-10-22', 'East Orval', '66828', '2016-10-08 17:06:38', '1970-10-09 03:35:18');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (17, 17, 'Gabriella', 'Murray', '', '1996-11-02', 'Sipesstad', '2035', '1981-07-25 11:53:11', '1986-12-15 06:24:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (18, 18, 'Murray', 'Collier', '', '2005-09-08', 'Lake Stonestad', '2352028', '1999-02-14 14:45:46', '2014-09-05 16:02:51');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (19, 19, 'Isac', 'Baumbach', '', '1973-08-23', 'Dibberttown', '4796', '1998-08-09 19:54:43', '1991-01-13 20:39:06');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (20, 20, 'Augustus', 'Johns', '', '2014-07-22', 'Randymouth', '1327704', '1977-03-31 14:00:08', '1999-10-21 08:42:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (21, 21, 'Jeremie', 'Cremin', '', '2009-02-05', 'New Berniece', '57', '2000-10-29 08:53:31', '2020-09-22 19:57:35');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (22, 22, 'Kenyon', 'Dibbert', '', '1971-08-08', 'Parisianside', '852686', '2001-05-29 18:43:10', '2001-11-13 07:24:03');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (23, 23, 'Nettie', 'Bergstrom', '', '1990-12-13', 'South Beth', '195780426', '1999-12-22 06:35:10', '1987-07-23 22:58:54');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (24, 24, 'Liam', 'Wunsch', '', '1973-10-17', 'West Lydamouth', '2921190', '2009-01-29 19:22:09', '1983-09-09 17:45:57');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (25, 25, 'Jeromy', 'Labadie', '', '1996-04-12', 'West Luebury', '9899', '2012-09-19 20:49:38', '1995-07-22 09:26:02');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (26, 26, 'Julien', 'Quitzon', '', '1989-08-18', 'Rogahnfort', '4962680', '1999-10-11 22:12:55', '2016-02-15 11:02:17');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (27, 27, 'Yessenia', 'Botsford', '', '2015-04-02', 'Cristland', '44098889', '2001-04-16 18:57:51', '2009-11-28 14:08:14');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (28, 28, 'Brent', 'Gottlieb', '', '1995-02-25', 'Ianstad', '6059316', '1978-05-21 14:53:32', '2015-03-31 07:32:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (29, 29, 'Candida', 'Olson', '', '1995-09-27', 'Aftonfurt', '901', '1977-08-13 14:00:25', '2018-03-18 22:58:28');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (30, 30, 'Heloise', 'Zulauf', '', '1986-11-02', 'Kuhicland', '', '2001-12-06 21:08:24', '1994-02-01 10:17:53');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (31, 31, 'Andreanne', 'Pouros', '', '1993-02-11', 'Hillsville', '697', '1978-01-11 10:56:54', '2009-04-16 13:12:52');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (32, 32, 'Eliezer', 'Dickens', '', '1996-06-24', 'Zulaufborough', '45624582', '1987-10-08 11:46:58', '1971-05-01 15:49:52');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (33, 33, 'Alena', 'Corkery', '', '2012-07-12', 'Marquistown', '8143572', '1973-03-20 18:22:32', '2007-02-16 22:30:28');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (34, 34, 'Elliott', 'Jacobson', '', '1985-01-17', 'Zoratown', '198', '1980-07-20 22:26:50', '2018-08-30 20:27:35');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (35, 35, 'Jaunita', 'Turcotte', '', '2009-12-27', 'Mrazberg', '2579787', '1975-01-01 10:11:47', '1986-12-23 18:19:18');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (36, 36, 'Eileen', 'Marvin', '', '1989-12-21', 'Halvorsonbury', '', '1989-05-04 02:05:12', '1972-01-13 13:40:58');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (37, 37, 'Dino', 'Emard', '', '1993-02-09', 'Flatleyport', '7842198', '2020-03-27 11:12:24', '1975-01-01 11:51:12');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (38, 38, 'Griffin', 'Kuphal', '', '1973-09-17', 'Florencioshire', '50971', '1999-12-28 07:19:21', '1981-01-23 13:30:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (39, 39, 'Philip', 'Quigley', '', '1984-02-11', 'West Ottilieberg', '54533246', '2011-10-27 00:09:52', '2016-09-29 16:53:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (40, 40, 'Casper', 'McGlynn', '', '1989-05-15', 'New Rodrickside', '3293181', '1994-09-07 20:16:43', '1985-04-10 23:10:54');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (41, 41, 'Kip', 'Marks', '', '1974-06-30', 'Lake Van', '458106137', '1993-09-14 10:19:15', '1998-11-27 12:43:56');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (42, 42, 'Jeremy', 'Greenholt', '', '1970-09-07', 'West Shannychester', '81', '1971-04-01 17:14:49', '1999-09-25 04:52:10');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (43, 43, 'Myrtie', 'Terry', '', '1971-07-29', 'Langmouth', '75951', '1999-10-02 15:40:30', '1986-10-09 18:28:19');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (44, 44, 'Mozelle', 'Cronin', '', '1990-12-19', 'Moenmouth', '39941', '2010-03-19 10:06:14', '1972-04-15 23:26:51');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (45, 45, 'Colt', 'Auer', '', '1993-02-17', 'South Paige', '646043', '1973-11-05 18:45:10', '1997-05-29 05:26:52');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (46, 46, 'Tony', 'Collins', '', '1996-08-08', 'New Lawrenceberg', '2', '2005-08-21 00:22:59', '2009-01-12 03:46:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (47, 47, 'Skyla', 'Orn', '', '2005-01-11', 'New Baileeside', '18', '2005-05-06 18:23:38', '1991-01-27 19:49:04');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (48, 48, 'Everardo', 'Runte', '', '1981-11-19', 'Trompmouth', '4078470', '1972-03-28 11:17:43', '2001-05-17 11:16:26');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (49, 49, 'Sean', 'Gottlieb', '', '2018-03-02', 'North Felipe', '', '1994-02-06 15:46:07', '2020-10-30 01:16:29');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (50, 50, 'Salvatore', 'Torphy', '', '2019-05-10', 'Lake Athena', '28', '1993-10-20 04:41:59', '1988-12-23 05:38:58');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (51, 51, 'Napoleon', 'Osinski', '', '2013-04-16', 'Rippinhaven', '476595', '1991-01-04 19:51:34', '2003-10-02 07:15:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (52, 52, 'Noemie', 'Johnston', '', '1986-10-21', 'West Dominicburgh', '57', '2015-09-28 15:28:27', '2004-08-27 01:04:16');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (53, 53, 'Dewayne', 'Bahringer', '', '2006-02-01', 'West Junius', '824485138', '2019-07-30 03:02:05', '1998-01-15 18:49:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (54, 54, 'Riley', 'Abshire', '', '1990-04-21', 'Strackechester', '', '1985-06-05 04:53:36', '1972-06-18 16:32:18');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (55, 55, 'Lavinia', 'Lynch', '', '1994-11-03', 'Santaborough', '8006', '2019-05-30 00:03:16', '1979-10-16 01:39:40');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (56, 56, 'Gerardo', 'Nader', '', '1989-05-06', 'Lake Jefferey', '64069053', '1986-08-20 17:52:51', '1999-05-27 17:45:57');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (57, 57, 'Name', 'Lemke', '', '1992-03-30', 'Port Alexanne', '2', '1993-08-30 17:50:49', '2015-01-16 15:05:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (58, 58, 'Maryse', 'Feeney', '', '1988-08-06', 'North Arjunstad', '4704', '2017-07-16 04:29:28', '1998-08-14 08:10:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (59, 59, 'Breanne', 'Breitenberg', '', '2017-02-23', 'O\'Reillyburgh', '1242', '1990-09-15 14:13:10', '1970-06-13 16:51:17');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (60, 60, 'Urban', 'Boyle', '', '2004-10-25', 'West Christa', '5037', '2000-09-30 09:28:53', '1973-06-19 11:53:43');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (61, 61, 'Rocky', 'Mitchell', '', '1976-08-01', 'Brodyburgh', '468735', '1976-09-01 06:11:38', '1979-05-15 15:39:58');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (62, 62, 'Nelda', 'Kunze', '', '1982-05-11', 'Port Eloychester', '98654', '1992-01-11 19:37:25', '1990-03-07 03:23:37');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (63, 63, 'Fanny', 'Halvorson', '', '1976-09-25', 'Houstonmouth', '5378025', '1998-04-28 14:07:54', '2020-08-21 08:34:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (64, 64, 'Brielle', 'Schaden', '', '1972-12-14', 'Adelltown', '8861', '1999-08-21 18:41:16', '1992-06-06 23:11:42');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (65, 65, 'Mayra', 'Champlin', '', '2019-09-19', 'East Emmaland', '64138082', '1981-07-13 13:28:54', '1979-04-06 19:39:12');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (66, 66, 'Meggie', 'Sipes', '', '1979-01-05', 'South Kaleyberg', '9995', '1997-08-10 01:52:10', '2011-08-24 03:16:59');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (67, 67, 'Carlotta', 'Hartmann', '', '1989-09-16', 'West Elyse', '8', '1993-04-09 12:10:52', '1994-08-03 20:19:45');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (68, 68, 'Irwin', 'Stanton', '', '1996-08-12', 'Stokesberg', '51526066', '2000-11-18 02:17:08', '2003-05-13 01:04:41');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (69, 69, 'Kendrick', 'Waelchi', '', '1982-04-04', 'Tonytown', '755', '1982-03-03 12:41:02', '1996-09-19 03:41:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (70, 70, 'Jeramie', 'Gleason', '', '2004-10-04', 'Morissetteberg', '3', '1995-03-24 12:09:47', '1997-05-19 08:48:41');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (71, 71, 'Roxanne', 'Padberg', '', '2016-05-06', 'North Jasper', '', '2004-10-17 20:13:38', '2013-09-30 12:31:55');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (72, 72, 'Arlie', 'Grady', '', '1991-08-13', 'Bayleeview', '8715', '2015-12-28 01:14:35', '1979-10-11 11:38:39');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (73, 73, 'Ruth', 'Christiansen', '', '2004-10-30', 'East Eulah', '51', '1974-10-24 15:24:42', '2009-01-31 09:38:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (74, 74, 'Samir', 'Schroeder', '', '2002-05-18', 'Klingfort', '697', '2013-06-15 20:10:20', '1970-07-30 12:04:58');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (75, 75, 'Xander', 'Franecki', '', '2001-02-02', 'North Athena', '14172', '1994-06-22 19:15:14', '2015-03-06 04:33:37');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (76, 76, 'Lora', 'Lehner', '', '2014-02-09', 'Lake Lelah', '28423145', '1985-11-02 19:01:04', '2012-11-19 10:57:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (77, 77, 'Alyce', 'Marquardt', '', '2001-06-17', 'Linaland', '597', '2002-09-26 12:22:56', '1983-07-19 20:27:50');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (78, 78, 'Bernardo', 'Ryan', '', '1994-02-22', 'Bradtkemouth', '6876', '2009-01-07 21:42:12', '1977-09-10 15:25:47');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (79, 79, 'Stanley', 'White', '', '2012-05-29', 'New Dellfort', '92', '1982-04-13 08:58:22', '2014-11-30 07:54:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (80, 80, 'Werner', 'Lemke', '', '2012-05-26', 'Averyton', '828642443', '1980-09-11 23:37:59', '1994-09-16 12:19:09');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (81, 81, 'Gavin', 'Lueilwitz', '', '2010-11-05', 'East Floyd', '151', '1985-08-19 20:07:51', '2008-02-22 04:52:58');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (82, 82, 'Philip', 'Russel', '', '1985-08-31', 'North Jaqueline', '2', '2001-12-17 02:38:28', '1979-06-21 11:20:41');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (83, 83, 'Susanna', 'McCullough', '', '1974-04-24', 'Hesselmouth', '5959687', '1983-08-15 22:52:47', '2009-06-03 20:43:04');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (84, 84, 'Alyson', 'Kuhic', '', '1981-09-12', 'New Burdette', '6283', '1975-11-20 03:11:09', '1983-10-16 00:02:48');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (85, 85, 'Thurman', 'Langworth', '', '1979-06-15', 'Ozellaville', '14', '2001-02-13 03:12:57', '2016-09-25 15:56:17');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (86, 86, 'Gay', 'Ruecker', '', '1980-05-15', 'Eltonton', '9', '1992-10-10 19:51:12', '1973-11-26 07:09:30');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (87, 87, 'Breanne', 'Mertz', '', '2011-12-10', 'Wittingview', '24', '1975-12-22 06:20:19', '2014-07-05 05:38:31');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (88, 88, 'Pearlie', 'Cummings', '', '1997-03-15', 'Jerdetown', '379064296', '2001-11-25 20:25:31', '1988-11-16 11:12:13');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (89, 89, 'Viva', 'Weimann', '', '1972-01-19', 'Greenton', '41', '2017-04-14 20:45:01', '1993-03-04 13:52:42');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (90, 90, 'Alene', 'Reichert', '', '2017-11-18', 'Eberttown', '', '1985-06-27 20:15:35', '1971-10-16 22:32:39');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (91, 91, 'Maximus', 'Runolfsson', '', '2000-07-31', 'Fredmouth', '3971198', '1995-06-02 21:28:19', '1974-05-13 14:39:11');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (92, 92, 'Lisette', 'Cruickshank', '', '1972-01-03', 'Yundtborough', '71639201', '2000-11-08 17:33:03', '1971-04-09 18:33:50');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (93, 93, 'Abagail', 'Bernhard', '', '1995-09-04', 'Ramonville', '5', '1999-06-01 21:24:45', '1981-04-25 14:44:53');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (94, 94, 'Abbie', 'Schimmel', '', '2011-05-26', 'West Darrin', '', '1990-07-15 11:37:39', '2015-09-22 01:13:05');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (95, 95, 'Icie', 'Boyer', '', '1977-08-07', 'South Aida', '399', '1990-04-03 04:18:02', '1979-11-10 19:07:25');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (96, 96, 'Tatyana', 'Lind', '', '2011-10-10', 'Babystad', '3', '1993-03-05 08:22:48', '2019-05-13 12:13:11');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (97, 97, 'Kaylin', 'Cormier', '', '1997-09-05', 'Franeckifort', '4066661', '1990-12-24 23:07:57', '1990-06-07 07:23:04');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (98, 98, 'Eliseo', 'Lockman', '', '1991-01-17', 'South Herminiobury', '763662', '2017-08-12 02:51:43', '2005-04-02 17:44:51');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (99, 99, 'Della', 'Murphy', '', '1989-01-09', 'New Vadastad', '632', '1992-07-22 00:01:38', '1998-09-13 15:40:38');
INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (100, 100, 'Lavonne', 'Schuster', '', '1998-01-19', 'New Florine', '', '1976-07-29 11:31:35', '1994-11-06 17:31:49');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 'phyllis72@example.net', '180.279.7701x761', '1972-01-04 14:04:16', '1997-05-01 20:09:58');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (2, 'runolfsdottir.marshall@example.com', '272.374.1531', '1980-12-05 04:17:50', '2011-02-17 22:24:41');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (3, 'kunze.issac@example.org', '+79(0)0111111706', '2008-06-22 22:12:57', '1984-11-18 21:43:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (4, 'ehowe@example.org', '(515)867-9149', '2021-03-26 23:10:01', '1996-08-26 00:34:38');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (5, 'zulauf.kelsi@example.net', '1-014-003-2015x62938', '2005-09-24 04:24:49', '1989-01-15 20:41:54');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (6, 'cora.shields@example.com', '1-866-134-3086', '1989-03-11 14:51:37', '2007-08-15 05:39:13');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (7, 'fletcher62@example.net', '1-859-596-5644', '1974-02-06 18:20:52', '2016-08-03 23:54:25');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (8, 'dayton40@example.net', '1-312-025-2142', '1984-09-19 12:41:44', '1970-06-21 17:20:12');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (9, 'vandervort.heather@example.org', '1-915-337-1095x6635', '1970-07-23 13:13:59', '1977-02-14 23:14:36');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (10, 'grady.marlee@example.com', '+03(4)8123304280', '1978-10-23 16:20:46', '2007-01-29 09:54:59');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (11, 'deja.schimmel@example.com', '853-212-7849x456', '1991-08-23 20:08:45', '1985-05-17 09:30:14');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (12, 'pkemmer@example.org', '(020)568-7362x82284', '1979-10-17 21:27:08', '2011-09-29 18:27:03');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (13, 'joan.herman@example.com', '(617)809-7371', '2015-05-13 06:50:31', '1997-10-04 14:27:08');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (14, 'raheem.hudson@example.net', '1-104-183-3965', '1991-10-21 02:45:01', '1988-04-06 15:23:06');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (15, 'fred.weimann@example.net', '649.302.4673', '1973-05-06 02:29:32', '2005-10-30 17:36:45');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (16, 'emerson08@example.net', '(586)868-9686', '1983-08-16 09:21:39', '1974-08-17 21:45:09');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (17, 'johnathon32@example.com', '(510)382-7227x818', '1974-10-04 21:47:07', '1970-03-15 00:21:23');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (18, 'thartmann@example.org', '053-919-1371x7379', '1971-10-12 17:11:31', '1980-09-30 00:09:32');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (19, 'twilkinson@example.org', '978-183-5023', '1976-05-18 13:33:01', '1980-09-15 15:26:53');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (20, 'barton.vilma@example.org', '02139123389', '1981-09-08 07:22:07', '1993-07-26 17:42:38');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (21, 'umertz@example.com', '512.604.5308', '2011-07-14 03:38:25', '2002-08-31 16:14:30');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (22, 'nrenner@example.com', '1-621-260-5660x6232', '1992-04-12 13:12:16', '2012-09-13 00:57:37');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (23, 'krutherford@example.com', '929-557-2206', '1974-08-02 19:07:18', '1970-04-05 06:46:42');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (24, 'fjacobs@example.net', '373.999.6737', '1995-07-07 00:04:57', '1970-05-27 05:42:04');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (25, 'jules.mcdermott@example.org', '322-914-8028x961', '1981-10-07 16:14:05', '1996-11-22 20:56:23');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (26, 'natalie78@example.org', '+31(0)3055028916', '2012-11-04 19:49:26', '2001-08-07 07:55:06');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (27, 'esmith@example.com', '351.611.8720x37088', '2005-05-14 02:21:49', '2011-01-06 12:48:30');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (28, 'florida.kreiger@example.net', '1-914-982-7949x510', '1985-03-15 23:23:08', '1973-11-27 05:52:01');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (29, 'courtney62@example.net', '539-084-7365x44030', '2017-07-20 03:54:35', '1979-07-12 10:44:36');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (30, 'witting.uriel@example.org', '1-556-215-0533x8161', '1984-06-30 13:06:30', '1974-07-25 14:25:00');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (31, 'felicita.ratke@example.net', '(833)716-4177x105', '1988-12-17 19:22:02', '1971-02-03 02:01:39');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (32, 'gustave84@example.org', '380.668.0471x29961', '2003-12-01 08:58:54', '2001-02-14 11:03:23');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (33, 'maverick69@example.com', '1-987-469-8914x7717', '2017-11-10 19:33:36', '1998-05-02 02:01:43');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (34, 'deckow.loyal@example.org', '603-850-1282x7134', '1985-09-13 00:13:42', '1986-02-24 07:26:07');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (35, 'lschuster@example.org', '190.376.2010x260', '1991-08-10 22:38:22', '1970-12-19 15:41:25');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (36, 'carleton.wintheiser@example.com', '524.337.3095', '1971-07-01 20:48:14', '2015-05-21 04:11:25');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (37, 'benny.gislason@example.com', '+52(4)0015612001', '1996-12-31 04:00:49', '2011-05-28 11:06:41');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (38, 'shayna92@example.net', '(128)817-3954', '1970-12-04 21:28:44', '2021-03-08 04:45:07');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (39, 'rhessel@example.org', '(008)861-8235x0122', '1975-11-29 13:34:21', '1987-02-22 04:54:02');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (40, 'casper.kuhlman@example.net', '(010)288-2582x6936', '1970-07-13 15:12:10', '1982-01-21 13:41:07');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (41, 'veda.mohr@example.net', '721-226-9881x98076', '1985-09-13 15:55:38', '1986-08-15 07:58:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (42, 'zkulas@example.net', '169-699-4945x7547', '1977-07-29 08:05:07', '1973-10-30 16:42:25');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (43, 'jakubowski.geraldine@example.com', '(702)738-4111x22490', '2006-04-06 18:02:25', '2002-10-14 18:45:47');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (44, 'wmarvin@example.net', '01335831792', '1990-11-16 23:23:25', '1981-05-18 11:54:27');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (45, 'macejkovic.adolfo@example.org', '1-040-846-1636x86908', '1994-12-21 10:49:52', '2015-12-15 19:33:44');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (46, 'kirlin.jeffry@example.net', '+68(4)4149602736', '1991-11-29 21:42:26', '1977-09-07 13:42:06');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (47, 'mathilde30@example.org', '+09(9)4549216326', '1979-06-26 17:36:28', '1977-05-09 05:59:55');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (48, 'bweissnat@example.com', '+86(8)7917487640', '1980-02-24 08:31:37', '2002-06-14 11:57:30');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (49, 'clair.kiehn@example.org', '1-006-801-7305x614', '1974-11-12 12:28:23', '1977-01-01 16:30:06');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (50, 'brody.white@example.com', '191-191-3239x11792', '2007-10-14 21:05:00', '1995-02-23 04:25:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (51, 'elizabeth50@example.com', '(649)818-1426', '1979-11-27 11:58:01', '1981-04-29 15:57:22');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (52, 'virgie.muller@example.org', '(201)983-1349x4544', '2004-03-09 15:59:38', '1987-06-12 03:41:35');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (53, 'wlind@example.com', '(745)517-6959', '2002-02-01 07:47:46', '2020-03-10 21:01:10');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (54, 'herminia55@example.org', '+99(7)6281979315', '1984-04-15 06:26:55', '1971-02-10 04:18:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (55, 'oswald.koch@example.org', '(606)804-9753x12519', '1980-03-12 10:32:30', '1970-03-10 10:13:32');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (56, 'ahirthe@example.com', '572-452-7586x5264', '2018-09-05 20:13:24', '1999-05-05 02:42:33');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (57, 'adelia.klocko@example.org', '(903)829-4219', '2019-08-13 07:40:37', '1981-09-20 19:46:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (58, 'zschaefer@example.com', '738.851.8446', '1982-11-24 00:17:53', '2016-01-22 10:31:53');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (59, 'wisozk.josiane@example.net', '+16(8)3015430206', '2016-11-09 12:01:58', '1998-05-29 17:01:14');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (60, 'collier.celine@example.net', '(093)694-4965x7789', '2012-09-03 22:17:59', '1994-12-23 13:01:04');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (61, 'mlubowitz@example.org', '779-202-2422x852', '1993-12-10 20:11:55', '1975-02-25 12:59:09');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (62, 'marina49@example.net', '1-903-453-2673x16418', '2019-08-06 10:34:54', '2001-11-22 07:09:21');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (63, 'david.hauck@example.net', '(921)622-7477x33398', '1990-06-30 06:56:47', '1988-12-03 17:36:13');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (64, 'antoinette.berge@example.org', '603-570-6295x6294', '1993-12-17 23:59:17', '2011-10-21 16:46:19');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (65, 'gavin44@example.net', '(425)968-8381', '1998-09-08 14:12:53', '1973-03-27 19:23:16');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (66, 'boyer.fiona@example.org', '421.784.9256x5689', '2018-01-02 09:11:55', '1993-07-08 22:48:16');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (67, 'dusty78@example.com', '1-745-810-0968', '1972-03-27 02:00:26', '1975-02-05 16:39:05');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (68, 'luz.schuster@example.org', '1-075-456-6308x42944', '2016-10-17 15:23:07', '2019-12-09 17:26:41');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (69, 'wwilkinson@example.net', '849.536.4854x1517', '2008-08-21 09:53:59', '2003-04-15 09:23:34');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (70, 'pkeebler@example.net', '(740)432-0499x230', '1990-06-20 06:46:15', '1998-01-13 13:02:40');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (71, 'dickinson.henri@example.com', '454-555-3037', '2010-02-13 16:08:19', '1972-02-02 23:06:13');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (72, 'clarissa.heathcote@example.net', '(255)150-4065x651', '1994-08-11 18:45:37', '1994-12-13 11:08:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (73, 'graciela07@example.org', '772.444.1232', '1975-10-23 07:19:14', '1977-07-21 08:46:31');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (74, 'ycassin@example.org', '559.978.3136x384', '2011-09-08 13:38:57', '2008-05-30 07:02:54');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (75, 'anais85@example.net', '636-146-0674', '1972-05-02 04:41:00', '2017-12-07 09:29:59');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (76, 'iokuneva@example.com', '797-518-4290x798', '1995-12-22 22:41:05', '2015-04-04 14:41:29');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (77, 'ward.timmothy@example.com', '(984)021-6435x0721', '2007-03-16 01:21:05', '1994-05-30 09:44:52');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (78, 'kcruickshank@example.net', '1-798-940-1605x0206', '2003-02-11 03:05:01', '1979-12-29 21:23:54');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (79, 'julia42@example.com', '(201)625-4642', '1979-04-01 02:38:38', '2018-10-30 08:02:13');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (80, 'kautzer.guido@example.org', '1-139-315-4683x7458', '2006-04-19 19:30:56', '1972-10-24 10:21:26');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (81, 'feest.asia@example.org', '(052)430-9706x946', '1980-06-08 21:57:13', '1981-02-08 19:30:20');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (82, 'bfahey@example.net', '1-111-136-9127x16328', '1998-03-05 18:00:29', '1996-11-17 02:59:00');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (83, 'boyer.odie@example.org', '(599)400-6129x72238', '1991-10-11 16:07:51', '1984-08-20 08:22:33');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (84, 'vonrueden.carolyn@example.net', '698-585-1775x99732', '2020-10-09 09:45:59', '2014-02-18 04:34:54');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (85, 'west.nathanial@example.net', '899.790.5468x429', '1987-11-10 16:29:19', '1971-04-17 10:11:41');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (86, 'matilda.spinka@example.net', '331-401-5150x4546', '2008-08-19 08:07:01', '1970-09-22 18:24:40');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (87, 'elnora.predovic@example.net', '+77(2)3092211744', '2003-05-07 15:28:30', '1973-04-23 17:23:58');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (88, 'eva.lynch@example.org', '+64(7)9569254038', '1979-11-27 16:35:39', '1979-03-21 22:06:03');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (89, 'ondricka.ashly@example.net', '1-920-616-5324x2279', '2012-11-14 21:17:59', '1976-09-26 10:40:46');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (90, 'laurence31@example.org', '815-710-7792', '2002-10-12 05:06:47', '2011-01-31 23:25:30');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (91, 'austen22@example.net', '1-780-569-2838x480', '2014-12-07 03:00:02', '1973-09-20 07:09:09');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (92, 'eschiller@example.org', '03674721798', '2004-06-24 16:57:51', '2003-08-21 21:32:39');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (93, 'kip.bartoletti@example.net', '(401)657-7790x004', '1994-06-13 11:40:49', '2009-01-05 08:23:26');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (94, 'clementina.turner@example.org', '(143)948-5043x2772', '1988-12-27 17:17:17', '1994-09-30 10:07:13');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (95, 'agoyette@example.com', '343.368.2308', '2018-06-17 20:10:25', '2000-01-10 16:47:36');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (96, 'balistreri.frederik@example.com', '867.891.0899', '1979-10-22 22:07:40', '2016-02-20 22:47:28');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (97, 'arely74@example.net', '05273531359', '1991-03-24 09:20:33', '2002-01-19 13:34:09');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (98, 'runolfsson.grayson@example.com', '1-307-207-9731', '2005-06-21 15:24:14', '1972-06-25 18:16:21');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (99, 'sadie70@example.com', '+66(4)7828474554', '1989-10-24 21:59:47', '1993-06-10 01:37:00');
INSERT INTO `users` (`id`, `email`, `phone`, `created_at`, `updated_at`) VALUES (100, 'xskiles@example.net', '561.002.2197x72649', '2013-01-18 20:55:30', '1985-06-07 21:15:52');


