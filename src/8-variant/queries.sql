-- Для кожного клієнта обчислити суму оплати міжміських 
-- розмов. 
SELECT
	CONCAT(c1.first_name, ' ', c1.last_name) AS caller_name,
	ct1.name AS origin_city,
	SUM((TIMESTAMPDIFF(SECOND, pc.start_time, pc.end_time) / cost.duration * cost.cost) * (1 - IFNULL(d.percent, 0))) AS total_cost
FROM
	client c1
JOIN phone_call pc ON
	pc.caller_id = c1.client_id
JOIN client c2 ON
	pc.receiver_id = c2.client_id
JOIN city ct1 ON
	c1.city_id = ct1.city_id
JOIN city ct2 ON
	c2.city_id = ct2.city_id
JOIN city_rate ctr ON
	ctr.origin_city_id = ct1.city_id
	AND ctr.destination_city_id = ct2.city_id
JOIN cost ON
	cost.cost_id = ctr.cost_id
LEFT JOIN discount d ON
	d.start_time <= TIME(pc.start_time)
	AND d.end_time >= TIME(pc.start_time)
WHERE
	ct1.name != ct2.name
GROUP BY
	caller_name,
	origin_city
ORDER BY
	total_cost DESC;

-- Визначити місто, з яким найчастіше розмовляють клієнти
SELECT
	ct2.name AS destination_city,
	COUNT(*) AS number_of_phone_calls
FROM
	client c1
JOIN phone_call pc ON
	pc.caller_id = c1.client_id
JOIN client c2 ON
	pc.receiver_id = c2.client_id
JOIN city ct1 ON
	c1.city_id = ct1.city_id
JOIN city ct2 ON
	c2.city_id = ct2.city_id
GROUP BY destination_city
ORDER BY number_of_phone_calls DESC
LIMIT 1;

-- Визначити клієнта, який розмовляє телефоном частіше і 
-- довше інших
SELECT
	CONCAT(c1.first_name, ' ', c1.last_name) AS caller_name,
	SUM(TIMESTAMPDIFF(SECOND, pc.start_time, pc.end_time)) AS calling_time,
	COUNT(*) AS number_of_calls
FROM
	client c1
JOIN phone_call pc ON
	pc.caller_id = c1.client_id
JOIN client c2 ON
	pc.receiver_id = c2.client_id
JOIN city ct1 ON
	c1.city_id = ct1.city_id
JOIN city ct2 ON
	c2.city_id = ct2.city_id
GROUP BY
	caller_name
ORDER BY
	calling_time DESC,
	number_of_calls DESC
LIMIT 1;

-- Визначити час доби, на який припадає найбільше розмов. 
SELECT res.day_period, COUNT(*) AS number_of_calls FROM (SELECT
	CASE
		WHEN HOUR(pc.start_time) > 23 OR HOUR(pc.start_time) < 4 THEN 'Night'
		WHEN HOUR(pc.start_time) >= 4 AND HOUR(pc.start_time) < 12 THEN 'Morning'
		WHEN HOUR(pc.start_time) >= 12 AND HOUR(pc.start_time) <= 16 THEN 'Day'
		ELSE 'Evening'
	END AS day_period
FROM
	client c1
JOIN phone_call pc ON
	pc.caller_id = c1.client_id
JOIN client c2 ON
	pc.receiver_id = c2.client_id) res
GROUP BY res.day_period;

-- Визначити день, коли телефонна лінія була зайнята 
-- найменше
SELECT
	DATE(pc.start_time) as call_date,
	COUNT(*) AS number_of_calls
FROM
	client c1
JOIN phone_call pc ON
	pc.caller_id = c1.client_id
JOIN client c2 ON
	pc.receiver_id = c2.client_id
GROUP BY
	call_date
ORDER BY
	number_of_calls ASC
LIMIT 1;