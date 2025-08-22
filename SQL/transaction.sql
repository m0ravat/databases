SET AUTOCOMMIT = OFF;
Transactions aren't saved', so we have to create 'save points' by using COMMIT.
Use ROLLBACK as an undo. 

SET AUTOCOMMIT = OFF;
INSERT ...; 
COMMIT;
DELETE * FROM employees;
ROLLBACK; 
