SELECT
    DATE_FORMAT(d.from_date,"%Y") AS calender_year,
    CASE
		WHEN e.gender = "M" THEN "Male"
        ELSE "Female"
    END AS gender,
    COUNT(e.gender) AS number_of_employees
FROM t_employees e
JOIN t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY 1,2
HAVING calender_year >= 1990
ORDER BY 1,2;

