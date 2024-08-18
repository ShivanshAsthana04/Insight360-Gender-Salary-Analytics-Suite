SELECT dept_emp.dept_name, dept_emp.gender,dept_emp.emp_no,dept_emp.from_date,dept_emp.to_date,e.calendar_year,
	CASE
		WHEN YEAR(dept_emp.from_date) <= e.calendar_year AND YEAR(dept_emp.to_date) >= e.calendar_year THEN 1
        ELSE 0
    END AS active_as_manager
FROM
	(SELECT YEAR(e.hire_date) AS calendar_year
	FROM t_employees e
	GROUP BY calendar_year
	ORDER BY 1) e
CROSS JOIN
	(SELECT d.dept_name, ee.gender,dm.emp_no,dm.from_date,dm.to_date
FROM t_dept_emp de
JOIN t_departments d ON de.dept_no = d.dept_no
JOIN t_employees ee ON ee.emp_no = de.emp_no
JOIN t_dept_manager dm ON dm.emp_no = ee.emp_no) dept_emp
ORDER BY dept_emp.emp_no, e.calendar_year;


