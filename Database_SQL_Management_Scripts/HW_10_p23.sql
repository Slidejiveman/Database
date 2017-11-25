SELECT DISTINCT E.EMP_NUM, EMP_LNAME, emp_email, L.line_qty
FROM  LGEMPLOYEE E JOIN lginvoice I  
      ON E.emp_num = I.employee_id, 
      lginvoice I2 join lgline L 
      ON I2.inv_num = L.inv_num
where l.line_qty = (SELECT SUM(L2.LINE_QTY) AS TOTAL
					FROM lgline L2, lginvoice I3, lgemployee E2
					WHERE E2.emp_num = I3.employee_id
					AND   I3.inv_num = L2.inv_num
					AND   I2.inv_date > '2013-11-1' AND I2.inv_date < '2013-12-5'
					GROUP BY E2.EMP_NUM
					HAVING E2.emp_num = E.emp_num)
ORDER BY l.line_qty, emp_lname
;  

SELECT * 
FROM lgproduct P, lgbrand B
WHERE P.brand_id = B.brand_id
      AND BRAND_NAME = 'BINDER PRIME'
;
