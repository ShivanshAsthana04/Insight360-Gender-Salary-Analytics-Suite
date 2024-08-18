DROP PROCEDURE IF EXISTS getAverageSalrayMaleVsFemale;

DELIMITER $$
CREATE PROCEDURE getAverageSalrayMaleVsFemale(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
	SELECT e.gender, d.dept_name, ROUND(AVG(s.salary),2) AS avg_salary
	FROM t_employees e
	JOIN t_dept_emp de ON de.emp_no = e.emp_no
	JOIN t_departments d ON d.dept_no = de.dept_no
	JOIN t_salaries s ON s.emp_no = e.emp_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
	GROUP BY d.dept_no, e.gender;
END $$
DELIMITER ;

CALL getAverageSalrayMaleVsFemale(50000, 90000);

