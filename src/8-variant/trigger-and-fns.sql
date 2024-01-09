DROP FUNCTION IF EXISTS fn_already_has_start;

DELIMITER //

CREATE FUNCTION fn_already_has_start(p_route_id INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
	DECLARE v_exists BOOLEAN DEFAULT FALSE;
	SELECT 1 INTO v_exists FROM route_stop WHERE route_id = p_route_id AND is_start_stop = TRUE;
	RETURN v_exists;
END//

DELIMITER ;

DROP FUNCTION IF EXISTS fn_already_has_stop;

DELIMITER //

CREATE FUNCTION fn_already_has_stop(p_route_id INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
	DECLARE v_exists BOOLEAN DEFAULT FALSE;
	SELECT 1 INTO v_exists FROM route_stop WHERE route_id = p_route_id AND is_end_stop = TRUE;
	RETURN v_exists;
END//

DELIMITER ;


DROP TRIGGER tr_before_insert_route_stop;

DELIMITER //

CREATE TRIGGER tr_before_insert_route_stop BEFORE INSERT ON route_stop FOR EACH ROW
BEGIN 
	IF NEW.is_start_stop AND fn_already_has_start(NEW.route_id) THEN
		SIGNAL SQLSTATE '45000'
    	SET MESSAGE_TEXT = 'The start stop for this route already exists';
	ELSEIF NEW.is_end_stop AND fn_already_has_stop(NEW.route_id) THEN
		SIGNAL SQLSTATE '45000'
    	SET MESSAGE_TEXT = 'The end stop for this route already exists';
	END IF;
END //


DELIMITER ;

INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(1, 18, TRUE);