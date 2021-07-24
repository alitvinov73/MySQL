/*������������ ������� �� ���� ������������������ MySQL� (��� ���� ��������� �� ������ �������)*/

USE shop;
/*1)�������� ���� ������������� ������� ����� ������ � ���� ������ shop. 
������� ������������ shop_read ������ ���� �������� ������ ������� �� ������ ������, 
������� ������������ shop � ����� �������� � �������� ���� ������ shop.*/

DROP USER IF EXISTS shop;
CREATE USER shop IDENTIFIED WITH sha256_password BY '123';
GRANT ALL ON shop.* TO shop;

DROP USER IF EXISTS shop_read;
CREATE USER shop_read IDENTIFIED WITH sha256_password BY '123';
GRANT SELECT ON shop.* TO shop_read;

/*2)(�� �������) ����� ������� ������� accounts ���������� ��� ������� id, name, password, 
���������� ��������� ����, ��� ������������ � ��� ������. 
�������� ������������� username ������� accounts, ��������������� ������ � ������� id � name. 
�������� ������������ user_read, ������� �� �� ���� ������� � ������� accounts, ������
, ��� �� ��������� ������ �� ������������� username.*/

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR (50),
	password VARCHAR(50)
);

DROP VIEW IF EXISTS username;
CREATE VIEW username(id, name) AS
SELECT id, name FROM accounts;

DROP USER IF EXISTS shop_read;
CREATE USER shop_read;
GRANT SELECT ON shop.accounts TO shop_read;