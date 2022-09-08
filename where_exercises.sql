1. Create a file named where_exercises.sql. Make sure to use the employees database.

2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
-- 709 recdords were returned
3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
-- 709 records were still returned. 
4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
-- The number of males with those three names is 441. Query used was 
SELECT gender, first_name
FROM employees 
WHERE gender = 'M'
AND (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name = 'Maya'); 
5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
-- 7330 employees have last names that start with E.
SELECT COUNT (last_name) 
FROM employees
WHERE last_name LIKE 'E%';
6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
-- 30723
SELECT COUNT (last_name)
FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';
-- last names that that end with E but do not begin with E are 23393
SELECT COUNT(last_name)
FROM employees
WHERE last_name not LIKE 'E%'
AND last_name LIKE '%E';
7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees last names end with E, regardless of whether they start with E?
-- 899 
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E';
-- 24,292 employees names end with E
SELECT last_name 
 FROM employees
 WHERE last_name LIKE '%E';
8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
-- 135,214 employees hired in the nineties
SELECT COUNT(hire_date)
 FROM employees
 WHERE hire_date LIKE '199%';
9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
-- 842 employees born on Christmas
SELECT COUNT(birth_date)
 FROM employees
 WHERE birth_date LIKE '%12-25';
10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
-- 362 employees hired in the 90s were born on Christmas. 
SELECT COUNT(emp_no)
 FROM employees
 WHERE birth_date LIKE '%12-25'
 AND hire_date LIKE '199%';
11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
-- 1873 employees have a q in their last name.
SELECT COUNT(emp_no)
 FROM employees
 WHERE last_name LIKE '%q%';
12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
-- 547 last names have a q but not qu.
SELECT COUNT(emp_no)
 FROM employees
 WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';