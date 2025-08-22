SELECT E.department_id, E.last_name, E.hire_date
FROM departments D
JOIN employees E ON D.department_id = E.department_id
WHERE E.department_id = ANY (SELECT E.department_id 
                          FROM employees E 
                          WHERE E.last_name ="Matos" )
AND E.last_name != 'Matos'
ORDER BY E.department_id

SELECT E.last_name, E.salary
FROM departments D
JOIN employees E ON D.department_id = E.department_id
WHERE E.salary >= (SELECT MIN(E.salary)
                          FROM employees E 
                          WHERE E.department_id=40)
ORDER BY E.department_id


SELECT E.last_name, E.salary
FROM employees E
WHERE E.manager_id = ANY (SELECT employee_id
                     FROM employees
                     WHERE first_name LIKE 'J%')

SELECT E.last_name, E.salary
FROM employees E
WHERE E.department_id IN (SELECT DISTINCT department_id
                     FROM employees
                     WHERE hire_date > '2017-01-01')
AND E.salary > (SELECT AVG(salary)
              FROM employees
              WHERE department_id IS NULL)

SELECT D.department_id, D.department_name
FROM departments D
WHERE D.department_id NOT IN (SELECT E.department_id
                             FROM employees E
                             WHERE E.job_id = 904)

SELECT E.last_name, E.salary
FROM employees E 
WHERE E.department_id IN (SELECT D.department_id 
                          FROM departments D 
                          JOIN employees E ON E.department_id=D.department_id
                          WHERE E.hire_date > '2017-01-01')

SELECT E.last_name, E.salary, E.department_id
FROM employees E 
WHERE E.department_id IN (SELECT D.department_id FROM departments D WHERE D.location_id=100)