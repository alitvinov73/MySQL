use vk;
-- Проверяем данные 
SELECT phone from users LIMIT 10;

-- генерация случайного телефонного номера SELECT CONCAT('+7', convert(floor(Rand()*pow(10,10)),char));
-- Допустимы только номера телефонов вида +7<10 цифровых знаков>

-- Генерируем подходящие данные для номера телефонов
-- update users set phone = CONCAT('+7', 9000000000 + FLOOR(RAND()*9999999999)); 
-- SELECT concat('+7',substring(CONVERT(Rand(),char),3,10));

UPDATE users SET phone = concat('+7',substring(CONVERT(Rand(),char),3,10));
SELECT phone from users;

-- добавляем ограничение целостности - при добавлении или редактировании строки будет осущестляться контроль введенного значения в поле phone на соответствии формату чкерез функццию REGEXP_LIKE(поле, шаблан)
-- такие же ограничения целостности можно настроить для всех необходимых колонок (атрибутов)
ALTER TABLE users ADD CONSTRAINT phone_check CHECK (REGEXP_LIKE(PHONE, '^\\+7[0-9]{10}$'));
SELECT phone from users LIMIT 10;


-- Работа с метаданными
USE INFORMATION_SCHEMA;

SHOW TABLES;

DESC `TABLES`;

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'INFORMATION_SCHEMA';
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'vk';
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE  WHERE TABLE_SCHEMA = 'vk';

SELECT 
	TABLE_NAME,
	COLUMN_NAME,
	CONSTRAINT_NAME,
	REFERENCED_TABLE_NAME,
	REFERENCED_COLUMN_NAME
FROM 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
	TABLE_SCHEMA = 'vk'
    AND TABLE_NAME = 'profiles' 
    AND REFERENCED_COLUMN_NAME IS NOT NULL;

