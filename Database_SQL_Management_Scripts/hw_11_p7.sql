SELECT * 
FROM lgbrand
WHERE brand_id NOT IN (SELECT brand_id
                       FROM lgproduct);


SELECT cust_code
 FROM lgcustomer
 WHERE cust_code NOT IN (SELECT cust_code
                         FROM lginvoice);