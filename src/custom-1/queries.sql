-- Отримати список всіх товарів, ціна на які
-- менше 1000 гривень і є в наявності на складі.
SELECT * FROM product WHERE cost < 1000 AND is_in_stock = TRUE;

-- Вивести інформацію про всі замовлення,
-- зроблені за останній місяць, разом із
-- списком товарів у кожному замовленні.
SELECT
	o.order_id,
	o.created_at,
	p.name
FROM
	`order` o
	JOIN order_item oi ON oi.order_id = o.order_id
	JOIN product p ON oi.product_id = p.product_id 
WHERE
	o.created_at > NOW() - INTERVAL 1 MONTH;
	
-- Знайти клієнта, який здійснив найбільше замовлень
-- та визначити загальну суму його покупок.
WITH cte AS (
SELECT
	o.client_id,
	COUNT(o.order_id) AS number_of_orders
FROM
	`order` o
GROUP BY
	o.client_id
ORDER BY
	number_of_orders DESC
LIMIT 1)
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS client_name,
	cte.number_of_orders,
	SUM(oi.quantity * p.cost) AS total_cost
FROM
	cte
JOIN `order` o ON
	o.client_id = 10
JOIN order_item oi ON oi.order_id = o.order_id
JOIN product p ON p.product_id = oi.product_id
JOIN client c ON c.client_id = o.client_id
GROUP BY cte.client_id;

-- Отримати перелік товарів, які не були
-- замовлені протягом останнього кварталу.
SELECT
	p.name
FROM
	product p
LEFT JOIN order_item oi ON
	oi.product_id = p.product_id
LEFT JOIN `order` o ON
	o.order_id = oi.order_id
	AND o.created_at > NOW() - INTERVAL 3 MONTH
WHERE
	o.order_id IS NULL;