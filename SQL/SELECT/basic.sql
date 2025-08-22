
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

SELECT last_name FROM employees WHERE job_id IS NULL; /*finds employee who is unemplyed*/

can use NOT for like WHERE NOT role = "Manager"

ORDER BY amount, custID - orders by amount, if amount is same order by customer id. 

LIMIT 2; Limits the amount of rows returned so returns first 2. - typically merged on same line as order by. 
LIMIT 1,1 - returns the first row after the first. Offset is the first value. 

UNION - combines 2 select statements. 
SELECT * FROM INCOME 
UNION
SELECT * FROM EXPENSES;

result will come under column names for INCOME but will have values from expenses too. only works when select statements return same 
no of columns. It doesn't include ' duplicates between tables unless you use UNION ALL. 
common use case may be fetching names of all people in system regardless of status. 