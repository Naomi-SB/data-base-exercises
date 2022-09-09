1. 1. New file created, contents not copied. 

2. What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
--- Irena Reutenauer is the first name on the list. Vidya Simmen is the last name on the list.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
3. What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 
--- The name on the top of the list is Irena Acton. The name of the last person is Vidya Zweizig.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
4. What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
---The first person on the list is Irena Acton. The last person on the list is Maya Zyda.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
5. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
-- Number of employees returned: 899. First employee number: Ramzi Erde 10021. Last employee number: Tadahiro Erde 499648.
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;
6. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
--- 899 employees returned. The newest hire is Teiji Eldridge. The oldest hire is Sergi Erde.
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date DESC;
7. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
 --- 362 employees returned. Of the oldest employees, Khun Bernini was hired last. Of the youngest employees, Douadi Pettis was hired first. 
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY birth_date AND hire_date DESC;

--******HERE BEGINS THE NEW EXERCISES******--
2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
-- SELECT CONCAT(first_name, ' ', last_name) AS full_name
--FROM employees
--WHERE last_name LIKE 'E%E';

3. Convert the names produced in your last query to all uppercase.
-- SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
--FROM employees
--WHERE last_name LIKE 'E%E';

4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
-- SELECT first_name
    --last_name
    --DATEDIFF(CURDATE(), hire_date) AS days_with_company
--FROM employees
--WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%';

5. Find the smallest and largest current salary from the salaries table. 
-- smallest salary: 38,623. CODE used: SELECT MIN(salary) FROM salaries;
--largest salary: 158,220. Code used: SELECT MAX(salary) FROM salaries;
--*CORRECTION, DID NOT LOOK FOR CURRENT DATE
--SELECT MIN(salary),
	--MAX(salary)
--FROM salaries
--WHERE to_date > CURDATE();

6. Generate a username:
-- SELECT first_name, 
	--last_name, 
	--birth_date,
    --LOWER(
		--CONCAT(
			--SUBSTR(first_name, 1, 1),
            --SUBSTR(last_name, 1, 4),
            --'_',
            --SUBSTR(birth_date, 6, 2),
            --SUBSTR(birth_date, 3, 2)
		--)
	--) AS username
--FROM employees; 
