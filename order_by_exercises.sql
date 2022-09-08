1. New file created, contents not copied. 

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