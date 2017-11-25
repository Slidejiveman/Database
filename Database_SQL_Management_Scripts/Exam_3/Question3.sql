SELECT C.cust_lname, V.inv_total
FROM lgcustomer C FULL JOIN lginvoice V ON C.cust_code = V.cust_code
WHERE V.inv_total = (SELECT MIN(V2.INV_TOTAL)
                     FROM lginvoice V2)
;