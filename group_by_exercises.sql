2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? 
SELECT DISTINCT title
FROM titles;
-- 7 unique titles have existed

3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'
SELECT DISTINCT CONCAT(first_name,last_name)
FROM employees
WHERE last_name LIKE 'E%E';

5.Write a query to find the unique last names with a 'q' but not 'qu'
SELECT last_name
	FROM employees
	WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;
-- Chleq, Lindqvist, Qiwen

6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(*)
	FROM employees
	WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;

7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
--*** REQUEST CLARIFICATION
SELECT gender, first_name, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;

SELECT gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

8. Using your query that generates a username for all of the employees, generate a count employees for each unique username
SELECT LOWER(
		CONCAT(
			SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
		)
	) AS username, 
    COUNT(*) AS username_count
FROM employees
GROUP BY username
HAVING username_count > 1; 
