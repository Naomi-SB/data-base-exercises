-- 1
CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT first_name, last_name, dept_name 
FROM employees.employees e
JOIN employees.dept_emp de USING (emp_no)
JOIN employees.departments d USING (dept_no)
WHERE to_date > CURDATE());

-- 1.a
ALTER TABLE employees_with_departments ADD full_name VARCHAR (100);
SELECT * 
FROM employees_with_departments;

-- 1. B
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);
SELECT * FROM employees_with_departments;

-- 1. c
ALTER TABLE employees_with_departments DROP first_name;
ALTER TABLE employees_with_departments DROP last_name;
--1. d
CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT CONCAT(first_name,' ',last_name) AS full_name, dept_name 
FROM employees.employees e
JOIN employees.dept_emp de USING (emp_no)
JOIN employees.departments d USING (dept_no)
		);

--2. Create a temporary table based on the payment table from the sakila database.
--Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment
ALTER TABLE s_payment
ADD new_amounts INT;
UPDATE s_payment SET new_amounts = (amount * 100);
SELECT * FROM s_payment;
ALTER TABLE s_payment DROP amount;
ALTER TABLE s_payment DROP new_amount;
SELECT * FROM s_payment;

--3. 
-- notes taken, need to review from pushed key