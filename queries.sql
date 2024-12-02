-- Queries

-- 1. List the employee number, last name, first name, sex, and salary of each employee

SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name, 
	Employees.sex, 
	Salaries.salary
FROM
	Employees
JOIN
	Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hirede in 1986

SELECT
	Employees.first_name,
	Employees.last_name,
	Employees.hire_date
FROM
	Employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT
	Dept_manager.Dept_no,
	Departments.Dept_name,
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name
FROM
	Dept_manager
JOIN	
	Departments ON Dept_manager.Dept_no = Departments.Dept_no
JOIN
	Employees ON Dept_manager.emp_no = Employees.emp_no;

-- 4. List the department number of each employee along with that employee's employee number, last name, first name, and department name

Select
	Dept_emp.Dept_no, 
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.Dept_name
FROM
	Dept_emp
JOIN 
	Employees ON Dept_emp.emp_no = Employees.emp_no
JOIN
	Departments ON Dept_emp.Dept_no = Departments.Dept_no;

-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT
	Employees.first_name,
	Employees.last_name, 
	Employees.sex
FROM 
	Employees
WHERE 
	Employees.first_name = 'Hercules' 
	AND Employees.last_name Like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name

SELECT 
	Departments.Dept_name,
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name
FROM
	Dept_emp
JOIN
	Employees ON Dept_emp.emp_no = Employees.emp_no
JOIN
	Departments ON Dept_emp.Dept_no = Departments.Dept_no
WHERE
	Departments.Dept_name = 'Sales';

-- 7. List each employee in the Sale and Development departments, inlcuding their employee number, last name, first name, and department name

SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.Dept_name
FROM
	Dept_emp
JOIN
	Employees ON Dept_emp.emp_no = Employees.emp_no
JOIN
	Departments ON Dept_emp.Dept_no = Departments.Dept_no
WHERE
	Departments.Dept_name = 'Sales' OR
	Departments.Dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (tha is, how many employees share each last name)
SELECT
	last_name,
COUNT(*) AS frequency
FROM 
	Employees
GROUP BY 
	last_name
ORDER BY
	frequency DESC;

