-- Визначити список документів, котрі
-- були незатребувані останні 5 років.

SELECT
	d.document_name 
FROM
	document d
LEFT JOIN records r ON
	r.document_id = d.document_id
	AND r.issue_date > NOW() - INTERVAL 5 YEAR
WHERE record_id IS NULL;

-- За минулий квартал вивести абонентів архіву,
-- котрі належать відділу, в котрого найбільша
-- кількість документів зберігається в архіві.
WITH cte AS (
SELECT
		d.department_id
FROM
		department d
JOIN rack r ON
		r.department_id = d.department_id
JOIN rack_document rd ON
		rd.rack_id = r.rack_id
GROUP BY
		department_id
ORDER BY
		COUNT(document_id) desc
LIMIT 1)
SELECT
	CONCAT(s.first_name, ' ', s.middle_name, ' ', s.last_name) AS subscriber_name
FROM
	subscriber s
WHERE
	s.department_id IN (
	select
		*
	from
		cte);
		
-- Вивести теми документів, котрі змінювали місце
-- зберігання найбільшу кількість разів.
	
SELECT
	dt.name AS document_theme
FROM
	document d
JOIN document_theme dt ON
	dt.document_theme_id = d.document_theme_id
WHERE
	d.document_id IN (
	SELECT
		res.document_id
	FROM
		(
		SELECT
			d.document_id,
			COUNT(dc.change_id) AS number_of_changes
		FROM
			document d
		JOIN document_change dc ON
			dc.document_id = d.document_id
			AND dc.change_type = 'Місце зберігання'
		GROUP BY
			d.document_id
		HAVING
			number_of_changes = (
			SELECT
				COUNT(dc.change_id) AS number_of_changes
			FROM
				document d
			JOIN document_change dc ON
				dc.document_id = d.document_id
				AND dc.change_type = 'Місце зберігання'
			GROUP BY
				d.document_id
			ORDER BY
				number_of_changes DESC
			LIMIT 1)) res);

-- Вивести стелажі, котрі найбільш завантажені документами,
-- тема котрих закінчується на «ав» та надійшли в архів не
-- пізніше ніж 5 років тому.

SELECT
	r.serial_number,
	COUNT(rd.document_id) AS document_count
FROM
	rack r
JOIN rack_document rd ON
	rd.rack_id = r.rack_id
JOIN document d ON
	rd.document_id = d.document_id
	AND d.arrival_date > NOW() - INTERVAL 5 YEAR
JOIN document_theme dt ON
	d.document_theme_id = dt.document_theme_id
	AND dt.name LIKE '%ав'
GROUP BY
	r.rack_id
HAVING
	document_count = (
	SELECT
		COUNT(rd.document_id) AS document_count
	FROM
		rack r
	JOIN rack_document rd ON
		rd.rack_id = r.rack_id
	JOIN document d ON
		rd.document_id = d.document_id
		AND d.arrival_date > NOW() - INTERVAL 5 YEAR
	JOIN document_theme dt ON
		d.document_theme_id = dt.document_theme_id
		AND dt.name LIKE '%ав'
	GROUP BY
		r.rack_id
	ORDER BY
		document_count DESC
	LIMIT 1);

