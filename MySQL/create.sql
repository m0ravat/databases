DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS jobs;

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
	phone_number 	VARCHAR(15) not null,
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


ALTER TABLE Employees 
ADD phoneNo INTEGER;
RENAME COLUMN phoneNo to telephone;
MODIFY COLUMN telephone varchar(15);
MODIFY COLUMN telephone varchar(!5) AFTER email; /*Can use FIRST/LAST*/
DROP COLUMN telephone;
SELECT * FROM Employees