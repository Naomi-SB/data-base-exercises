2. List the first 10 distinct last name sorted in descending order.
--Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker
SELECT DISTINCT last_name
 FROM employees
 ORDER BY last_name DESC
 LIMIT 10;

3. Write a comment in your code that lists the five names of the employees returned.
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup
SELECT first_name, last_name
 FROM employees
 WHERE birth_date LIKE '%12-25'
 AND hire_date LIKE '199%'
 ORDER BY hire_date
 LIMIT 5;

4. Update the query to find the tenth page of results.
-- Pranay,Narwekar, Marjo,Farrow, Ennio,Karcich, Dines,Lubachevsky, Ipke,Fontan
SELECT first_name, last_name
 FROM employees
 WHERE birth_date LIKE '%12-25'
 AND hire_date LIKE '199%'
 ORDER BY hire_date
 LIMIT 5 OFFSET 45;