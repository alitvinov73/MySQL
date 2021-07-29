/*������������ ������� �� ���� �����������, ����������, ��������������
1)� ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.*/


START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE shop.users.id = 1);
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-----------------------------------------------------------------------------------
/*2)�������� �������������, ������� ������� �������� name �������� ������� �� ������� products 
� ��������������� �������� �������� name �� ������� catalogs.*/
USE shop;
DROP VIEW IF EXISTS pretty_catalog;
CREATE VIEW pretty_catalog (product_name, catalog_name) AS
SELECT p.name, c.name FROM products p
	LEFT JOIN catalogs c ON c.id = p.catalog_id;

-----------------------------------------------------------------------------------
/*3) �� �������) ����� ������� ������� � ����������� ����� created_at. 
� ��� ��������� ���������� ����������� ������ �� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. 
��������� ������, ������� ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, 
���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.*/

DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (created_at DATETIME);
INSERT INTO test_table (created_at) 
VALUES ('2018-08-01'), ('2018-08-04'), ('2018-08-16'), ('2018-08-17'), ('2018-08-21'), ('2018-08-24');
SET @begindate := '2019-08-01';
WITH RECURSIVE T (dte, is_exist) AS 
(
SELECT @begindate,
       EXISTS(SELECT * FROM test_table WHERE created_at = @begindate)
UNION ALL
SELECT @begindate := @begindate + INTERVAL 1 DAY,
       EXISTS(SELECT * FROM test_table WHERE created_at = @begindate)
FROM T
WHERE @begindate < '2018-10-01'
)
SELECT * FROM T;
-----------------------------------------------------------------------------------

/*4)(�� �������) ����� ������� ����� ������� � ����������� ����� created_at. 
�������� ������, ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.*/
PREPARE delf FROM "DELETE FROM test_table ORDER BY created_at LIMIT ?";
SET @lim := (SELECT COUNT(*) -5 FROM test_table);
EXECUTE delf USING @lim;