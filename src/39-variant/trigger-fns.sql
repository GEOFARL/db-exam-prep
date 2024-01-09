DROP FUNCTION IF EXISTS fn_has_3_changes;

DELIMITER //

CREATE FUNCTION fn_has_3_changes(p_document_id INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
	DECLARE v_has_3_changes BOOLEAN DEFAULT FALSE;
	SELECT COUNT(*) >= 3 INTO v_has_3_changes FROM document_change dc WHERE document_id = p_document_id;
	RETURN v_has_3_changes;
END//

DELIMITER ;


DROP TRIGGER IF EXISTS tr_before_insert_document_change;

DELIMITER //

CREATE TRIGGER tr_before_insert_document_change BEFORE INSERT ON document_change FOR EACH ROW
BEGIN
	IF fn_has_3_changes(NEW.document_id) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Already contains 3 changes';
	END IF;
END//

DELIMITER ;

INSERT INTO document_change (change_date, change_type, new_value, document_id) VALUES
('2021-01-05', 'Місце зберігання', 'Storage_A', 9);