-- Для зазначеного міста визначити назви тез доповідей, котрі надійшли минулого
-- місяця і оплата по котрим була раніше дати надання тез.
SELECT
	p.first_name,
	p.last_name,
	p2.participant_id,
	a.city,
	a.country,
	t.name
FROM
	address a
JOIN person p ON
	p.address_id = a.address_id
JOIN participant p2 ON
	p2.person_id = p.person_id
JOIN participant_thesis pt ON pt.participant_id = p2.participant_id
JOIN thesis t ON t.thesis_id = pt.thesis_id
JOIN contribution c ON
	p2.participant_id = c.participant_id
	AND c.created_at = (
	SELECT
		MAX(created_at)
	FROM
		contribution c2
	WHERE
		c2.participant_id = c.participant_id)
WHERE
	a.city = 'Kyiv'
	AND t.submission_date > NOW() - INTERVAL 1 MONTH
	AND t.submission_date < c.created_at;
	

-- Вивести учасників,котрі подали більше 3 тез ( можливо в співавторстві ) 
-- та не були в розсилці першого запрошення.
SELECT
	p2.first_name,
	p2.last_name,
	COUNT(t.name) AS theses_count
FROM
	participant p
JOIN person p2 ON
	p2.person_id = p.person_id
JOIN participant_thesis pt ON
	pt.participant_id = p.participant_id
JOIN thesis t ON
	t.thesis_id = pt.thesis_id
WHERE (
	SELECT
		COUNT(*)
	FROM
		participant p3
	JOIN person p4 ON
		p4.person_id = p3.person_id
	JOIN invitation i ON
		i.for_person_id = p4.person_id
	WHERE
		p3.participant_id = p.participant_id
		AND order_number = 1) = 0
GROUP BY
	p2.first_name,
	p2.last_name
HAVING
	theses_count > 3
ORDER BY
	theses_count DESC;


-- Визначити місто, з якого була найбільша кількість
-- учасників, котрі мали більше 3 доповідей
SELECT
	res.city,
	COUNT(*) AS participant_count
FROM
	(
	SELECT
		p.first_name,
		p.last_name,
		a.city,
		COUNT(p3.topic) AS topic_count
	FROM
		person p
	JOIN address a ON
		p.address_id = a.address_id
	JOIN participant p2 ON
		p2.person_id = p.person_id
	JOIN presentation p3 ON
		p3.participant_id = p2.participant_id
	GROUP BY
		p.first_name,
		p.last_name,
		a.city
	HAVING
		topic_count > 3
	ORDER BY
		topic_count DESC
) res
GROUP BY
	res.city
ORDER BY
	participant_count DESC
LIMIT 1;


-- Визначити місце роботи, з котрого була найбільша кількість учасників,
-- котрі не сплатили оргвнесок вчасно.
SELECT
	w.name as workplace_name,
	COUNT(*) AS workplace_count
FROM
	person p
JOIN participant p2 ON
	p.person_id = p2.participant_id
JOIN contribution c ON
	c.participant_id = p2.participant_id
JOIN workplace w ON
	w.workplace_id = p.workplace_id
WHERE
	c.created_at = (
	SELECT
		MAX(c2.created_at)
	FROM
		contribution c2
	WHERE
		c2.participant_id = p2.participant_id)
	AND c.created_at > '2023-12-14'
GROUP BY
	w.name
HAVING
	workplace_count = (
	SELECT
		MAX(res.workplace_count)
	FROM
		(
		SELECT
			w.name as workplace_name,
			COUNT(*) AS workplace_count
		FROM
			person p
		JOIN participant p2 ON
			p.person_id = p2.participant_id
		JOIN contribution c ON
			c.participant_id = p2.participant_id
		JOIN workplace w ON
			w.workplace_id = p.workplace_id
		WHERE
			c.created_at = (
			SELECT
				MAX(c2.created_at)
			FROM
				contribution c2
			WHERE
				c2.participant_id = p2.participant_id)
			AND c.created_at > '2023-12-14'
		GROUP BY
			w.name) res);