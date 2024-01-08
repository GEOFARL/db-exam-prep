DROP PROCEDURE IF EXISTS pr_get_report;

DELIMITER //

CREATE PROCEDURE pr_get_report()
BEGIN
	DECLARE done INT DEFAULT FALSE;

	DECLARE v_participant_count INT;
	DECLARE v_participant_id INT;
	DECLARE v_person_id INT;
	DECLARE v_person_name VARCHAR(150);

	DECLARE v_last_contribution TIMESTAMP;
	DECLARE v_contribution_amount DECIMAL(12, 2);
	DECLARE v_contribution_count INT;
	DECLARE v_invitation_number TINYINT;
	DECLARE v_has_both_invitations BOOLEAN;

	DECLARE participant_cursor CURSOR FOR SELECT participant_id, person_id FROM participant;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	OPEN participant_cursor;

	FETCH participant_cursor INTO v_participant_id, v_person_id;

	SELECT COUNT(*) INTO v_participant_count FROM participant;
		
	WHILE (NOT done) DO
		SELECT
			COUNT(participant_id),
			MAX(created_at),
			SUM(amount) INTO
			v_contribution_count, v_last_contribution, v_contribution_amount
		FROM
			contribution c
		GROUP BY participant_id HAVING participant_id = v_participant_id;
	
		SELECT COUNT(*) = 2 INTO v_has_both_invitations FROM invitation i WHERE for_person_id = v_person_id;
	
		SELECT CONCAT(first_name, ' ', middle_name, ' ', last_name) INTO v_person_name FROM person WHERE person_id = v_person_id;
	
		IF NOT v_has_both_invitations THEN
			SELECT order_number INTO v_invitation_number FROM invitation WHERE for_person_id = v_person_id;
		END IF;
	
		SELECT v_participant_count AS total_participants,
			v_person_name AS participant_name,
			v_last_contribution AS date_of_last_contribution,
			v_contribution_count AS number_of_contributions,
			v_contribution_amount AS total_contribution_amount,
			IF(v_has_both_invitations, 'TRUE', 'FALSE') AS received_both_invitations,
			v_invitation_number AS invitation_number;
	
		FETCH participant_cursor INTO v_participant_id, v_person_id; 
	END WHILE;
END//

DELIMITER ;

call pr_get_report();
