DROP DATABASE vk;
CREATE DATABASE vk;

USE vk;

/* 
Ключи

1. Первичный ключ. Уникально характеризует запись. Единственный в таблице

* Синтетический (Суррогатный ) - дополнительное служебное поле, добавленное к
уже имеющимся информационным полям таблицы, единственное предназначение 
которого — служить первичным ключом. Значение этого поля не образуется на основе каких-либо других данных из БД, а генерируется искусственно.
https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%80%D1%80%D0%BE%D0%B3%D0%B0%D1%82%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87

* Естественный - Первичный ключ может состоять из информационных полей 
таблицы (то есть полей, содержащих полезную информацию об описываемых объектах). 
Такой первичный ключ называют естественным ключом.
https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B2%D0%B8%D1%87%D0%BD%D1%8B%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87

2. Внешний ключ. 
Внешний ключ — это столбец или комбинация столбцов, значения которых соответствуют Первичному ключу в другой таблице.

Связь между двумя таблицами задается через соответствие Первичного ключа в одной из таблиц внешнему ключу во второй
https://ru.wikipedia.org/wiki/%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9_%D0%BA%D0%BB%D1%8E%D1%87

3. Альтернативный ключ - полей сущности, со свойствами первичного ключа (уникально, не пустое, однознано характеризаует запись)
*/

-- Таблица пользователей, содержит авторизационную информацию (кроме паролей). Версионная 
/*
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",    
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
*/

-- Возможные варианты объявления первичного ключа (PRIMARY KEY) на примере users:

-- 1. Первичный ключ указывается при создании таблицы, отдельно от объявления поля :

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "Идентификатор строки",    
	email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
	phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
	CONSTRAINT pk_user_id PRIMARY KEY (id)
);



-- 2. Первичный ключ создается отдельно (отсутствует в объявлении таблицы):
/*
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL  AUTO_INCREMENT  COMMENT "Идентификатор строки",    
	email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
	phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE users AUTO_INCREMENT=1;
*/
-- Подробнее с синтаксисом можно ознакомиться в официальном справочном руководстве: https://dev.mysql.com/doc/refman/8.0/en/create-table.html
-- Прежде, чем читать само руководство, очень рекомендую ознакомиться с условными обозначениями на этой странице: "https://dev.mysql.com/doc/refman/8.0/en/manual-info.html"

DROP TABLE IF EXISTS `profiles`;
-- Таблица профилей с личными данными пользователя. Версионная 
CREATE TABLE `profiles` (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	user_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Идентификатор пользователя", 
	first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
	last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
	gender CHAR(1) NOT NULL COMMENT "Пол",
	birthday DATE NOT NULL COMMENT "Дата рождения",
	city VARCHAR(130) COMMENT "Город проживания",
	country VARCHAR(130) COMMENT "Страна проживания",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

-- Создаем внешний ключ для связи для "user_id" таблицы "profiles" и полем "id" таблицы users
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);


-- Вставка для демонстрации работы внешнего ключа fk_user_id
-- INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (1, 0, 'Natalia', 'Ruecker', '', '1984-12-17', 'Mylesfurt', '', '2016-01-04 17:29:12', '2010-10-05 18:30:17');
-- INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (2, 0, 'Cristina', 'Davis', '', '1987-12-23', 'West Valentinechester', '92576', '1985-04-15 22:45:11', '2013-08-19 10:00:00');

-- При попытке выполнить вставку выводится ошибка "Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails"

-- Таблица для групп
CREATE TABLE communities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",     
	`name` VARCHAR(150) NOT NULL UNIQUE COMMENT "Название группы",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
);


-- Таблица связи групп и пользователей 
CREATE TABLE communities_users (
	community_id INT UNSIGNED NOT NULL COMMENT "Идентификатор группы",  
	user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя",  
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
);

-- В каждой группе пользователь может присутствовать только один раз, соотвественно делаем пару полей "community_id"
-- и "user_id" первичным ключом
ALTER TABLE communities_users ADD CONSTRAINT pk_communities_users PRIMARY KEY (community_id, user_id);

-- Создаем внешние ключи для связи таблицы "communities_users" с таблицами "communities" и "users"
ALTER TABLE communities_users ADD CONSTRAINT fk_community_id FOREIGN KEY (community_id) REFERENCES communities(id);
ALTER TABLE communities_users ADD CONSTRAINT fk_communities_users_user_id FOREIGN KEY (user_id) REFERENCES users(id);

