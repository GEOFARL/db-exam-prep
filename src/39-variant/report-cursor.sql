DROP PROCEDURE IF EXISTS pr_generate_report;

DELIMITER //

CREATE PROCEDURE pr_generate_report()
BEGIN
	DECLARE v_document_name VARCHAR(50);
	DECLARE v_theme_name VARCHAR(50);
	DECLARE v_quantity INT;
	DECLARE v_saving_item_count INT;

	DECLARE done BOOLEAN DEFAULT FALSE;
	
	DECLARE report_cursor CURSOR FOR
        SELECT
			d.document_name,
			dt.name as theme_name,
			d.quantity,
			COUNT(r.rack_id) AS saving_item_count
		FROM
			document d
		JOIN document_theme dt ON
			dt.document_theme_id = d.document_theme_id
		JOIN rack_document rd ON rd.document_id = d.document_id
		JOIN rack r ON rd.rack_id = r.rack_id
		GROUP BY d.document_name, dt.name, d.quantity ORDER BY theme_name;
       
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
    OPEN report_cursor;
   
    report_loop: LOOP
        FETCH report_cursor INTO v_document_name, v_theme_name, v_quantity, v_saving_item_count;

        IF done THEN
            LEAVE report_loop;
        END IF;

        SELECT v_document_name, v_theme_name, v_quantity, v_saving_item_count;

    END LOOP;

    CLOSE report_cursor;
END//

DELIMITER ;

CALL pr_generate_report(); 
