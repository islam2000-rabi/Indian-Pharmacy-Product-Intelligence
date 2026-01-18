select * from med;

-- Dimention table view 1

CREATE VIEW dim_manufacturer AS
SELECT DISTINCT manufacturer_name FROM med ;

SELECT * FROM dim_manufacturer;

-- Dimention table view 2

CREATE VIEW dim_medicine_type AS
SELECT DISTINCT medicine_type FROM med;

SELECT * FROM dim_medicine_type; 

-- Fact table view

CREATE VIEW fact_table AS
SELECT
	id AS med_id,
	name AS med_name,
	price :: NUMERIC AS med_price,
	is_discontinued,
	manufacturer_name,
	medicine_type,
	CASE
		WHEN short_composition2 = 'Not Available' THEN short_composition1
		ELSE short_composition1 || ' + ' || short_composition2 
	END AS med_compositions
FROM med;

SELECT * FROM fact_table;

-- Dimention table view 3

CREATE VIEW dim_composition AS
SELECT DISTINCT med_compositions FROM fact_table;	

SELECT * FROM dim_composition;