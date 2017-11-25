SELECT C2.cust_code, C2.cust_fname, C2.cust_lname, C2.cust_street, C2.cust_city,
       C2.cust_state, C2.cust_zip, I2.inv_date, I2.inv_total AS Largest_Invoice
FROM lgcustomer C2, lginvoice I2
WHERE C2.cust_state = 'AL'
AND C2.cust_code = I2.cust_code
AND i2.inv_total = (SELECT MAX(I3.INV_TOTAL)
                    FROM lginvoice I3, lgcustomer C3
					WHERE I3.cust_code = C3.cust_code
					GROUP BY C3.cust_code
					HAVING C3.cust_code = C2.cust_code)

UNION

SELECT C4.cust_code, C4.cust_fname, C4.cust_lname, C4.cust_street, C4.cust_city,
       C4.cust_state, C4.cust_zip, I4.inv_date, C4.cust_balance AS Largest_Invoice
FROM lgcustomer C4 left join lginvoice I4 on c4.cust_code = i4.cust_code
WHERE C4.cust_state = 'AL'
AND c4.cust_balance = 0.00
AND I4.inv_date IS NULL 

ORDER BY C2.cust_lname;
;