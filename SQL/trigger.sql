CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees (/*can use after*/)
FOR EACH ROW
SET NEW.salary = (NEW.hourly * 1000)
/*creates new salary when hourly pay updates*/

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly * 1000)
/*generates salary when new user inputted with hourly pay*/

CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expenseTotal = expenseTotal - OLD.salary /*can do + NEW.salary for adding a new salary or + (NEW.salary - OLD.salary) for updating*/
WHERE expenseName = "Salaries";
/*removes cost of department when salary/employee removed*/