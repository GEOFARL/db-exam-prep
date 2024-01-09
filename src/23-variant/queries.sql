-- На якій матеріально-відповідальній особі числиться
-- основних засобів на найбільшу суму.

SELECT
	CONCAT(rp.first_name, ' ', rp.last_name) as responsible_person,
	COUNT(fa.asset_id) AS number_of_assets,
	SUM(fa.original_cost) AS total_cost
from
	fixed_asset fa
JOIN responsible_person rp ON
	rp.person_id = fa.person_id
GROUP BY
	responsible_person
ORDER BY
	total_cost DESC
LIMIT 1;


-- Які основні засоби прийняті,
-- але не введенні у експлуатацію.

SELECT
	*
FROM
	fixed_asset fa
WHERE
	asset_id NOT IN (
	SELECT
		fa.asset_id
	FROM
		fixed_asset fa
	JOIN document d ON
		d.asset_id = fa.asset_id
	JOIN document_type dt ON
		d.type_id = dt.type_id
	WHERE
		dt.name = 'Акт введення у експлуатацію'
);

-- Визначити підрозділ, в якому списано найбільшу кількість
-- основних засобів, первинна вартість яких
-- перевищує середню по підприємству.

SELECT
	d.name,
	COUNT(fa.asset_id) AS number_of_write_off_assets
FROM
	fixed_asset fa
JOIN department d ON
	d.department_id = fa.department_id
JOIN document d2 ON
	d2.asset_id = fa.asset_id
JOIN document_type dt ON
	d2.type_id = dt.type_id
	AND dt.name = 'Cписання'
WHERE
	fa.original_cost > (
	SELECT
		AVG(original_cost)
	FROM
		fixed_asset)
GROUP BY d.name
ORDER BY number_of_write_off_assets DESC
LIMIT 1;

-- Визначити підрозділ, в який в минулому році було
-- закуплено більшу кількість основних засобів ніж списано.
SELECT
	d2.name as department_name,
	dt.name as document_type,
	COUNT(*) AS number_of_documents
FROM
	fixed_asset fa
JOIN document d ON
	d.asset_id = fa.asset_id
JOIN department d2 ON
	d2.department_id = fa.department_id
JOIN document_type dt ON
	d.type_id = dt.type_id
	AND dt.name IN ('Cписання', 'Акт введення у експлуатацію')
GROUP BY
	department_name,
	document_type
HAVING
	(
	SELECT
		COUNT(*) AS number_of_documents
	FROM
		fixed_asset fa1
	JOIN document d1 ON
		d1.asset_id = fa1.asset_id
	JOIN department d3 ON
		d3.department_id = fa1.department_id
		AND d3.name = department_name
	JOIN document_type dt1 ON
		d1.type_id = dt1.type_id
		AND dt1.name IN ('Cписання')
	GROUP BY
		d3.name,
		dt1.name) < (
	SELECT
		COUNT(*) AS number_of_documents
	FROM
		fixed_asset fa2
	JOIN document d2 ON
		d2.asset_id = fa2.asset_id
	JOIN department d4 ON
		d4.department_id = fa2.department_id
		AND d4.name = department_name
	JOIN document_type dt2 ON
		d2.type_id = dt2.type_id
		AND dt2.name IN ('Акт введення у експлуатацію')
	GROUP BY
		d4.name,
		dt2.name);
		
-- Визначити перелік основних засобів, котрі є в наявності
-- на підприємстві, первинна вартість яких перевищує середню по пдприємству.
	
SELECT * FROM fixed_asset fa WHERE fa.asset_id NOT IN (
SELECT
	fa.asset_id
FROM
	fixed_asset fa
JOIN document d ON
	d.asset_id = fa.asset_id
JOIN document_type dt ON
	dt.type_id = d.type_id
	AND dt.name = 'Cписання'
) HAVING fa.original_cost > (SELECT AVG(original_cost) FROM fixed_asset);