-- Таблица дружбы пользователей (друг/подписчик). Версионная.
CREATE TABLE friendship (
	user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя",
	friend_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя",
	`status` VARCHAR(100) NOT NULL COMMENT "Тип отношений",
	requested_at DATETIME DEFAULT NOW() COMMENT "Время отправления приглашения дружить",
	confirmed_at DATETIME COMMENT "Время подтверждения приглашения",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

-- У каждого пользователя может существовать только одна связь типа "друг" или "подписчик с другим пользователем.
-- Т.е. если у нас есть два друга A и B (т.е. два пользователя подписанных друг на дурга), то выглядит это так:
-- | user_id | friend_id |
-- |    A    |     B     |
-- |    B    |     A     |
-- Сделаем эту пару полей первичным ключом

ALTER TABLE friendship ADD CONSTRAINT pk_friendship PRIMARY KEY (user_id, friend_id);

-- Создаем внешние ключи для связи таблицы "friendship" с "users". 
ALTER TABLE friendship ADD CONSTRAINT fk_friendship_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE friendship ADD CONSTRAINT fk_friend_id FOREIGN KEY (friend_id) REFERENCES users(id);

-- Таблица сообщений между пользователями. Версионная.

-- В данном случае мы можем создать естетвенный первичный ключ. Т.к. от одного пользователя к другому можем быть отправлено
-- больше одного ключа, даже если мы сделаем ключом (sender_id, reciever_id, created_at) уникальность не гарантируется.
-- Поэтому создаем подолнительное поля id со свойством AUTO INCREMENT (увеличение на 1 при создании новой записи) и назначаем
-- это поле первичным ключом. Такой ключ называется синтетическим или сурогатным.
CREATE TABLE messages (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",     
	sender_id INT UNSIGNED NOT NULL COMMENT "Идентификатор отправителя",
	reciever_id INT UNSIGNED NOT NULL COMMENT "Идентификатор получателя",
	send_at DATETIME DEFAULT NOW() COMMENT "Время отправления сообщения",
	recieved_at DATETIME COMMENT "Время получения",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);

-- Создаем внешние ключи для связи таблицы "messages" с "users".
ALTER TABLE messages ADD CONSTRAINT fk_sender_id FOREIGN KEY (sender_id) REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT reciever_id FOREIGN KEY (reciever_id) REFERENCES users(id);


-- ВЫПОЛНЕНИЕ ДОМАШНЕГО ЗАДАНИЯ:
-- Добавить необходимую таблицу/таблицы для того, чтобы можно было использовать лайки для медиафайлов, постов и пользователей

-- Создаем таблицу типов медиафайлов (фото, видео, звук, гифка и т.п.)
CREATE TABLE media_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    name_media_type VARCHAR(50) NOT NULL COMMENT "Наименование типа",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочная таблица типов медиафайлов";

-- Создаем таблицу медиафайлов пользователя
CREATE TABLE media_files (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    id_media_type INT UNSIGNED NOT NULL UNIQUE COMMENT "Идентификатор типа",
    name_media_file INT UNSIGNED NOT NULL COMMENT "Наименовавние файла",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время загрузки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления медиафайла"
) COMMENT "Справочная таблица медиафайлов";

-- Создаем внешние ключи для связи таблицы "media_files" с "media_types".
ALTER TABLE media_files ADD CONSTRAINT fk_media_files_media_types FOREIGN KEY (id_media_type) REFERENCES media_types(id);


-- Создаем таблицу публикаций
CREATE TABLE post (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    id_user INT UNSIGNED NOT NULL UNIQUE COMMENT "Идентификатор пользователя, чья публикация",
    id_communities INT UNSIGNED NOT NULL COMMENT "Наименование группы, где опубликована публикация",
    post_text text COMMENT "Текст публикации",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время публикации поста",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления публикации"
) COMMENT "Справочная таблица публикаций";

-- Создаем внешние ключи для связи таблицы "post" с "user".
ALTER TABLE post ADD CONSTRAINT fk_post_users FOREIGN KEY  (id_user) REFERENCES users(id);
-- Создаем внешние ключи для связи таблицы "post" с "communities".
ALTER TABLE post ADD CONSTRAINT fk_post_communities FOREIGN KEY  (id_communities) REFERENCES communities(id);


-- Создаем таблицу публикаций медиафайлов (в посте помимо текста может быть несколько медиафайлов)
CREATE TABLE post_media (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
    id_post INT UNSIGNED NOT NULL COMMENT "Идентификатор публикации",
    id_media INT UNSIGNED NOT NULL COMMENT "Идентификатор публикации",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время публикации поста",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления публикации"	
)COMMENT "Справочная таблица связей поста и медиафайлов";

-- Создаем внешние ключи для связи таблицы "post_media" с "post".
ALTER TABLE post_media ADD CONSTRAINT fk_post_media_post FOREIGN KEY  (id_post) REFERENCES post(id);
-- Создаем внешние ключи для связи таблицы "post" с "communities".
ALTER TABLE post_media ADD CONSTRAINT fk_post_media_communities FOREIGN KEY  (id_media) REFERENCES media_files(id);

-- Создаем таблицу типов лайков (единую для всех возможных типов лайков и эмодзи)
DROP TABLE IF EXISTS like_type;
CREATE TABLE like_type (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	name_like VARCHAR(100) NOT NULL COMMENT "Наименование лайка"
) COMMENT "Справочная таблица с типами лайков";

CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  from_user_id int unsigned NOT NULL COMMENT "Ссылка на пользователя, ",
  id_post int unsigned NOT NULL COMMENT "Ссылка на публикацию",
  id_messages int unsigned NOT NULL COMMENT "Ссылка на сообщение пользователя в переписке",
  like_type_id int unsigned NOT NULL COMMENT "Ссылка на тип лайка",
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Таблица лайков";

-- Создаем внешние ключи для связи таблицы "likes" с "like_type".
ALTER TABLE likes ADD CONSTRAINT fk_likes_like_type FOREIGN KEY  (like_type_id) REFERENCES like_type(id);

-- Создаем внешние ключи для связи таблицы "likes" с "post".
ALTER TABLE likes ADD CONSTRAINT fk_likes_post FOREIGN KEY  (id_post) REFERENCES post(id);

-- Создаем внешние ключи для связи таблицы "likes" с "messages".
ALTER TABLE likes ADD CONSTRAINT fk_likes_messages FOREIGN KEY (id_messages) REFERENCES messages(id);

-- Создаем внешние ключи для связи таблицы "likes" с "users".
ALTER TABLE likes ADD CONSTRAINT fk_likes_users FOREIGN KEY (from_user_id) REFERENCES users(id);


--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jayde.zemlak@example.net','1-363-245-2536','2005-07-26 02:01:50','2002-12-04 22:27:56'),(2,'cartwright.nora@example.com','406-458-3628x4304','1984-05-27 20:47:39','1986-02-18 00:40:05'),(3,'strosin.berenice@example.com','+30(0)7490211373','2004-03-28 16:46:23','2014-09-24 12:34:59'),(4,'schiller.pasquale@example.net','01535098582','1994-05-06 22:59:45','1979-01-10 11:16:55'),(5,'ethelyn.klocko@example.com','(519)881-7144','2013-06-24 16:21:59','2016-10-20 03:31:21'),(6,'cwintheiser@example.com','+38(0)2253671344','2020-05-15 16:07:24','1972-09-08 11:43:18'),(7,'hayes.chaz@example.org','(391)714-1067','2005-04-16 06:44:29','2016-06-22 21:47:24'),(8,'fjohnston@example.com','175.270.1104','1987-08-30 04:34:07','2009-03-31 20:22:20'),(9,'igraham@example.net','110.180.8709x66525','2004-02-11 19:33:41','2002-02-02 12:43:43'),(10,'shaina.legros@example.org','(961)329-1626','1975-02-03 18:43:32','2004-11-19 11:44:18'),(11,'ned11@example.com','(511)844-0498','1981-11-05 17:32:00','1980-08-29 17:17:58'),(12,'jovan86@example.org','1-167-931-3999x850','1977-02-23 07:34:49','1991-03-21 14:25:59'),(13,'layla08@example.net','020.451.3767x37273','1983-03-24 12:56:33','1999-08-17 07:39:30'),(14,'ubogisich@example.org','(127)681-3781','1987-01-28 05:09:54','1978-08-22 23:41:35'),(15,'pfeffer.camden@example.net','970-252-9064','1998-02-24 05:42:00','1998-08-10 01:20:00'),(16,'dmcclure@example.org','1-890-931-5235x9843','1996-08-11 00:04:42','2004-11-06 14:02:52'),(17,'efeil@example.net','00389996682','2009-05-24 08:55:00','1997-02-25 18:32:45'),(18,'egulgowski@example.org','282-401-9586','1984-09-29 02:43:36','1996-09-25 19:27:55'),(19,'utrantow@example.com','254-163-7084x1609','1986-09-07 22:01:52','2015-01-31 10:51:33'),(20,'zharber@example.org','(979)527-4022','1985-10-01 21:21:42','1998-05-18 14:12:27'),(21,'pbednar@example.com','(182)587-4948','1987-02-02 05:47:16','2009-01-03 16:49:45'),(22,'armand.romaguera@example.org','(970)798-5587x6355','2000-05-03 09:42:20','2020-01-19 19:47:15'),(23,'qmcclure@example.net','09472697496','1993-11-22 21:50:43','1992-07-27 02:58:18'),(24,'pfeffer.mike@example.com','502-755-7696x00138','1999-05-13 09:06:45','2015-07-05 19:28:30'),(25,'kunde.celia@example.net','+46(2)9537255704','1993-06-06 04:58:11','2000-02-14 12:26:34'),(26,'clyde.o\'kon@example.com','00031272227','1995-03-11 14:13:30','1980-10-31 12:18:01'),(27,'claude16@example.com','924-988-3376','1985-03-31 10:05:08','2015-08-01 18:50:40'),(28,'kathryn84@example.org','137.899.8005x2455','1974-09-06 03:05:05','1984-05-27 13:15:12'),(29,'lemke.katelynn@example.net','1-256-383-3215x1131','2020-04-09 18:11:37','1995-11-13 08:44:03'),(30,'ephraim25@example.org','1-744-101-0254x0043','2002-11-18 02:18:04','2018-08-07 05:09:16'),(31,'kunde.dina@example.org','958.878.9452x8930','1971-06-08 20:57:48','2015-01-14 16:06:05'),(32,'kbergstrom@example.net','(430)858-4589x70313','1991-05-14 21:34:46','2014-10-11 00:55:36'),(33,'lillie.franecki@example.net','(033)914-2933x90122','1976-07-16 04:28:04','2013-03-14 22:31:52'),(34,'vada12@example.org','(705)023-0863x5905','1999-03-22 12:44:39','1979-07-28 19:40:07'),(35,'torphy.arturo@example.org','(701)130-7163','1976-04-09 07:20:45','2002-09-08 02:57:07'),(36,'yhudson@example.org','036.347.1092x541','2018-04-24 20:39:39','1983-08-06 19:00:29'),(37,'lilyan.hoeger@example.com','+31(4)7214263464','2018-01-28 09:00:11','2007-11-09 11:32:31'),(38,'dylan20@example.com','457.064.3683','1986-08-14 11:52:17','1988-06-18 05:08:14'),(39,'michael02@example.org','1-003-751-9728x8147','1999-10-27 11:34:30','1973-02-05 21:16:40'),(40,'bkozey@example.com','03296756297','2008-09-04 09:58:30','1978-01-21 03:51:02'),(41,'funk.jan@example.net','1-780-566-1024','2002-02-04 18:30:33','1978-06-04 16:49:37'),(42,'keira08@example.com','(609)123-0680x207','2019-12-09 15:51:01','1996-04-12 09:26:31'),(43,'mparisian@example.net','1-822-415-5148x842','2019-12-16 12:42:14','2005-12-23 02:41:37'),(44,'mariah04@example.com','1-333-834-2200','2000-06-01 04:59:26','2011-12-09 19:08:44'),(45,'torp.zakary@example.com','1-583-737-6855','1997-03-26 14:51:58','2012-10-07 19:37:17'),(46,'alfred.greenholt@example.net','939-496-3110x95219','1997-04-04 00:44:18','1997-03-27 19:14:25'),(47,'freddy.dicki@example.net','(860)177-9826','1974-07-30 16:54:45','2010-07-02 13:42:07'),(48,'britney.watsica@example.com','1-606-630-1818x90152','1977-12-03 08:19:45','1997-10-20 03:12:44'),(49,'evans82@example.org','931-772-2074x973','1999-03-13 18:15:18','1991-08-04 18:46:03'),(50,'gaylord.lavada@example.org','(004)861-7996x456','2002-12-21 07:18:33','2020-10-16 13:49:55'),(51,'kyost@example.com','435.955.2386x364','2005-12-30 11:41:06','2017-04-09 02:01:26'),(52,'hickle.tracy@example.com','103-445-1450x7006','2019-04-05 11:01:48','1996-12-26 00:45:03'),(53,'bernier.hilbert@example.com','1-816-733-7596x75359','2004-06-05 03:36:06','1973-02-27 22:21:03'),(54,'pcremin@example.com','843-288-4953x957','1990-11-11 09:07:17','2011-08-28 19:56:20'),(55,'zachary61@example.com','585-636-8051','2009-01-27 14:05:56','2021-01-20 00:25:01'),(56,'lkohler@example.org','(615)024-6703x6932','1975-12-27 11:19:32','1991-10-03 06:36:35'),(57,'pablo77@example.net','836-144-2689','2003-01-13 13:22:15','1990-04-18 12:52:54'),(58,'parker.ortiz@example.com','328.563.2693x78669','1982-09-24 22:18:44','1980-02-23 08:06:27'),(59,'henderson.nitzsche@example.org','(466)296-3065x53729','1980-05-02 07:17:44','2015-08-11 10:11:54'),(60,'russ67@example.com','+75(0)9001451578','1986-08-16 04:43:57','1975-02-23 11:48:18'),(61,'casper.tyra@example.net','544.759.6143x1609','1992-10-28 01:17:49','2011-03-17 06:28:48'),(62,'creichert@example.com','(929)600-2705x562','1999-06-04 18:00:30','2003-05-15 11:17:51'),(63,'camren.nitzsche@example.org','08770955013','1970-12-22 09:28:51','1989-09-09 20:36:08'),(64,'cschowalter@example.org','032-094-9254','1980-03-16 08:54:07','2007-01-04 16:28:44'),(65,'rosie.kohler@example.org','411-611-9264x42616','2000-09-22 07:04:52','1977-03-20 01:55:18'),(66,'maureen65@example.net','(646)259-5109','2014-12-08 03:37:49','1999-09-16 13:17:18'),(67,'elmira.berge@example.net','876-514-2827','2020-11-25 21:06:41','2015-12-23 13:04:12'),(68,'kilback.carolyne@example.com','321.786.0497','2005-01-09 00:38:39','2003-03-11 15:32:23'),(69,'upton.burley@example.org','341-062-7603x506','1988-11-23 12:02:57','2017-06-12 11:44:57'),(70,'yjohnston@example.org','(002)936-3931x430','2002-03-08 07:43:10','2016-03-19 06:40:16'),(71,'gleason.efren@example.com','140-850-8390x3207','1978-10-08 14:34:41','1975-02-15 18:08:05'),(72,'ybogisich@example.org','1-137-442-1877x66866','2016-07-10 10:36:38','2021-02-24 14:14:20'),(73,'cleta.ryan@example.net','(025)062-6809','1972-04-05 05:27:32','2011-03-03 18:05:13'),(74,'ahuels@example.net','266.695.9729x36761','2000-12-12 21:47:05','1994-04-17 11:55:11'),(75,'egraham@example.com','141-845-9601x6415','1990-07-27 10:28:03','1982-09-20 11:07:34'),(76,'armstrong.conor@example.com','218-317-9457x878','1981-06-29 08:26:41','2003-10-15 12:53:19'),(77,'schoen.adrian@example.org','(811)592-5344x4490','1998-02-07 02:57:57','1991-07-22 02:46:12'),(78,'ledner.violet@example.com','07747927765','2019-01-15 20:32:48','2014-07-09 06:59:14'),(79,'damion.pagac@example.org','1-580-687-2802','1989-01-08 08:24:50','2012-02-26 20:55:43'),(80,'cary49@example.net','+96(2)1411659708','2002-11-03 21:50:42','1983-03-15 12:42:50'),(81,'ndouglas@example.net','(919)639-9614x5223','2005-06-04 12:47:29','2009-03-30 22:01:15'),(82,'xwolff@example.org','545-778-0713x50984','2004-04-27 07:53:27','2019-10-15 01:35:59'),(83,'tmurazik@example.org','344-066-7426','1980-01-18 04:00:28','1986-07-26 13:26:14'),(84,'xhuel@example.org','663.788.9216x1640','2005-06-25 14:32:07','2002-01-03 09:11:03'),(85,'gcole@example.org','386-026-9967','2009-05-07 02:05:06','1977-01-19 18:22:36'),(86,'xcole@example.com','1-673-123-5904','1987-06-09 22:34:14','2004-12-16 07:58:06'),(87,'hagenes.akeem@example.com','510-678-3502x418','2002-03-22 04:46:35','2004-07-04 06:19:10'),(88,'md\'amore@example.net','07463536379','2013-05-08 03:50:41','2017-06-23 20:14:40'),(89,'wiegand.molly@example.com','484.684.3440','2008-03-10 17:12:52','2002-07-18 07:41:20'),(90,'gutkowski.makenzie@example.net','689.114.3659x53123','1977-04-07 18:46:58','1989-03-06 05:50:41'),(91,'tyrique57@example.net','1-476-909-0219x4954','1982-06-22 04:41:46','1991-07-24 06:57:21'),(92,'santos.kihn@example.net','853.809.5797x9196','2011-03-24 21:05:02','2002-10-02 08:42:12'),(93,'olebsack@example.net','+19(3)6913933756','2018-06-04 20:34:26','1985-11-03 08:57:21'),(94,'arvilla59@example.net','1-580-506-3295x46507','2004-08-31 04:21:07','1989-05-03 03:22:51'),(95,'kbrekke@example.org','(264)302-8525','1991-06-11 11:33:13','1975-03-01 16:38:38'),(96,'mmurphy@example.net','313.779.9324x01317','1995-10-22 19:41:04','2007-03-07 18:49:38'),(97,'stamm.ignatius@example.net','400.844.7489','1995-01-16 06:37:27','2002-06-13 19:00:58'),(98,'rafael.huel@example.org','455-539-2165x9068','2018-10-05 05:35:21','1998-12-26 19:34:19'),(99,'yveum@example.com','865.521.1565','1998-07-07 05:54:45','2016-07-14 10:24:25'),(100,'cathryn61@example.com','145-436-1626x8994','2018-07-28 10:24:11','1985-07-21 23:15:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'Lura','Klein','','1992-12-08','West Javierfurt','1','2003-05-09 09:58:52','1985-12-07 03:57:51'),(2,2,'Julianne','Bernier','','1976-09-15','Ryleefurt','4279070','2021-05-27 21:15:47','1972-12-17 02:19:58'),(3,3,'Houston','Hodkiewicz','','2012-11-04','Lake Maurice','','1986-09-21 15:58:59','2002-05-12 22:32:32'),(4,4,'Olen','Schultz','','1993-05-23','Gislasonhaven','80603889','1977-11-07 12:55:08','1979-09-08 04:35:16'),(5,5,'Xander','Kutch','','2003-08-26','South Savanah','5','2012-02-28 09:08:31','1979-06-23 13:10:31'),(6,6,'Winfield','Corkery','','2007-04-09','Shanahantown','66','1993-12-10 14:33:19','2016-10-02 13:20:28'),(7,7,'Stuart','Jenkins','','1984-10-26','Lake Arielport','424119550','2015-12-23 01:29:06','1977-03-11 02:31:22'),(8,8,'Ladarius','Casper','','1999-12-19','East Tobystad','','1970-02-24 17:51:41','1978-06-06 04:55:14'),(9,9,'Alfredo','Fadel','','1984-04-14','Klockoland','128','1977-03-18 04:31:19','1971-06-10 03:50:01'),(10,10,'Shanel','Hackett','','2006-04-06','Katrinebury','339','2000-04-08 20:06:17','1978-07-04 15:34:05'),(11,11,'Stefan','Kshlerin','','1983-03-25','Port Randy','21','1980-01-07 10:49:57','2007-08-21 04:41:21'),(12,12,'Dejon','Gislason','','1998-12-30','Lake Sandrine','8','1996-04-12 12:55:05','1994-10-14 10:29:30'),(13,13,'Myrl','Walker','','2016-11-15','New Nettiestad','595381','2018-05-30 18:17:17','1981-05-04 16:36:42'),(14,14,'Gwen','Buckridge','','1971-10-30','Jacemouth','183589','2010-02-23 08:10:55','1992-03-20 05:31:45'),(15,15,'Rosie','Jast','','1982-04-10','Lake Chazshire','5','2002-09-25 05:34:52','1980-12-23 17:29:07'),(16,16,'Alexa','Mraz','','2019-09-16','New Lucindahaven','4164','1982-11-17 04:54:04','1973-11-24 13:00:27'),(17,17,'Pierre','Hudson','','1974-10-27','Ernserfort','9463751','1970-03-31 09:35:48','2006-05-12 16:25:15'),(18,18,'Felicia','Upton','','1996-12-26','North Anabelshire','413679','2013-02-21 21:23:41','1971-06-23 22:19:23'),(19,19,'Pink','Treutel','','2011-03-03','Samfort','17','2017-05-04 23:37:38','1996-11-23 04:02:31'),(20,20,'Mohamed','Hodkiewicz','','2014-09-16','North Jaquanfort','21404','1991-12-26 21:03:11','1971-05-08 01:09:59'),(21,21,'Cristobal','Kihn','','1983-06-21','North Nealview','6','1989-07-10 21:26:35','1981-02-16 09:37:41'),(22,22,'Pablo','Bruen','','1987-12-03','Margiemouth','964','2011-04-28 23:22:44','1999-10-07 19:14:47'),(23,23,'Kiara','Prosacco','','1989-02-04','East Bettie','758200','1971-05-11 17:08:04','1972-11-28 04:59:42'),(24,24,'Dominique','Steuber','','2009-02-08','East Merlin','88504','1977-05-29 00:20:28','1981-07-19 17:46:55'),(25,25,'Stephon','King','','2004-02-28','Bednartown','','1975-07-04 20:31:24','2016-09-26 04:21:00'),(26,26,'Horacio','Toy','','1978-12-21','New Terrell','','1983-08-05 11:12:50','2000-07-09 15:08:39'),(27,27,'Vanessa','Gerlach','','1992-04-27','Port Jewelberg','759','2002-12-22 02:23:45','2003-01-29 04:40:55'),(28,28,'Tito','Rippin','','1980-08-22','Port Malachi','22766748','2000-04-12 11:13:20','1996-11-01 21:19:54'),(29,29,'Ozella','Goodwin','','2007-06-16','Flaviostad','9864339','1994-04-12 10:53:07','1986-09-23 04:36:14'),(30,30,'Margaretta','Nolan','','2013-07-03','Champlinville','1214','1993-06-22 13:07:45','1971-06-30 03:44:19'),(31,31,'Darrell','Cartwright','','2017-01-06','New Lorna','38324390','1971-12-19 10:12:36','2017-11-15 13:41:46'),(32,32,'Alfred','Koepp','','1975-03-08','South Johan','5693609','2005-11-15 12:35:57','1986-05-22 11:08:23'),(33,33,'Aimee','Paucek','','1984-10-11','Moniquehaven','897843','2018-09-09 23:47:03','1986-12-19 05:23:11'),(34,34,'Omer','Pfannerstill','','2002-06-07','Port Valerieberg','9307462','2017-03-12 00:37:52','2016-11-28 11:21:28'),(35,35,'Carissa','Ledner','','2021-06-16','New Elisabethmouth','520260502','1974-03-15 15:20:19','2016-12-30 09:41:08'),(36,36,'Katrine','Boyer','','2019-10-17','Brekkeborough','876','2011-08-18 20:18:33','1983-05-12 10:55:51'),(37,37,'Ole','Hayes','','2018-12-03','Botsfordville','6297887','1983-05-02 05:46:02','1979-04-01 07:30:19'),(38,38,'Elian','Lindgren','','1979-07-06','Darianview','6','1990-12-12 19:27:34','1975-03-31 05:36:39'),(39,39,'Jaqueline','Beatty','','1986-09-16','Ariannastad','23699254','1980-01-14 05:29:01','1993-01-31 23:52:14'),(40,40,'Lula','Kling','','1973-09-24','Harveyville','56734283','1978-04-23 10:31:38','2012-02-21 22:39:59'),(41,41,'Margaret','Rice','','2014-01-24','Kayaville','159618895','1999-03-07 12:23:08','1987-12-20 23:02:25'),(42,42,'Odie','Rodriguez','','2019-10-03','Lake Pierce','7318779','1998-10-11 03:04:17','2000-10-24 18:03:28'),(43,43,'Zachariah','Hyatt','','2005-05-17','Lake Stefanbury','232','1983-01-11 19:02:48','1987-07-15 00:14:01'),(44,44,'Sabrina','Nikolaus','','2020-04-26','New Brittany','4959137','2021-01-25 03:09:55','2007-10-23 22:18:06'),(45,45,'Carson','Hagenes','','2019-08-31','Clementinaville','41791','1974-07-08 01:14:29','1982-07-27 17:14:32'),(46,46,'Hettie','Gulgowski','','1991-07-24','Angelinaside','96200639','2016-10-21 10:04:25','1988-06-08 22:46:57'),(47,47,'Odessa','Orn','','1993-06-15','South Howard','3163289','2013-01-02 03:36:55','1975-03-10 15:16:49'),(48,48,'Dakota','Fritsch','','2003-04-21','Ethelynville','764','1990-11-24 04:47:21','1975-06-01 22:53:10'),(49,49,'Asha','Larkin','','2001-08-29','Arthurfurt','134455987','1997-01-11 08:03:57','2003-12-19 01:50:56'),(50,50,'Corene','Quitzon','','2012-09-28','Murphyville','667902574','1987-09-20 20:52:08','1991-12-21 04:17:07'),(51,51,'Rene','Tremblay','','1975-10-23','Wizastad','6642','1995-12-17 22:02:07','1977-04-04 05:09:22'),(52,52,'Sarah','Trantow','','1996-09-22','Port Lavonne','330','1992-04-12 03:06:22','1990-07-25 05:07:23'),(53,53,'Theodora','Hermann','','1973-05-01','Port Joaquin','5960','2012-09-01 19:49:09','1985-11-28 05:32:51'),(54,54,'Amari','Schuppe','','2004-08-26','Connmouth','7107412','2012-07-06 19:01:12','2017-02-11 14:24:14'),(55,55,'Flo','Reichert','','2008-06-13','Laurenbury','8','1976-08-23 19:23:59','2004-01-07 08:18:18'),(56,56,'Kitty','Gottlieb','','1970-05-10','Kirstenfurt','18','2004-02-20 08:30:10','1990-01-17 04:04:16'),(57,57,'Leann','Halvorson','','1978-08-13','Port Vivien','30','2013-12-27 12:03:30','1987-11-21 21:22:03'),(58,58,'Ila','Mohr','','2017-06-17','New Robbiechester','83197708','1996-12-09 19:14:22','2001-03-13 21:32:41'),(59,59,'Rosetta','Ondricka','','2012-09-28','Aminaton','29357','1984-03-08 02:02:27','1970-08-09 23:32:16'),(60,60,'Adolphus','Kling','','2004-08-03','Beierside','817756144','1987-09-30 12:42:08','1970-05-08 12:40:21'),(61,61,'Tevin','Kohler','','2013-01-16','East Darbyland','985635','2014-10-24 00:35:17','1985-12-08 03:42:17'),(62,62,'Althea','Hessel','','1990-06-20','New Cullenbury','95784','1989-10-29 05:35:13','1986-06-07 10:28:10'),(63,63,'Aniya','Bergnaum','','1970-10-23','South Brauliotown','842453589','1994-06-29 01:30:49','1985-10-14 14:47:29'),(64,64,'Jamil','Kuhn','','1997-08-17','North Ludwigchester','256','1983-05-17 04:18:04','1970-04-17 06:30:00'),(65,65,'Trevion','Beer','','1989-04-03','West Simeon','80','1984-10-20 07:56:32','1994-11-25 11:17:40'),(66,66,'Alf','Bartoletti','','1990-09-14','Ellieview','8','1994-07-29 09:37:47','1973-09-18 10:49:40'),(67,67,'Laila','Champlin','','1983-04-05','Lake Madonna','20960073','1975-07-19 05:00:15','1975-01-30 14:48:41'),(68,68,'Justice','Kuhn','','2007-03-24','Port Keonfort','83694','2010-09-10 17:15:16','2007-06-01 04:24:50'),(69,69,'Roxanne','Klein','','1973-04-05','Jocelynbury','88155424','2016-02-07 23:12:24','1992-04-08 16:22:01'),(70,70,'Francesco','Roob','','1981-02-07','Osinskiborough','','1999-10-17 15:46:56','2001-12-06 08:22:24'),(71,71,'Keagan','Morissette','','2001-12-17','Richieside','635','1976-08-19 20:51:47','2010-01-28 15:37:31'),(72,72,'Madison','Balistreri','','1992-09-18','Bashirianport','896996415','1999-05-25 03:17:32','1981-09-02 13:49:54'),(73,73,'Xavier','Dibbert','','1975-05-31','New Everette','','1995-10-21 20:31:59','2015-01-28 09:51:40'),(74,74,'Schuyler','Sawayn','','2016-12-11','Homenickview','3096724','1975-01-02 20:18:10','1990-02-02 14:15:00'),(75,75,'Vladimir','Nienow','','1976-03-18','Ortizfurt','2','1994-03-10 14:32:42','2007-07-09 18:04:07'),(76,76,'Dasia','Daugherty','','1990-11-30','Kuhicberg','61208187','2010-02-21 03:24:49','2021-04-04 21:02:31'),(77,77,'Kareem','Johns','','1991-04-30','West Mikayla','832921802','2012-03-24 18:39:42','1972-08-20 08:28:56'),(78,78,'Angelica','Zemlak','','1989-10-23','South Marcus','5794393','1991-07-25 14:45:40','1990-11-28 02:31:15'),(79,79,'Joaquin','Casper','','1988-11-16','East Alberta','7282','1999-11-26 10:07:58','1996-10-21 02:09:57'),(80,80,'Darrell','Keebler','','2019-08-25','Port Ole','3274','1971-09-25 18:33:24','2011-11-13 09:55:18'),(81,81,'Elyse','Bode','','2019-08-19','Edaberg','2612','1973-04-26 23:00:08','2012-02-23 13:24:21'),(82,82,'Justus','McCullough','','1995-04-04','North Maymie','9','2014-01-23 02:53:59','1996-01-24 18:52:02'),(83,83,'Abigale','Luettgen','','1980-10-12','Bergeport','','1977-07-30 14:05:28','2006-01-24 16:29:46'),(84,84,'Rodrick','Daniel','','1990-05-02','Weissnatstad','184','2000-03-14 06:11:53','2000-05-06 01:07:39'),(85,85,'Monty','Boyle','','1973-02-06','North Elviemouth','','1991-10-31 04:32:27','1983-04-03 06:00:48'),(86,86,'Giovani','Douglas','','1989-12-22','Adelaport','78666','1987-11-06 23:42:36','1978-01-12 07:12:29'),(87,87,'Marco','Schulist','','1979-08-04','Marcside','9923023','1980-01-24 00:36:17','2014-10-27 17:30:35'),(88,88,'Alvina','Wiza','','1988-01-01','Fisherstad','87456','1994-03-29 16:22:01','2016-12-28 16:50:16'),(89,89,'Leo','Schaden','','1982-05-10','Lake Rudy','8599','1976-02-22 18:52:49','2014-08-22 02:28:42'),(90,90,'Virginia','Crona','','1975-12-01','Lonnieside','','1989-04-08 21:57:33','1981-10-06 13:26:12'),(91,91,'George','Farrell','','2002-11-21','Hirtheside','31286','2019-08-18 14:24:03','2017-05-24 02:41:30'),(92,92,'Jaquan','Labadie','','2005-08-26','North Leoraland','6067','1985-04-24 02:15:25','1996-09-23 13:31:03'),(93,93,'Amie','Jacobs','','2007-01-04','West Melbaview','31700','2000-11-25 16:32:27','1983-08-06 16:05:31'),(94,94,'Milan','Breitenberg','','1991-04-22','New Verona','212365169','1999-01-31 12:41:57','1992-10-23 22:01:34'),(95,95,'Kylie','Morissette','','2005-02-19','New Eddfort','429','2012-04-23 17:31:37','2017-12-26 18:52:58'),(96,96,'Darius','Mayer','','1998-04-14','New Kane','5042181','2013-06-03 00:27:15','2010-03-22 01:45:23'),(97,97,'Phyllis','Lockman','','2008-05-05','Grantfurt','7941','1993-09-11 22:54:29','1987-07-30 02:21:44'),(98,98,'Josh','Parisian','','2009-09-20','Lake Petra','70030514','1984-02-07 05:23:35','1980-01-30 15:36:37'),(99,99,'Morgan','Hagenes','','1974-12-13','Faustoville','5160','1995-03-28 21:23:30','1977-04-12 16:38:20'),(100,100,'Vern','Abernathy','','1994-04-26','Port Hermannville','8222','2010-02-16 07:07:46','1987-03-30 12:35:58');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'perspiciatis','1998-01-18 02:53:31','1975-01-02 18:16:54'),(2,'consequatur','1997-12-21 06:09:24','2015-08-18 15:07:22'),(3,'in','2018-12-08 03:34:39','2010-05-16 10:59:45'),(4,'incidunt','2021-02-17 09:18:10','1981-09-06 07:41:09'),(5,'reprehenderit','1984-05-14 18:14:55','1993-01-26 19:00:30'),(6,'vel','1985-11-22 02:37:14','2004-04-15 19:11:44'),(7,'possimus','1977-08-19 19:03:28','2021-06-11 20:22:04'),(8,'eum','2017-08-19 10:58:37','1979-12-07 20:54:52'),(9,'quia','1984-04-15 00:09:25','1976-05-30 04:47:54'),(10,'ut','1979-10-28 09:37:33','1999-03-17 04:41:18'),(11,'dignissimos','2016-10-15 09:11:06','1970-01-19 11:41:36'),(12,'aut','1999-11-03 01:12:13','1987-12-03 19:24:05'),(13,'et','1995-02-07 02:46:14','2020-05-01 04:21:00'),(14,'beatae','2019-02-27 04:23:31','1976-10-19 06:58:49'),(15,'fuga','2016-06-06 15:51:05','1988-07-16 23:51:10'),(16,'explicabo','1970-12-25 20:53:10','2017-02-17 05:31:31'),(17,'omnis','1997-12-01 23:18:26','1999-08-22 01:54:04'),(18,'repellat','2006-08-12 15:26:30','1984-02-27 17:00:23'),(19,'sapiente','1992-05-04 17:53:05','1993-11-10 12:09:21'),(20,'commodi','2003-04-09 07:08:45','1990-12-11 21:18:51'),(21,'qui','1974-01-20 03:06:25','2014-04-24 12:57:49'),(22,'quod','1986-04-04 09:38:52','1993-09-08 02:09:32'),(23,'corporis','2010-12-07 23:04:46','1977-08-06 03:24:38'),(24,'quidem','1978-07-01 19:59:52','2006-03-22 19:59:34'),(25,'dicta','2004-08-30 19:23:02','2011-10-13 03:12:53'),(26,'voluptas','2006-07-12 19:32:24','1987-09-16 10:08:12'),(27,'ea','2021-01-26 06:14:02','2013-12-13 02:22:52'),(28,'tempore','2016-07-19 02:07:58','2013-05-07 09:23:11'),(29,'officia','2011-12-15 07:27:44','2013-02-08 15:18:03'),(30,'sunt','1994-03-30 00:42:58','1975-10-08 09:22:45'),(31,'ducimus','1985-07-06 17:54:17','2005-08-19 16:28:10'),(32,'impedit','2016-01-01 12:45:38','2015-11-09 16:58:28'),(33,'maiores','2013-07-07 02:49:03','2001-12-08 02:15:52'),(34,'dolorem','2018-05-31 04:24:04','2020-01-07 02:10:14'),(35,'fugit','2021-06-28 11:17:20','2020-12-25 05:55:19'),(36,'deleniti','1981-06-05 12:47:59','1996-02-29 09:18:11'),(37,'eos','2014-09-30 02:03:59','2019-01-07 00:17:38'),(38,'adipisci','2003-02-22 05:40:12','1973-05-07 18:20:00'),(39,'assumenda','1970-12-20 16:18:14','1984-11-19 08:40:43'),(40,'iure','1978-03-21 04:58:04','1981-01-06 18:42:57'),(41,'porro','2006-01-14 15:49:51','2018-03-20 13:57:00'),(42,'distinctio','2008-09-17 09:46:24','1987-03-05 19:53:42'),(43,'repudiandae','2006-12-27 22:06:58','2008-03-04 07:22:13'),(44,'sint','2017-06-23 08:24:20','1971-04-10 09:41:09'),(45,'aliquam','2000-10-11 02:17:47','2006-11-11 23:52:27'),(46,'id','1997-07-16 09:23:11','1987-08-11 22:48:03'),(47,'praesentium','2004-05-12 20:43:00','1989-04-13 05:54:58'),(48,'eaque','1976-11-11 21:47:06','1980-04-01 03:18:04'),(49,'cupiditate','1990-08-20 04:49:01','1992-09-18 18:22:51'),(50,'recusandae','1993-08-14 05:38:57','2012-02-29 21:56:46'),(51,'hic','2004-11-08 21:31:11','2009-11-21 01:23:43'),(52,'voluptates','1997-01-30 15:10:10','1971-01-31 19:20:45'),(53,'maxime','1980-03-02 18:27:21','1989-11-16 06:39:18'),(54,'officiis','1990-01-28 07:56:09','1978-03-30 02:23:15'),(55,'quae','2019-12-05 22:14:06','1985-12-13 22:08:46'),(56,'nobis','1972-08-10 10:52:17','1973-03-06 20:00:23'),(57,'quas','2005-05-16 09:51:49','1978-05-07 01:09:49'),(58,'nostrum','1988-08-11 09:21:03','2007-05-07 01:44:56'),(59,'minima','1983-01-26 08:43:11','1986-07-21 14:04:49'),(60,'architecto','2010-11-17 00:41:08','2003-09-19 04:20:37'),(61,'non','1984-12-15 14:08:56','2007-11-10 00:40:27'),(62,'sed','2004-12-10 02:30:07','1972-12-19 19:44:48'),(63,'dolore','2013-07-27 22:59:02','1984-10-10 01:37:17'),(64,'labore','2020-09-04 01:27:12','2012-05-27 03:01:02'),(65,'dolores','2017-03-27 04:57:04','2013-10-28 17:57:59'),(66,'asperiores','1997-05-03 15:01:14','1972-06-10 06:00:26'),(67,'provident','1977-01-07 17:15:27','1981-12-23 09:55:25'),(68,'ipsam','1978-06-19 10:26:15','1979-11-25 00:33:40'),(69,'at','1991-01-28 15:19:49','2017-12-14 05:42:27'),(70,'blanditiis','1988-09-07 04:23:48','1981-07-22 01:53:55'),(71,'nulla','2007-04-28 15:20:56','2004-09-12 23:12:32'),(72,'est','2004-10-10 15:48:02','1994-04-07 15:49:55'),(73,'cumque','1983-01-09 12:32:32','1994-02-13 04:19:30'),(74,'inventore','2015-04-29 04:46:02','2001-05-05 23:51:43'),(75,'odio','1991-09-04 05:57:46','2018-12-08 08:43:18'),(76,'quis','2006-10-09 12:07:26','2003-09-20 09:11:00'),(77,'excepturi','1970-10-06 00:38:19','2014-08-26 13:06:22'),(78,'placeat','1976-04-12 01:01:38','2013-12-15 10:30:05'),(79,'quibusdam','1982-09-07 01:26:07','2005-04-01 01:18:59'),(80,'eligendi','2000-07-15 14:47:59','1981-11-09 15:19:07'),(81,'error','1972-05-30 18:41:43','2005-09-28 18:31:41'),(82,'ipsum','1994-02-16 10:41:29','2021-04-26 06:30:13'),(83,'molestiae','2018-05-07 11:12:03','1997-09-08 22:01:42'),(84,'rerum','2016-03-31 16:32:44','2008-12-23 03:32:38'),(85,'ullam','1983-11-15 23:47:59','2004-10-12 09:57:55'),(86,'veritatis','2009-03-01 00:26:32','2005-01-27 01:50:32'),(87,'illum','1999-08-26 04:03:33','2001-07-09 07:52:40'),(88,'laudantium','2017-08-23 21:42:14','2010-02-22 05:41:00'),(89,'delectus','2000-10-03 21:58:41','2020-08-20 15:03:51'),(90,'soluta','1977-01-11 03:02:27','1981-08-04 05:51:22'),(91,'occaecati','1979-05-26 19:05:01','1999-07-23 08:54:02'),(92,'quo','2014-07-09 15:58:30','2014-06-28 08:54:29'),(93,'accusamus','1980-03-09 06:15:10','1996-07-20 05:35:46'),(94,'similique','1980-03-01 11:41:38','1977-11-21 04:48:20'),(95,'totam','2012-02-05 01:17:36','2004-10-27 01:58:30'),(96,'necessitatibus','2016-11-19 20:04:40','1994-08-01 11:46:41'),(97,'consequuntur','2014-08-25 14:16:29','1999-10-26 12:28:37'),(98,'neque','1971-06-27 03:08:31','2010-01-04 01:02:48'),(99,'laborum','2001-08-30 14:51:01','1994-01-17 01:04:35'),(100,'exercitationem','1975-04-26 17:30:00','1998-11-23 07:24:31');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `like_type`
--

LOCK TABLES `like_type` WRITE;
/*!40000 ALTER TABLE `like_type` DISABLE KEYS */;
INSERT INTO `like_type` VALUES (1,'ab'),(2,'quia'),(3,'commodi'),(4,'provident'),(5,'molestias'),(6,'omnis'),(7,'asperiores'),(8,'officia'),(9,'expedita'),(10,'accusantium'),(11,'provident'),(12,'a'),(13,'perspiciatis'),(14,'qui'),(15,'similique'),(16,'ut'),(17,'eaque'),(18,'deleniti'),(19,'nisi'),(20,'eos'),(21,'pariatur'),(22,'accusantium'),(23,'facilis'),(24,'quia'),(25,'qui'),(26,'consectetur'),(27,'quam'),(28,'non'),(29,'expedita'),(30,'reprehenderit'),(31,'veritatis'),(32,'sit'),(33,'numquam'),(34,'ducimus'),(35,'eveniet'),(36,'et'),(37,'illum'),(38,'dolorem'),(39,'omnis'),(40,'aut'),(41,'ut'),(42,'ea'),(43,'quam'),(44,'vero'),(45,'ut'),(46,'quod'),(47,'est'),(48,'sequi'),(49,'dolorem'),(50,'iure'),(51,'alias'),(52,'asperiores'),(53,'tempore'),(54,'explicabo'),(55,'nihil'),(56,'labore'),(57,'ut'),(58,'eius'),(59,'sed'),(60,'rerum'),(61,'omnis'),(62,'est'),(63,'recusandae'),(64,'cum'),(65,'et'),(66,'velit'),(67,'alias'),(68,'neque'),(69,'minima'),(70,'sint'),(71,'libero'),(72,'dolorum'),(73,'recusandae'),(74,'voluptate'),(75,'aut'),(76,'natus'),(77,'non'),(78,'ducimus'),(79,'sint'),(80,'iusto'),(81,'sunt'),(82,'officiis'),(83,'vel'),(84,'quibusdam'),(85,'sequi'),(86,'neque'),(87,'molestias'),(88,'occaecati'),(89,'possimus'),(90,'omnis'),(91,'dolore'),(92,'tempora'),(93,'atque'),(94,'voluptas'),(95,'ex'),(96,'officia'),(97,'eligendi'),(98,'maxime'),(99,'quia'),(100,'quia');
/*!40000 ALTER TABLE `like_type` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'ut','2000-11-17 11:56:49','2009-01-16 22:16:09'),(2,'accusantium','1976-08-26 11:44:10','2001-05-27 23:40:37'),(3,'porro','1993-03-17 22:05:07','2007-03-25 22:42:00'),(4,'enim','1978-02-28 04:40:48','1976-10-08 00:39:08'),(5,'eum','1981-07-14 07:12:46','2013-10-06 06:29:01'),(6,'tempora','2014-08-14 07:58:31','1996-02-02 00:01:19'),(7,'quasi','1989-08-10 20:47:42','1983-12-19 16:04:32'),(8,'quia','2012-03-21 15:07:41','1978-04-09 12:07:43'),(9,'rem','1995-04-18 10:08:01','1971-01-13 10:54:31'),(10,'unde','1985-03-24 04:19:26','1997-02-18 01:25:24');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;
