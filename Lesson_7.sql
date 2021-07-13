/*
���� �������� ��������
*/

USE shop;

/* ���������� ��������� �������
DESC orders ;
INSERT INTO orders (user_id) VALUES (1),(1),(1),(2),(3);
DESC orders_products ;
INSERT INTO orders_products (order_id,product_id,total) VALUES (1,1,1),(1,2,2),(2,1,3),(4,4,3),(5,7,1),(6,6,2),(7,5,3),(8,7,3);
*/

-- ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
SELECT name FROM users U
	WHERE EXISTS(SELECT 1 FROM orders WHERE user_id = U.id);


-- �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

SELECT  P.name AS product_name,
		C.name AS catalog_name
	FROM products AS P
	INNER JOIN catalogs AS C on C.id = P.catalog_id;

 /*��� �������� ������ ���� ������
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '�������� �������',
  UNIQUE unique_name(name(10))
) COMMENT = '������� ��������-��������';

INSERT INTO catalogs VALUES
  (NULL, '����������'),
  (NULL, '����������� �����'),
  (NULL, '����������'),
  (NULL, '������� �����'),
  (NULL, '����������� ������');

DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '�������� �������'
) COMMENT = '������� ��������-��������';

INSERT INTO rubrics VALUES
  (NULL, '����������'),
  (NULL, '������');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-14'),
  ('����', '1998-01-12'),
  ('�����', '1992-08-29');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  desription TEXT COMMENT '��������',
  price DECIMAL (11,2) COMMENT '����',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = '�������� �������';

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 7890.00, 1),
  ('Intel Core i5-7400', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 12700.00, 1),
  ('AMD FX-8320E', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 4780.00, 1),
  ('AMD FX-8320', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', '����������� ����� ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', '����������� ����� Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', '����������� ����� MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '������';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT '���������� ���������� �������� �������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ ������';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT '�������� ������ �� 0.0 �� 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = '������';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';
*/


/*(�� �������) ����� ������� ������� ������ flights (id, from, to) 
� ������� ������� cities (label, name). 
���� from, to � label �������� ���������� �������� �������, 
���� name � �������. 
�������� ������ ������ flights � �������� ���������� �������*/

DROP DATABASE IF EXISTS airlogs;
CREATE DATABASE airlogs;
USE airlogs;


CREATE TABLE cities (
	label VARCHAR(100) PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);
INSERT INTO cities(label, name)
VALUES ('moscow','������'),('irkutsk','�������'),
	  ('novgorod','��������'),('kazan','������'),
	  ('omsk','����'),('orsk','����');

CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(100) NOT NULL,
	`to` VARCHAR(100) NOT NULL
);


ALTER TABLE flights
ADD CONSTRAINT fk_from
FOREIGN KEY (`from`)
REFERENCES cities (label)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE flights
ADD CONSTRAINT fk_to
FOREIGN KEY (`to`)
REFERENCES cities (label)
ON DELETE CASCADE
ON UPDATE CASCADE;



INSERT INTO flights(`from`, `to`)
VALUES ('moscow','omsk'),('irkutsk','kazan'),
	  ('irkutsk','moscow'),('omsk','irkutsk'),
	  ('moscow','kazan'),('orsk','moscow');



SELECT C.name AS `from`, C1.name as `to`
FROM flights F
INNER JOIN cities C ON C.label = F.`from`
INNER JOIN cities C1 ON C1.label = F.`to`
ORDER BY F.id

