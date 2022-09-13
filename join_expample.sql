-- Use join, left join, and right join to combine results from the users and roles tables.
-- Join:
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
-- Left Join:
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- Right Join:
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 2. query that shows each department and it's current manager from employee DB.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',d.dept_name AS 'Department Name'
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';

--3. Find the name of all departments currently managed by women.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',d.dept_name AS 'Department Name', e.gender
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';

--4. Find the current titles of employees currently working in the Customer Service department.
SELECT COUNT(t.emp_no), t.title
FROM titles as t
JOIN dept_emp as de
ON de.emp_no = t.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE t.to_date > CURDATE() AND d.dept_name = 'Customer Service' AND de.to_date > CURDATE()
GROUP BY t.title;

--5. Find the current salary of all current managers.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',d.dept_name AS 'Department Name', s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
JOIN salaries AS s
ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date > CURDATE();

--6. Find the number of current employees in each department.
SELECT COUNT(de.emp_no), de.dept_no, d.dept_name
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no;

--7. Which department has the highest average salary?
SELECT AVG(s.salary) AS average_salary, d.dept_name AS department_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN salaries AS s
ON de.emp_no = s.emp_no
WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()
GROUP BY department_name
ORDER BY average_salary DESC
LIMIT 1;

--8. Who is the highest paid employee in the Marketing department?
SELECT e.first_name, e.last_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN salaries AS s
ON de.emp_no = s.emp_no
JOIN employees AS e
ON e.emp_no = s.emp_no
WHERE s.to_date > CURDATE() 
	AND de.to_date > CURDATE()
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

--9. Which current department manager has the highest salary?
SELECT e.first_name AS first_name, e.last_name AS last_name, d.dept_name AS 'Department Name', s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
JOIN salaries AS s
ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;

--10. Determine the average salary for each department. Use all salary information and round your results.
SELECT ROUND(AVG(s.salary), 0) AS average_salary, d.dept_name AS department_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN salaries AS s
ON de.emp_no = s.emp_no
GROUP BY department_name
ORDER BY average_salary DESC;

---* BONUS Find the names of all current employees, their department name, and their current manager's name.


