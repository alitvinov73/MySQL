/*1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.*/


CREATE INDEX media_user_id_media_type_id_idx ON media (user_id, media_type_id);  

 -- индекс друзей пользователя, добавляем два индекса
CREATE INDEX friendship_user_id_friend_id_idx ON media (user_id, friend_id);
CREATE INDEX friendship_friend_id_user_id_idx ON media (friend_id, user_id);

-- индекс для лайков
CREATE INDEX likes_user_id_target_id_like_type_id_idx ON media (user_id, target_id, like_type_id);

-- индекс сообщений 
CREATE INDEX messages_from_user_id_to_user_id_created_at_idx ON media (from_user_id, to_user_id, created_at);
CREATE INDEX messages_to_user_id_from_user_id_created_at_idx ON media (to_user_id, from_user_id, created_at);


# ===================================================================================
# 3. Задание на оконные функции
# Построить запрос, который будет выводить следующие столбцы:
# имя группы
# среднее количество пользователей в группах
# самый молодой пользователь в группе
# самый старший пользователь в группе
# общее количество пользователей в группе
# всего пользователей в системе
# отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

# 3.1 Первый вариант 
SELECT DISTINCT communities.id,communities.name,
  'count' as averag_users,
  'user_id' as min_old,
  'user_id' as max_old,
  'count' as in_communities,
  'count' as users_total,
  '%%' as '%%'
FROM communities_users
	JOIN communities ON communities.id = communities_users.community_id
;

# 3.2 
SELECT DISTINCT communities.id,communities.name,
  'count' as averag_users,
  'user_id' as min_old,
  'user_id' as max_old,
  COUNT(user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  'count' as users_total,
  '%%' as '%%'
FROM communities_users
	JOIN communities ON communities.id = communities_users.community_id
;

# 3.3 
SELECT DISTINCT communities.id, communities.name,
  'count' as averag_users,
  'user_id' as min_old,
  'user_id' as max_old,
  COUNT(user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  (SELECT count(*) FROM users) as users_total,
  '%%' as '%%'
FROM communities_users
	JOIN communities ON communities.id = communities_users.community_id
	JOIN users ON users.id = communities_users.user_id
ORDER BY id
	;

# 3.4 
SELECT DISTINCT communities.id, communities.name,
  'count' as averag_users,
  'user_id' as min_old,
  'user_id' as max_old,
  COUNT(user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  (SELECT count(*) FROM users) as users_total,
  (COUNT(user_id) OVER(PARTITION BY communities_users.community_id) / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities ON communities.id = communities_users.community_id
	JOIN users ON users.id = communities_users.user_id
ORDER BY id
	;

# 3.5 минимальный и максимальный возраст
SELECT DISTINCT communities.id, communities.name,
  'count' as averag_users,
  MAX(profiles.birthday) OVER(PARTITION BY communities_users.community_id) as min_old,
  MIN(profiles.birthday) OVER(PARTITION BY communities_users.community_id) as max_old,
  COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  (SELECT count(*) FROM users) as users_total,
  (COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities ON (communities.id = communities_users.community_id)
	JOIN users ON (users.id = communities_users.user_id)
	JOIN profiles ON (communities_users.user_id=profiles.user_id)
ORDER BY id
	;


# 3.6 

SELECT DISTINCT communities.id, communities.name,
  'count' as averag_users,
  FIRST_VALUE(communities_users.user_id) OVER(PARTITION BY communities_users.community_id ORDER BY profiles.birthday DESC) as min_old,
  FIRST_VALUE(communities_users.user_id) OVER(PARTITION BY communities_users.community_id ORDER BY profiles.birthday) as max_old,
  COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  (SELECT count(*) FROM users) as users_total,
  (COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities ON (communities.id = communities_users.community_id)
	JOIN users ON (users.id = communities_users.user_id)
	JOIN profiles ON (communities_users.user_id=profiles.user_id)
ORDER by id
	;

# Контроль 
SELECT communities_users.*, profiles.birthday FROM communities_users 
	JOIN profiles ON (profiles.id = communities_users.user_id)
WHERE community_id=1;


# 3.7 среднее кол-во пользователей в группах 


SELECT DISTINCT communities.id, communities.name,
  (SELECT count(*) FROM communities) as averag_users,
  FIRST_VALUE(communities_users.user_id) OVER(PARTITION BY communities_users.community_id ORDER BY profiles.birthday DESC) as min_old,
  FIRST_VALUE(communities_users.user_id) OVER(PARTITION BY communities_users.community_id ORDER BY profiles.birthday) as max_old,
  COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) as in_communities,
  (SELECT count(*) FROM users) as users_total,  
  (COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities ON (communities.id = communities_users.community_id)
	JOIN users ON (users.id = communities_users.user_id)
	JOIN profiles ON (communities_users.user_id=profiles.user_id)
ORDER by id
;

# 3.7   
SELECT DISTINCT communities.id, communities.name,
  (SELECT count(*) FROM communities) as averag_users,
  FIRST_VALUE(communities_users.user_id) OVER w1 as min_old,
  FIRST_VALUE(communities_users.user_id) OVER w2 as max_old,
  COUNT(communities_users.user_id) OVER w3 as in_communities,
  (SELECT count(*) FROM users) as users_total,  
  (COUNT(communities_users.user_id) OVER w3 / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities ON (communities.id = communities_users.community_id)
	JOIN users ON (users.id = communities_users.user_id)
	JOIN profiles ON (communities_users.user_id=profiles.user_id)
WINDOW w1 AS (PARTITION BY communities_users.community_id ORDER BY profiles.birthday DESC),
       w2 AS (PARTITION BY communities_users.community_id ORDER BY profiles.birthday),
       w3 AS (PARTITION BY communities_users.community_id)
ORDER by id
;