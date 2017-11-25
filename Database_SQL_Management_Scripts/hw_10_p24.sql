SELECT C.cust_code, C.cust_fname, C.cust_lname
FROM lgcustomer C, lginvoice I, lgemployee E
WHERE C.cust_code = I.cust_code
AND   I.employee_id = E.emp_num
AND   I.employee_id = 83649
INTERSECT
SELECT C.cust_code, C.cust_fname, C.cust_lname
FROM lgcustomer C, lginvoice I, lgemployee E
WHERE C.cust_code = I.cust_code
AND   I.employee_id = E.emp_num
AND   I.employee_id = 83677
ORDER BY C.cust_lname, C.cust_fname;