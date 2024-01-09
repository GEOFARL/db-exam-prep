DROP FUNCTION IF EXISTS fn_has_less_than_4_classes;

DELIMITER //

CREATE FUNCTION fn_has_less_than_4_classes(p_class_number CHAR) RETURNS BOOLEAN DETERMINISTIC
BEGIN
	DECLARE v_valid BOOLEAN DEFAULT TRUE;
	SELECT COUNT(*) < 4 INTO v_valid FROM class WHERE LEFT(class_name, 1) = p_class_number;
	RETURN v_valid;
END//


DELIMITER ;

DROP TRIGGER IF EXISTS tr_before_insert_class;

DELIMITER //

CREATE TRIGGER tr_before_insert_class BEFORE INSERT ON class FOR EACH ROW 
BEGIN 
	IF NOT fn_has_less_than_4_classes(LEFT(NEW.class_name, 1)) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Not allowed to create more than 4 classes of the same type';
	END IF;
	
END//

DELIMITER ;

INSERT INTO class (class_name, school_id) VALUES
('4-А', 1);


