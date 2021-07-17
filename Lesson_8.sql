-- 1. �������� ����������� ������� ����� ��� ���� ������ ���� ������ vk (��������� �������)

USE vk;

ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ADD CONSTRAINT profiles_photo_id_fk
		FOREIGN KEY (photo_id) REFERENCES media(id)
			ON DELETE SET NULL;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ADD CONSTRAINT communities_users_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;

ALTER TABLE friendship
	ADD CONSTRAINT friendship_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ADD CONSTRAINT friendship_friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;

-- ����� �������� ��������, ���� ��� ����������� �� ������ �������� �� ����� ������� SET NULL		
ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE   
			ON UPDATE CASCADE,
	ADD CONSTRAINT likes_like_types_id_fk
		FOREIGN KEY (like_type_id) REFERENCES like_types(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
		
ALTER TABLE media
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE  -- �������� ��������, SET NULL ���� �� ������ ����� ����� ������������ 
			ON UPDATE CASCADE,
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
		
/* ������� ����������� ������ ��������� �������� �������������,
 * �� ���� ������: ���� ������������� �� ����� ���� ���������� ������ ��������� 
 * ��������� ��� � ���������� � ����������� NULL
 */
ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id)
			ON DELETE SET NULL
			ON UPDATE CASCADE,
	ADD CONSTRAINT messages_to_user_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id)
			ON DELETE SET NULL
			ON UPDATE CASCADE;		

/***********************************************************
 * 
 * 3 ���������� �������, �������� � �� 6 � �������������� JOIN(4 �������)
 * 
 * 
 * 
 *************************************************************/ 

-- ����� ����� ��������� ������������.
-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� ��������������.

WITH T AS (
	SELECT to_user_id AS best_friend_id FROM messages WHERE from_user_id = 1
	union ALL
	SELECT from_user_id  FROM messages WHERE to_user_id = 1
)
SELECT U.fullname, count(*) as rate FROM T
	INNER JOIN users U 
		ON U.id = T.best_friend_id
GROUP BY best_friend_id
ORDER BY rate DESC
LIMIT 1;

-- 3) ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
WITH YU AS -- Young Users 
(
	SELECT id FROM users U
	  INNER JOIN profiles P 
	  	ON P.user_id = U.id
	ORDER BY P.birthday
	LIMIT 10
)
SELECT count(L.id) 
FROM likes L
	LEFT JOIN like_types LTU ON LTU.id = L.like_type_id AND LTU.name = 'user'
	LEFT JOIN YU YUU ON YUU.id = L.target_id 
	
	LEFT JOIN like_types LTMD ON LTMD.id = L.like_type_id AND LTMD.name = 'media'
	LEFT JOIN media MD ON MD.id = L.target_id
	
	LEFT JOIN like_types LTMS on LTMS.id = L.like_type_id and LTMS.name = 'massage'
	LEFT JOIN messages MS on MS.id = L.target_id
	
	INNER JOIN YU ON YU.id in (YUU.id, MD.user_id, MS.from_user_id) 


-- 4) ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
SELECT sex FROM (
	SELECT sex, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) as gender_likes_count FROM profiles as P
	WHERE sex = 'm'
	GROUP BY sex
	UNION ALL
	SELECT sex, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) FROM profiles as P
	WHERE sex = 'f'
	GROUP BY sex
) AS T
GROUP BY sex
ORDER BY MAX(gender_likes_count) DESC
LIMIT 1;


-- 5) ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.

WITH T AS (
	SELECT from_user_id as user_id, COUNT(*) as rnk  FROM messages -- ���������� ������������ ���� ���������� ���������
	GROUP BY from_user_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM likes -- ���������� ������������ ���� �������
	GROUP BY user_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM friendship -- � ������ � ����� ������������� ����
	GROUP BY user_id
	UNION ALL
	SELECT friend_id, COUNT(*)  FROM friendship 
	GROUP BY friend_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM communities_users
	GROUP BY user_id
)
SELECT fullname,  SUM(T.rnk) AS rnk
FROM T
	INNER JOIN users U on U.id = T.user_id
GROUP BY fullname
ORDER BY rnk
LIMIT 10;