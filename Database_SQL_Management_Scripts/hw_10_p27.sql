SELECT B.brand_name, B.brand_type, P.prod_sku, P.prod_descript, P.prod_price
FROM lgbrand B JOIN lgproduct P ON B.brand_id = P.brand_id
WHERE P.prod_price = (SELECT MAX(P2.prod_price)
                      FROM lgbrand B2 JOIN lgproduct P2 ON B.brand_id = P.brand_id
					  WHERE B2.brand_type != 'PREMIUM')
;