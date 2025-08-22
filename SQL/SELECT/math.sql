SELECT ROUND(AVG(salary), 2) AS 'Average Salary'
FROM employees 
WHERE employee_id IN (1022,1023,1024,1025)

SELECT MIN(salary) AS 'Minimum wage', MAX(salary) AS 'Maximum wage', AVG(salary) AS 'Average Salary'
FROM employees E
JOIN jobs J ON E.job_id=J.job_id
WHERE E.job_id IN (907,908,909) AND E.hire_date LIKE '2017-__-__'

SELECT M.employee_id AS 'Manager Number', MIN(E.salary)
FROM employees E
JOIN employees M ON E.manager_id = M.employee_id
WHERE E.manager_id IS NOT NULL
GROUP BY M.employee_id
HAVING MIN(E.salary) > 47000;

SELECT D.department_id AS 'DEPT Number', MIN(E.salary), MAX(E.salary), AVG(E.salary)
WHERE E.department_id IS NOT NULL
GROUP BY D.department_id
HAVING MAX(E.salary) > 50000 AND AVG(E.salary) >50000

SELECT D.department_id AS 'DEPT Number', D.department_name AS 'Dep Name', AVG(IFNULL(E.salary,0))
FROM departments D
JOIN employees E ON D.department_id = E.department_id
GROUP BY D.department_id

SELECT J.job_id, J.job_title, COUNT(J.job_id)
FROM jobs J
JOIN employees E ON J.job_id = E.job_id
GROUP BY J.job_id
HAVING J.job_title IN ('Programmer','Sales Rep', 'Marketing Producer', 'Sales Administrator', 'Database Architect', 'Operations Officer', 'IT Tester') AND COUNT(J.job_id) > 2
ORDER BY J.job_title

SELECT D.department_id, D.department_name, AVG(IFNULL(E.salary,0.0))
FROM departments D
LEFT OUTER JOIN employees E on D.department_id=E.department_id
GROUP BY D.department_id /*groups average salary for each department id.*/ Can also add WITH ROLLUP at the end of GROUP BY
statement for a sum of all averages. 

SELECT J.job_id, J.job_title, COUNT(E.job_id) 
FROM jobs J 
JOIN employees E ON E.job_id = J.job_id
WHERE E.job_id IN (902,903,906,908,909,910,911)
GROUP BY J.job_title
HAVING COUNT(E.job_id) > 1

COUNT() - returns rows returned as a number. 
CONCAT() - Merges values together like for full name. 