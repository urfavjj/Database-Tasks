USE Company_Database;

--modify the department table to delete the constraint
ALTER TABLE DEPARTMENT
DROP CONSTRAINT uq_dept_manager;

-- Department insertion
INSERT INTO DEPARTMENT
(Dno, Dname, Manager_Id, Hire_date)
VALUES
(1, 'Headquarters', NULL, '1981-06-19'),
(2, 'Marketing', NULL, '1998-01-01'),
(3, 'Finance', NULL, '2005-03-15'),
(4, 'Administration', NULL, '1995-01-01'),
(5, 'Research', NULL, '1988-05-22');

-- checking
SELECT * FROM DEPARTMENT

-- adding address to emplyee table
ALTER TABLE EMPLOYEE
ADD Address VARCHAR(100);

-- adding salary to employee table
ALTER TABLE EMPLOYEE
ADD Salary DECIMAL(10,2);

-- Employee insertion
INSERT INTO EMPLOYEE
(SSN, Fname, Lname, Gender, Bdate, Dno, Super_ssn, Address, Salary)
VALUES
('888665555', 'James', 'Borg', 'M', '1937-11-10', 1, NULL, '450 Stone, Houston TX', 55000),
('987654321', 'Jennifer', 'Wallace', 'F', '1941-06-20', 4, '888665555', '291 Berry, Bellaire TX', 43000),
('999887777', 'Alicia', 'Zelaya', 'F', '1968-07-19', 4, '987654321', '3321 Castle, Spring TX', 25000),
('333445555', 'Franklin', 'Wong', 'M', '1955-12-08', 5, '888665555', '638 Voss, Houston TX', 40000),
('123456789', 'John', 'Smith', 'M', '1965-01-09', 5, '333445555', '731 Fondren, Houston TX', 30000);

-- assiging the manager_id after insert employee details
UPDATE DEPARTMENT
SET Manager_Id = '888665555'
WHERE Dno = 1;

UPDATE DEPARTMENT
SET Manager_Id = '987654321'
WHERE Dno = 2;

UPDATE DEPARTMENT
SET Manager_Id = '999887777'
WHERE Dno = 3;

UPDATE DEPARTMENT
SET Manager_Id = '987654321'
WHERE Dno = 4;

UPDATE DEPARTMENT
SET Manager_Id = '333445555'
WHERE Dno = 5;

-- dept_locstions insertion
SELECT * FROM DEPT_LOCATIONS

INSERT INTO DEPT_LOCATIONS
(Dno, Location)
VALUES
(1, 'Muscat'),
(2, 'Dubai'),
(3, 'Riyadh'),
(4, 'Manama'),
(5, 'Doha')

-- modify the table of project
ALTER TABLE PROJECT
DROP COLUMN City;

-- PROJECT insertion
INSERT INTO PROJECT
(Pno, Pname, Location, Dno)
VALUES
(1, 'ProductX', 'Muscat', 5),
(2, 'ProductY', 'Dubai', 5),
(3, 'ProductZ', 'Riyadh', 5),
(10, 'Computerization', 'Manama', 4),
(20, 'Reorganization', 'Doha', 1);

SELECT * FROM PROJECT

-- employee_work insertion
INSERT INTO EMPLOYEE_WORK
(SSN, Pno, Working_hours)
VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('999887777', 10, 10.0);

SELECT * FROM EMPLOYEE_WORK

-- modify the depenent table 
ALTER TABLE DEPENDENT
ADD Relationship VARCHAR(20);

--DEPENDENT insertion 
INSERT INTO DEPENDENT
(SSN, Dependent_name, Gender, Bdate, Relationship)
VALUES
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son');

SELECT * FROM DEPENDENT