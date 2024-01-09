-- Вивести предмети через кому, котрі мають більшу кількість годин
-- вивчення в 7 класі ніж в 6-му. Врахувати ситуацію, що
-- предмет в 6-му класі міг не вивчатися.

SELECT
	s.subject_name,
	si.number_of_hours,
	LEFT(c.class_name,
	1) AS class_number
FROM
	subject s
JOIN schedule_item si ON
	si.subject_id = s.subject_id
JOIN class c ON
	si.class_id = c.class_id
	AND LEFT(c.class_name,
	1) IN ('6', '7')
HAVING
	(
	IFNULL((SELECT
		si1.number_of_hours
FROM
		subject s1
JOIN schedule_item si1 ON
		si1.subject_id = s1.subject_id
JOIN class c1 ON
		si1.class_id = c1.class_id
	AND LEFT(c1.class_name,
		1) IN ('6', '7')
WHERE
	s1.subject_name = s.subject_name 
	AND LEFT(c1.class_name,
		1) = 7 LIMIT 1), -1) > IFNULL((SELECT
		si2.number_of_hours
FROM
		subject s2
JOIN schedule_item si2 ON
		si2.subject_id = s2.subject_id
JOIN class c2 ON
		si2.class_id = c2.class_id
	AND LEFT(c2.class_name,
		1) IN ('6', '7')
WHERE
	subject_name = s2.subject_name 
	AND LEFT(c2.class_name,
		1) = 6 LIMIT 1), 0));
	
-- Класи, що вивчають найбільшу кількість предметів, серед яких обовʼязково є
-- «польська мова».
SELECT
	c.class_name,
	COUNT(si.subject_id) AS number_of_subjects
FROM
	schedule_item si
JOIN subject s ON
	s.subject_id = si.subject_id
JOIN class c ON c.class_id = si.class_id
GROUP BY
	si.class_id
HAVING
	si.class_id IN (
	SELECT
		DISTINCT class_id
	FROM
		schedule_item si1
	JOIN subject s1 ON
		si1.subject_id = s1.subject_id
		AND s1.subject_name = 'польська мова')
ORDER BY number_of_subjects DESC;

-- Визначити вчителя, що читає
-- найбільшу кількість предметів у 5-7 класах

SELECT
	CONCAT(t.first_name, ' ', t.last_name) AS teacher_name,
	COUNT(si.subject_id) AS number_of_subjects
FROM
	teacher t
JOIN schedule_item si ON
	si.teacher_id = t.teacher_id
JOIN class c ON
	c.class_id = si.class_id
	AND LEFT(c.class_name,
	1) IN ('5', '6', '7')
GROUP BY
	teacher_name
ORDER BY
	number_of_subjects DESC
LIMIT 1;

-- Кабінет, у якому проводиться найбільша кількість
-- уроків за розкладом

SELECT
	sr.room_name,
	COUNT(si.subject_id) AS number_of_subjects
FROM
	schedule_item si
JOIN study_room sr ON
	si.room_id = sr.room_id
GROUP BY
	sr.room_id
ORDER BY
	number_of_subjects DESC
LIMIT 1;




