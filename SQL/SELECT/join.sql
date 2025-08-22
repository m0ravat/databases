
SELECT D.department_name, E.first_name, E.last_name
FROM employees E JOIN departments D
ON E.department_id = D.department_id
WHERE E.salary>45000 AND UPPER(D.department_name) LIKE 'M%'

SELECT L.country, L.city, D.department_name, E.first_name, E.first_name, E.salary
FROM departments D
JOIN locations L ON L.location_id = D.location_id
JOIN employees E ON E.department_id = D.department_id
WHERE E.hire_date > '2015-03-02' OR E.salary<46000
ORDER BY L.country, L.city, D.department_name


SELECT CONCAT(M.first_name, ' ', M.last_name, ' (ID: ', M.employee_id, ') manages: ', E.first_name, ' ', E.last_name, ' (ID: ', E.employee_id, ')') AS 'Management'
FROM employees E
JOIN employees M ON E.manager_id = M.employee_id
WHERE E.manager_id IS NOT NULL


SELECT E.last_name, E.salary, J.job_title, E.hire_date, D.department_name, L.city
FROM employees E
JOIN jobs J ON E.job_id=J.job_id
JOIN departments D ON E.department_id = D.department_id
JOIN locations L ON D.location_id=L.location_id
WHERE L.city = 'London' AND E.hire_date < '2019-04-25' AND (E.salary> 50000 OR E.salary<40000)

SELECT CONCAT(E.last_name, ' ', E.salary, ' ', J1.job_title, ' ', D1.department_name) AS 'Employee', CONCAT(M.last_name, ' ', M.salary, ' ', J2.job_title, ' ', D2.department_name) AS 'Manager'
FROM employees E
JOIN employees M ON E.manager_id = M.employee_id
JOIN departments D1 on E.department_id=D1.department_id
JOIN departments D2 ON M.department_id=D2.department_id
JOIN jobs J1 ON E.job_id = J1.job_id
JOIN jobs J2 ON M.job_id = J2.job_id

SELECT M.employee_id AS 'MANAGER ID', M.first_name AS 'MANAGER FIRST', M.last_name AS 'MANAGER LAST NAME', E.employee_id AS 'Employee ID', E.first_name AS 'Employee FIRST', E.last_name AS 'Employee LAST NAME'
FROM employees E 
JOIN employees M ON E.manager_id=M.employee_id