SELECT D.department_name, CONCAT(E.first_name, ' ', E.last_name) AS full_name, E.hire_date
FROM departments D
LEFT JOIN employees E on D.department_id=E.department_id
ORDER BY D.department_name

SELECT D.department_name, E.first_name, E.last_name, E.hire_date, E.salary
FROM departments D LEFT OUTER JOIN employees E
ON D.department_id = E.department_id

SELECT D.department_name, E.first_name, E.last_name, E.hire_date, E.salary
FROM departments D RIGHT OUTER JOIN employees E
ON D.department_id = E.department_id

SELECT E.last_name, E.salary, E.hire_date, J.job_title, D.department_name, L.city
FROM departments D
JOIN locations L ON  D.location_id = L.location_id 
JOIN employees E on D.department_id= E.department_id
JOIN jobs J ON E.job_id=J.job_id
WHERE E.department_id=10 AND E.hire_date LIKE '2019-__-__'

SELECT * FROM Employees as E, INNER JOIN referred as r, ON a.referral_ID = r.customer_id;
Gets all referrals between same table.  


INNER JOIN can be used for tables employee and department to show all employees assigned to a department, excluding
departments without employees/employees without departments. 
OUTER JOIN returns all records from both tables. will include empty departments and employees not assigned to a department. 

LEFT JOIN shows all records on the left and customer data from the right table where it's linked' by foreign key. 
RIGHT JOIN does the same. They are LEFT OUTER JOIn and RIGHT OUTER JOIN by default. 

