SELECT E.EMP_NUM, EMP_LNAME, EMP_FNAME, SAL_AMOUNT
FROM LGEMPLOYEE E JOIN lgsalary_history SH 
ON E.emp_num = SH.emp_num
WHERE SH.sal_from = (SELECT MIN(sal_from)
       FROM lgsalary_history SH2
       group by sh2.emp_num
	   having sh.emp_num = sh2.emp_num)
group by e.emp_num, emp_lname, emp_fname, sal_amount
ORDER BY E.EMP_NUM ASC;