SELECT E.emp_num, E.emp_fname, E.emp_lname, E.emp_email, Total
FROM lgemployee E JOIN
      (SELECT I.employee_id, SUM(L.line_qty) AS Total
	   FROM lginvoice I join lgline L ON I.inv_num = L.inv_num
	   JOIN lgproduct P ON L.prod_sku = P.prod_sku
	   JOIN lgbrand B ON B.brand_id = P.brand_id
	   WHERE B.brand_name = 'BINDER PRIME'
	   AND I.inv_date BETWEEN '2013-11-1' AND '2013-12-5'
	   GROUP BY I.employee_id) as table1
                  ON E.emp_num = table1.employee_id
WHERE Total = (SELECT MAX(Total)
			   FROM (SELECT I.employee_id, SUM(L.line_qty) AS Total
					 FROM lginvoice I join lgline L ON I.inv_num = L.inv_num
					 JOIN lgproduct P ON L.prod_sku = P.prod_sku
					 JOIN lgbrand B ON B.brand_id = P.brand_id
					 WHERE B.brand_name = 'BINDER PRIME'
					 AND I.inv_date BETWEEN '2013-11-1' AND '2013-12-5'
					 GROUP BY I.employee_id) table2)
ORDER BY E.emp_lname 
;