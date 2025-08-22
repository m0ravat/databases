CREATE DATABASE dbName;
DROP DATABASE dbName;

BACKUP DATABASE databasename
TO DISK = 'filepath';

BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL; /*Only backs up data that has changed since last backup*/



DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS jobs;
TRUNCATE TABLE table_name; /*delete data but not the tables*/

-- Create the locations table
CREATE TABLE locations
(
	location_id  	INTEGER,
	street_address	VARCHAR(50) unique not null,
	postal_code		VARCHAR(10) not null,
	city			VARCHAR(50) not null,
	state_province	VARCHAR(50) not null,
	country			VARCHAR(50) not null,
	constraint 		l_lid_pk PRIMARY KEY (location_id)
);

-- Create the jobs table
CREATE TABLE jobs
(
	job_id  		INTEGER,
	job_title		VARCHAR(50) unique not null,
	min_salary		DECIMAL(8,2) not null,
	max_salary		DECIMAL(8,2) not null,
	constraint 		j_jid_pk PRIMARY KEY (job_id)
);

-- Create the departments table
CREATE TABLE departments
(
	department_id 	INTEGER,
	department_name	VARCHAR(20) unique not null,
	location_id  	INTEGER not null,
	constraint 		d_did_pk PRIMARY KEY (department_id),
	constraint 		d_lid_fk FOREIGN KEY (location_id)
	references 		locations(location_id)
);

-- Create the employees table
CREATE TABLE employees
(
	employee_id 	INTEGER,
	first_name 		VARCHAR(50) not null,
	last_name 		VARCHAR(50) not null,
	email 			VARCHAR(50) not null unique,
	phone_number 	CHAR(15) not null, /*Specifies a fixed length, if length inputted is 11 it'll have 4 spaces*/
	hire_date 		DATE not null, 
	salary 			DECIMAL(8,2),
	commission_pct	DECIMAL(2,2),
	manager_id 		INTEGER,
	department_id 	INTEGER,
	job_id 			INTEGER,
	constraint 		e_eid_pk PRIMARY KEY (employee_id),
	constraint 		e_mid_fk FOREIGN KEY (manager_id)
	references 		employees(employee_id),
	constraint 		e_did_fk FOREIGN KEY (department_id)
	references 		departments(department_id),
	constraint 		e_jid_fk FOREIGN KEY (job_id)
	references 		jobs(job_id)
);

RENAME TABLE employees to Employees

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';
Views are used to create visual tables for specific columns so you can run the Brazil Customers view instead of querying the database
for security, data abstraction and simpler queries. 

ALTER TABLE Employees 
ADD phoneNo INTEGER;
RENAME COLUMN phoneNo to telephone;
MODIFY COLUMN telephone varchar(15);
MODIFY COLUMN telephone varchar(!5) AFTER email; /*Can use FIRST/LAST*/
DROP COLUMN telephone;
SELECT * FROM Employees

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

All constraints (columnName datatype constraint): 
NOT NULL - self explanatory
UNIQUE - all values different
PRIMARY KEY - combination of previous 2
FOREIGN KEY - Makes sure data can't be removed all willy nilly. 
ALTER TABLE orders
ADD CONSTRAINT fk_customerID
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
ON DELETE SET NULL;
DEFFAULT - self explanatory' (DEFAULT 0, DEFAULT NOW() etc can be used as base values)


CREATE (UNIQUE) INDEX - Creates an index for a column(s) for faster lookup but slower writes and larger storage. Primary key is indexed
by default. 


CHECK - Limit value range: e.g Age INT CHECK (Age>=18)
Preceed CHECK with CONSTRAINT constraintName CHECK (age>=18) so you can easily remove check statement
ALTER TABLE employees
ADD CONSTRAINT min_wage_hourly CHECK (wage_hourly >=10.00)
DROP CHECK min_wage_hourly

AUTO_INCREMENT - Automatically index IDs so don't have to ' manually input a new one. 
ALTER TABLE tableName;
AUTO INCCREMENT = 1000
base new ID will be 1000

ALTER TABLE tableName 
ADD constraint
UNIQUE(product_name)


Stored procedures

Simplify query into a function you can call by doing CALL procedureName

DELIMITER $$
CREATE PROCEDURE procedureName()
BEGIN 
    SELECT ... FROM ... WHERE.. GROUP BY ...;
END $$
DELIMITER ;

DROP PROCEDURE procedureName()

DELIMITER $$
CREATE PROCEDURE findCustomer(IN id INT)
BEGIN 
    SELECT ... FROM ... WHERE custID = id;
END $$
DELIMITER ;

CALL findCustomer(2)