-- Перелік маршрутів з вказанням кількості водіїв на маршруті, де кількість зупинок
-- більша 10.

SELECT
	res.route_number,
	res.start_time,
	res.end_time,
	res.number_of_stops,
	COUNT(d.driver_id) AS number_of_drivers
FROM
	(
	SELECT
		r.route_id,
		r.route_number,
		r.start_time,
		r.end_time,
		COUNT(s.location) AS number_of_stops
	FROM
		route r
	JOIN route_stop rs ON
		rs.route_id = r.route_id
	JOIN stop s ON
		s.stop_id = rs.stop_id
	GROUP BY
		r.route_id
	HAVING
		number_of_stops > 10
	ORDER BY
		number_of_stops DESC
) res
JOIN driver d ON
	d.route_id = res.route_id
GROUP BY
	res.route_number;
	

-- Маршрут, на якому водії провели більше всього часу
-- (різниця часу закінчення та початку роботи на маршруті), за останню декаду.
SELECT
	r.route_number,
	SUM(TIMESTAMPDIFF(SECOND,
	time_start_work,
	time_end_work)) AS time_spent
FROM
	schedule s
JOIN driver d ON
	s.driver_id = d.driver_id
JOIN route r ON
	r.route_id = d.route_id
WHERE
	time_start_work > NOW() - INTERVAL 10 DAY
GROUP BY
	route_number
ORDER BY
	time_spent DESC
LIMIT 1;

-- Кількість водіїв, у яких прізвище починається на «Ак», що не були на маршрутах
-- попередні 2 місяці

SELECT
	COUNT(*) AS number_of_drivers
FROM
	(
	SELECT
		d.driver_id
	FROM
		driver d
	LEFT JOIN schedule s ON
		s.driver_id = d.driver_id
		AND s.time_start_work < NOW() - INTERVAL 2 MONTH
	WHERE
		first_name LIKE 'Ак%'
	GROUP BY
		driver_id) res;
		
	
-- Визначити водія, котрий в останній рік працював як на найдовшому, так і
-- найкоротшому маршрутах.
	
SELECT
	CONCAT(d.first_name, ' ', d.middle_name, ' ', d.last_name) AS driver_name,
	res.route_number,
	'Найдовший маршрут' AS route_desc
FROM
	driver d
JOIN (
	SELECT
		r.route_id,
		r.route_number,
		COUNT(rs.stop_id) as number_of_stops
	FROM
		route_stop rs
	JOIN route r ON r.route_id = rs.route_id
	GROUP BY
		route_id
	ORDER BY
		number_of_stops DESC
	LIMIT 1) res ON res.route_id = d.route_id
UNION
SELECT
	CONCAT(d.first_name, ' ', d.middle_name, ' ', d.last_name) AS driver_name,
	res.route_number,
	'Найкоротший маршрут' AS route_desc
FROM
	driver d
JOIN (
	SELECT
		r.route_id,
		r.route_number,
		COUNT(rs.stop_id) as number_of_stops
	FROM
		route_stop rs
	JOIN route r ON r.route_id = rs.route_id
	GROUP BY
		route_id
	ORDER BY
		number_of_stops ASC
	LIMIT 1) res ON res.route_id = d.route_id;