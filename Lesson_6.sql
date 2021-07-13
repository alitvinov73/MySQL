/*������������ ������� �� ���� ����������, ����������, ���������� � �����������. ��������� �������
�������� � �� vk � ��������� �������, ������� �� ������������� �����:
1. ���������������� �������, ������� ����������� �� �������, ���������� ��������� ������������� �/��� ��������� (JOIN ���� �� ���������).

2. ����� ����� ��������� ������������. 
�� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.
3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
4. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.*/


-- ������� ������������ Yoshiko	Greenfelder id = 1


-- �������� ���� ������ ������������
 USE vk_20210918;


-- 2. �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������
-- ������ ������� id ������������, ������� ������ ����� ������� � ����� �������������
SELECT reciever_id FROM messages WHERE reciever_id IN (SELECT friend_id FROM friendship WHERE user_id =1)
	GROUP BY reciever_id
		-- ��������� �� �������� (������������ ������)
	ORDER BY COUNT(1) DESC 
		-- �������� �������
	LIMIT 1;

	
			
-- 3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
SELECT count(from_user_id) 
	FROM likes WHERE like_type_id = 1 AND from_user_id IN (
		SELECT * FROM (
			SELECT user_id FROM profiles
				ORDER BY birthday DESC
				LIMIT 10) AS my_users
);



-- 4. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
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


-- 5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.
-- ����� ������ ����������� ����� ���� ��������: ������ ����� ������, ������ ����� ������, ������ ����� ���������

WITH T AS ( -- ��������� ������� ������� ���� ����������� ������������ ������� - user_id � num - ���������� ���������� 
	SELECT sender_id AS user_id, count(*) AS sum_activities FROM messages	-- ������� ������������ ��������� 	
	GROUP BY sender_id
	UNION ALL
	SELECT reciever_id AS user_id, count(*) FROM messages -- ������� ���������� ��������� /��������� � �����
	GROUP BY reciever_id
	UNION ALL
	SELECT user_id, count(*) FROM friendship -- ������� ������ /��������� � ����� 
	GROUP BY user_id 
	UNION ALL
	SELECT from_user_id AS user_id, count(*) FROM likes-- ������� ������ /��������� � ����� 
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


