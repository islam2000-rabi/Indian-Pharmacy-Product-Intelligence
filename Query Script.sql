select * from med;

-- Identify top manufacturers controlling the majority of medicine listings to assess supplier dependency risk.

SELECT 
	manufacturer_name,
	COUNT(name) total_product
FROM med
GROUP BY manufacturer_name
ORDER BY total_product DESC LIMIT 10;


-- Analyze price ranges, average pricing per manufacturer and identify premium vs budget product segments.

WITH price_range AS(
	SELECT 
	    manufacturer_name,
	    MIN(price) AS lowest_price_med,
	    MAX(price) AS highest_price_med,
	    ROUND(AVG(price)::NUMERIC, 2) AS avg_cost_med
	FROM med
	GROUP BY manufacturer_name
)
SELECT 
	*,
	ROUND(AVG(avg_cost_med) OVER() :: NUMERIC) AS overall_avg_cost,
	CASE 
		WHEN avg_cost_med > ROUND(AVG(avg_cost_med) OVER() :: NUMERIC) THEN 'Premium'
		ELSE 'Budget'
	END AS cost_segment
FROM price_range 
ORDER BY avg_cost_med DESC;

-- Measure the percentage of discontinued medicines and identify manufacturers or compositions with high discontinuation rates.

SELECT 
	is_discontinued,
	COUNT(*) AS total_count,
	ROUND((COUNT(*) / SUM(COUNT(*)) OVER()),2) * 100 AS percentage_of_total
FROM med
GROUP BY is_discontinued;

SELECT 
	manufacturer_name,
	COUNT (*) total_discontinued,
	ROUND(COUNT (*) / SUM(COUNT(*)) OVER(),2) * 100 per_discontinued
FROM med WHERE is_discontinued = 'true'
GROUP BY manufacturer_name
ORDER BY total_discontinued DESC LIMIT 10 ;

-- Substitute Mapping Potential – Identify therapeutically similar medicines based on compositions 
-- for recommendation and alternative sourcing strategies.

SELECT 
    CASE 
        WHEN short_composition2 = 'Not Available' THEN short_composition1
        ELSE short_composition1 || ' + ' || short_composition2
    END AS composition_signature,
    STRING_AGG(name, ', ') AS substitute_medicines,
    COUNT(*) AS total_brands
FROM med
GROUP BY composition_signature
HAVING COUNT(*) > 1
ORDER BY total_brands DESC;

-- Examine commonly used pack sizes and price differences across pack variations to optimize procurement.

SELECT 
	pack_size_label,
	COUNT(*) total_count,
	ROUND(AVG(price) :: NUMERIC,2) avg_price,
	MIN(price) min_price,
	MAX(price) max_price
FROM med
GROUP BY pack_size_label
ORDER BY total_count DESC;

-- Shows whether certain pack sizes inflate cost unnecessarily.

SELECT
	name,
	short_composition1,
	short_composition2,
	pack_size_label,
	price,
	ROUND(
	AVG(price) OVER(PARTITION BY short_composition1, short_composition2) :: NUMERIC ,2
	) avg_price_for_sm_composition
FROM med
ORDER BY short_composition1, short_composition2, price;
	
-- Compare average prices per manufacturer to understand competitive pricing positioning.

WITH manufacturer_stats AS(
	SELECT
		manufacturer_name,
		medicine_type,
		ROUND(AVG(price):: NUMERIC,2) avg_price
	FROM med
	GROUP BY manufacturer_name, medicine_type
)
SELECT 
	manufacturer_name,
	medicine_type,
	avg_price,
	ROUND(AVG(avg_price) OVER() :: NUMERIC,2) overall_avg_price
FROM manufacturer_stats
ORDER BY avg_price DESC;

-- Evaluate dominance of medinice types (e.g., Tablets,Capsules etc) to understand market segmentation.

SELECT
	medicine_type,
	COUNT(*) total_count,
	MIN(price) min_price,
	MAX(price) max_price,
	ROUND(AVG(price)::NUMERIC,2) avg_price
FROM med
GROUP BY medicine_type
ORDER BY total_count DESC;