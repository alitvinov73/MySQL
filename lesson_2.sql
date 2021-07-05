/*
Практическое задание по теме “Управление БД”
1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.

2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

DROP TABLES IF EXISTS  users;
CREATE TABLE users(
id SERIAL,
name VARCHAR(100)
);

-- команды для создания дампа, через консоль Windows
-- mysqldump -u root -p example > example.sql

-- создание новой базы данных sample
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

-- команды для заполнение новой базы данных из дампа через консоль Windows
-- mysqldump -u root -p sample < example.sql

-- Создание дампа с лимитом строк
-- mysqldump -u root -p --where="true limit 100" help_keyword > help_keyword.sql