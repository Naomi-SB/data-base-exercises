--1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees
WHERE hire_date = (
					SELECT hire_date
					FROM employees
					WHERE emp_no = '101010'
				);

--2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT title
FROM titles t
WHERE emp_no IN (SELECT emp_no
				FROM employees
				WHERE first_name = 'Aamod')
		AND t.to_date = '9999-01-01';

--3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- 85108 employees are no longer working for the company.
SELECT COUNT(emp_no)
FROM employees
WHERE emp_no IN (	SELECT emp_no
					FROM dept_emp
					WHERE to_date < '9999-01-01');

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
-- Names: Isamu Legleitner, Karsten Sigstam, Leon DasSamrma, Hilary Kambil
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM dept_manager
                WHERE to_date = '9999-01-01')
		AND gender = 'F';

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT CONCAT(first_name,' ', last_name)
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM salaries
				WHERE salary > (SELECT AVG(salary) FROM salaries)
				AND to_date > CURDATE());

-- 6. How many current salaries are within 1 standard deviation of the current highest salary?
SELECT(SELECT COUNT(salary)
		FROM salaries 
		WHERE salary >= (SELECT MAX(salary)
						FROM salaries
						WHERE to_date > CURDATE())
							- (SELECT STD(salary)
								FROM salaries
								WHERE to_date > CURDATE())
		AND to_date > CURDATE()) / (SELECT COUNT(emp_no)
									FROM salaries
									WHERE to_date > CURDATE())*100;

-- ** BONUS
--1. Find all the department names that currently have female managers.
SELECT dept_name 
FROM departments
WHERE dept_no IN (SELECT dept_no
				FROM dept_manager
                WHERE emp_no IN (SELECT emp_no
								FROM employees
                                WHERE gender ='F')
                                AND to_date > CURDATE())

-- 2. Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE emp_no = (SELECT emp_no
				FROM salaries
                WHERE salary = (SELECT MAX(salary)
								FROM salaries));
--3. Find the department name that the employee with the highest salary works in.
SELECT dept_name
FROM departments
WHERE dept_no = (SELECT dept_no
				FROM dept_emp
                WHERE emp_no = (SELECT emp_no
								FROM salaries
								WHERE salary = (SELECT MAX(salary)
												FROM salaries)));