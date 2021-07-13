/*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”
Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:
1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).

2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.*/


-- Выберем пользователя Yoshiko	Greenfelder id = 1


-- выбираем всех друзей пользователя
 USE vk_20210918;


-- 2. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем
-- запрос выводит id пользователя, который больше всего общался с нашим пользователем
SELECT reciever_id FROM messages WHERE reciever_id IN (SELECT friend_id FROM friendship WHERE user_id =1)
	GROUP BY reciever_id
		-- сортируем по убыванию (максимальное вверху)
	ORDER BY COUNT(1) DESC 
		-- выбираем первого
	LIMIT 1;

	
			
-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT count(from_user_id) 
	FROM likes WHERE like_type_id = 1 AND from_user_id IN (
		SELECT * FROM (
			SELECT user_id FROM profiles
				ORDER BY birthday DESC
				LIMIT 10) AS my_users
);



-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT IF (
	(SELECT count(id) 
		FROM likes l 
			WHERE like_type_id =1 
				AND 
			from_user_id IN (
				SELECT id FROM profiles  WHERE gender ='M')
	)
>
	(SELECT count(id) 
		FROM likes l 
			WHERE like_type_id =1 
				AND 
			from_user_id IN (
				SELECT id FROM profiles  WHERE gender ='F')
	),
	'Male','Female'); 


-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- будем искать минимальную сумму трех значений: меньше всего лайков, меньше всего друзей, меньше всего сообщений

WITH T AS ( -- формируем сводную таблицу всех активностей пользователя колонки - user_id и num - количество активности 
	SELECT sender_id AS user_id, count(*) AS sum_activities FROM messages	-- минимум отправленных сообщений 	
	GROUP BY sender_id
	UNION ALL
	SELECT reciever_id AS user_id, count(*) FROM messages -- минимум полученных сообщений /добавляем в набор
	GROUP BY reciever_id
	UNION ALL
	SELECT user_id, count(*) FROM friendship -- минимум друзей /добавляем в набор 
	GROUP BY user_id 
	UNION ALL
	SELECT from_user_id AS user_id, count(*) FROM likes-- минимум лайков /добавляем в набор 
	GROUP BY from_user_id 
/*
	UNION ALL
	SELECT user_id, count(*) FROM communities_users
	GROUP BY user_id
*/
)
SELECT * FROM T
GROUP BY user_id
ORDER BY sum_activities 
LIMIT 10
;


