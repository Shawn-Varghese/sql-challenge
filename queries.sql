--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex , "Salaries".salary
FROM employees
LEFT JOIN "Salaries"
ON employees.emp_no = "Salaries".emp_no
ORDER BY employees.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' 

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, "Departments".dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager
INNER JOIN "Departments"
ON (dept_manager.dept_no= "Departments".dept_no)
INNER JOIN employees AS e
ON (dept_manager.emp_no= e.emp_no)

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no= dept_emp.emp_no)
INNER JOIN "Departments"
ON (dept_emp.dept_no= "Departments".dept_no)
ORDER BY employees.emp_no

--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no= dept_emp.emp_no)
INNER JOIN "Departments"
ON (dept_emp.dept_no= "Departments".dept_no)
WHERE "Departments".dept_name= 'Sales'
ORDER BY employees.emp_no

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no= dept_emp.emp_no)
INNER JOIN "Departments"
ON (dept_emp.dept_no= "Departments".dept_no)
WHERE "Departments".dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, count(last_name) AS frequency 
FROM employees
GROUP BY(last_name)
ORDER BY frequency DESC