SELECT DISTINCT C.cust_fname, C.cust_Lname, C.cust_balance
FROM lgcustomer C FULL JOIN lginvoice V ON C.cust_code = V.cust_code
WHERE C.cust_balance = 0
ORDER BY C.cust_lname, C.cust_fname
;