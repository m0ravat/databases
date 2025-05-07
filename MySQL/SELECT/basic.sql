
SELECT last_name AS 'Employee', job_id, hire_date, salary
FROM employees
WHERE department_id=40 AND salary BETWEEN 37000 AND 57000  AND hire_date<'2016-02-16' OR last_name = 'Taylor'

SELECT last_name
FROM employees
WHERE last_name LIKE '__a%' /* looks for a name with a as the 3rd character, underscores are any 1st and 2nd*/

SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%t%' /*looks for last names with a and t in */

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '2014-__-__' /* date in 2014*/

SELECT last_name, job_id, salary
FROM employees
WHERE salary NOT IN (35000,41000,51000) AND job_id IN (902,903) /* where salary isnt the bracket and job id is in bracket */

SELECT last_name AS 'Employee' , job_id, salary, hire_date
FROM employees
WHERE (job_id IN (909,911) AND salary < 45000)
OR hire_date < '2017-03-03' AND last_name LIKE '%o_' /*o is second last*/