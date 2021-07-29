/*������������ ������� �� ���� ��������� ��������� � �������, ��������"*/
DELIMITER //


/*
1)�������� �������� ������� hello(), ������� ����� ���������� �����������, 
� ����������� �� �������� ������� �����. 
� 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", 
� 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����",
� 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".
*/
SELECT "TASK 1"//
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE tme TIMESTAMP; 
    SELECT DATE_FORMAT(NOW(), "%d.%m.%Y") INTO tme;
    CASE 
        WHEN tme BETWEEN '06:00:00' AND '12:00:00' THEN RETURN "������ ����"; 
        WHEN tme BETWEEN '12:00:00' AND '18:00:00' THEN RETURN "������ ����"; 
		WHEN tme BETWEEN '18:00:00' AND '00:00:00' THEN RETURN "������ �����"; 
        ELSE RETURN "������ ����";  
    END CASE;
END//

/*
2)� ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������.
 ��������� ����������� ����� ����� ��� ���� �� ���. 
 ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
 ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
 ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.*/
SELECT "TASK 2"//
DROP PROCEDURE IF EXISTS throw_error_if_true;
CREATE PROCEDURE throw_error_if_true(IN val BOOLEAN)
BEGIN
     DECLARE msg VARCHAR(50) DEFAULT "Only one field maybe NULL";



    IF (val) THEN 
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = msg;
    END IF;
END//
   
DROP TRIGGER IF EXISTS check_products_insert_not_null_fields;
CREATE TRIGGER check_products_insert_not_null_fields BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    DECLARE chk BOOLEAN DEFAULT (NEW.name IS NULL AND NEW.description IS NULL);
    CALL throw_error_if_true(chk);
END//

DROP TRIGGER IF EXISTS check_products_update_not_null_fields;
CREATE TRIGGER check_products_update_not_null_fields BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    DECLARE chk BOOLEAN DEFAULT (NEW.name IS NULL AND NEW.description IS NULL);
    CALL throw_error_if_true(chk);

END//
  
 
 /*
 3)(�� �������) �������� �������� ������� ��� ���������� ������������� ����� ���������. 
 ������� ��������� ���������� ������������������ � ������� ����� ����� ����� ���� ���������� �����. 
 ����� ������� FIBONACCI(10) ������ ���������� ����� 55.*/
SELECT "TASK 3";
DROP FUNCTION IF EXISTS FIBONACCI; 
CREATE FUNCTION FIBONACCI(n INT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE p1 INT DEFAULT 1;
    DECLARE p2 INT DEFAULT 1;
    DECLARE i INT DEFAULT 2;
    DECLARE res INT DEFAULT 0;
   
    IF (n <= 1) THEN RETURN n;
    ELSEIF (n = 2) THEN RETURN 1;
    END IF;  
    WHILE i < n DO
        SET i = i + 1;
	SET res = p2 + p1;
        SET p2 = p1;
        SET p1 = res;
    END WHILE;
    RETURN res;
 END//
 
DELIMITER ;