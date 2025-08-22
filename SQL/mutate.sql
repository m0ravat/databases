-- SQL DELETE Statement Cheat Sheet

-- Basic Syntax
DELETE FROM table_name
WHERE condition;

-- Delete a single row
DELETE FROM Students
WHERE StudentID = 123;

-- Delete multiple rows
DELETE FROM Orders
WHERE OrderDate < '2024-01-01';

-- Delete all rows (⚠ dangerous!)
DELETE FROM Employees;

-- Delete with JOIN (delete rows based on related data in another table)
DELETE s
FROM Students s
JOIN Classes c ON s.ClassID = c.ClassID
WHERE c.ClassName = 'History';

-- DELETE vs TRUNCATE vs DROP
-- DELETE   = Row by row removal (can filter with WHERE)
-- TRUNCATE = Removes all rows quickly (cannot filter, resets identity counters)
-- DROP     = Removes the table structure entirely

-- Best Practices
-- 1. Always use WHERE unless you want to wipe all rows.
-- 2. Run a SELECT with the same condition first to verify affected rows.
-- Example:
-- SELECT * FROM Orders WHERE OrderDate < '2024-01-01';


UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; /*where clause to make sure not every record is changed, can chnage all or by ID or something like country*/
/*can also make values Null if nullable*/