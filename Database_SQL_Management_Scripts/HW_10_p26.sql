SELECT DISTINCT B.brand_name, B.brand_type,
       (SELECT AVG(prod_price)
	    FROM lgbrand B2 JOIN lgproduct P2 ON B2.brand_id = P2.brand_id 
		GROUP BY B2.brand_name
		HAVING B2.brand_name = B.brand_name) AS Average_Price,
		(SELECT SUM(L.LINE_QTY)
		FROM lgline L JOIN lgproduct P3 ON L.prod_sku = P3.prod_sku
		GROUP BY P3.BRAND_ID
		HAVING P3.BRAND_ID = B.brand_id) AS Units_Sold
FROM lgbrand B JOIN lgproduct P ON B.brand_id = P.brand_id
ORDER BY B.brand_name;
