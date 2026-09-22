-- DML Implementation for the Company Task - Case Study

-- calling database to use
USE Company_Database;

--insert data into department table 
INSERT INTO DEPARTMENT
(Dno, Dname, Manager_Id, Hire_date)
VALUES
(1, 'Headquarters', 888665555, '1981-06-19'),
(2, 'Marketing', 987654321, '1998-01-01'),
(3, 'Finance', 999887777, '2005-03-15'),
(4, 'Administration', 987654321, '1995-01-01'),
(5, 'Research', 333445555, '1988-05-22');

--check table after creation
SELECT * FROM DEPARTMENT

--fix to insert Mgr_ssn
ALTER TABLE DEPARTMENT
DROP CONSTRAINT uq_dept_manager;

-- insert data into department table without Mgr_ssn
INSERT INTO DEPARTMENT
(Dno, Dname, Manager_Id, Hire_date)
VALUES
(1, 'Headquarters', NULL, '1981-06-19'),
(2, 'Marketing', NULL, '1998-01-01'),
(3, 'Finance', NULL, '2005-03-15'),
(4, 'Administration', NULL, '1995-01-01'),
(5, 'Research', NULL, '1988-05-22');

--fix table Employee and add address and salary columns
ALTER TABLE EMPLOYEE
ADD Address VARCHAR(100);

ALTER TABLE EMPLOYEE
ADD Salary DECIMAL(10,2);


-- insert data to employee table
INSERT INTO EMPLOYEE
(SSN, Fname, Lname, Gender, Bdate, Dno, Super_ssn, Address, Salary)
VALUES
('888665555', 'James', 'Borg', 'M', '1937-11-10', 1, NULL, '450 Stone, Houston TX', 55000),
('987654321', 'Jennifer', 'Wallace', 'F', '1941-06-20', 4, '888665555', '291 Berry, Bellaire TX', 43000),
('999887777', 'Alicia', 'Zelaya', 'F', '1968-07-19', 4, '987654321', '3321 Castle, Spring TX', 25000),
('333445555', 'Franklin', 'Wong', 'M', '1955-12-08', 5, '888665555', '638 Voss, Houston TX', 40000),
('123456789', 'John', 'Smith', 'M', '1965-01-09', 5, '333445555', '731 Fondren, Houston TX', 30000);

--check table after creation
SELECT * FROM EMPLOYEE


-- assiging the Mgr_ssn after insert employee details
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

--inssrt data to dept_locstions table
INSERT INTO DEPT_LOCATIONS
(Dno, Location)
VALUES
(1, 'Muscat'),
(2, 'Dubai'),
(3, 'Riyadh'),
(4, 'Manama'),
(5, 'Doha')

--check table after creation
SELECT * FROM DEPT_LOCATIONS

--inssrt data to project
INSERT INTO PROJECT
(Pno, Pname, Location, Dno)
VALUES
(1, 'ProductX', 'Muscat', 5),
(2, 'ProductY', 'Dubai', 5),
(3, 'ProductZ', 'Riyadh', 5),
(10, 'Computerization', 'Manama', 4),
(20, 'Reorganization', 'Doha', 1);

--check table after creation
SELECT * FROM PROJECT

-- modify table to delete column
ALTER TABLE PROJECT
DROP COLUMN City;

-- insert data to employee_work table
INSERT INTO EMPLOYEE_WORK
(SSN, Pno, Working_hours)
VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('999887777', 10, 10.0);

--check table after creation
SELECT * FROM EMPLOYEE_WORK


--modify the dependent table
ALTER TABLE DEPENDENT
ADD Relationship VARCHAR(20);

-- insert data to DEPENDENT table
INSERT INTO DEPENDENT
(SSN, Dependent_name, Gender, Bdate, Relationship)
VALUES
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son');

--check table after creation
SELECT * FROM DEPENDENT



-- Database Task – DML, JOIN & SQL Aggregate Functions 

-- Task 2: UPDATE 

-- Increase the salary of employees in department 5 by 10%
UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Dno = 5;

SELECT*FROM EMPLOYEE

-- Change the location of project 2 from Dubai to Muscat
UPDATE DEPT_LOCATIONS
SET Location = 'Muscat'
WHERE Dno =2;

SELECT*FROM DEPT_LOCATIONS

-- Change the salary of employee 123456789 to 35000
UPDATE EMPLOYEE
SET Salary = 35000
WHERE SSN = 123456789;

SELECT*FROM EMPLOYEE

-- Change the department name of department 3 from Finance to Financial Management.
UPDATE DEPARTMENT
SET Dname = 'Financial'
WHERE Dno = 3;

SELECT*FROM DEPARTMENT

-- Task 3: DELETE
-- Delete the dependent named Michael
DELETE FROM DEPENDENT
WHERE Dependent_name = 'Michael'

SELECT*FROM DEPENDENT

-- Delete the WORKS_ON record where Essn = 999887777 and Pno = 10
DELETE FROM EMPLOYEE_WORK
WHERE SSN = '999887777' AND Pno = 10

SELECT*FROM EMPLOYEE_WORK

-- Delete project 20
DELETE FROM PROJECT
WHERE Pno = 20 

SELECT * FROM PROJECT

-- Attempt to delete employee 123456789 (Can't delete becuase EMPLOYEE_WORK depends on it as FK)
DELETE FROM EMPLOYEE
WHERE SSN = '123456789'

SELECT * FROM EMPLOYEE

-- Task 4: INNER JOIN
SELECT Fname, Lname, Dname
From EMPLOYEE e INNER JOIN DEPARTMENT d ON e.Dno = d.Dno

-- Task 5: JOIN with Project 
SELECT Fname, Lname, Pname, Working_hours
FROM EMPLOYEE e INNER JOIN EMPLOYEE_WORK w ON e.SSN = w.SSN INNER JOIN PROJECT p ON p.Pno = w.Pno

--  Task 6: Department and Location 
SELECT d.Dno, d.Dname, l.Location 
FROM DEPARTMENT d INNER JOIN DEPT_LOCATIONS l ON d.Dno = l.Dno 

-- Task 7: Employee and Dependent 
SELECT Fname, Lname, Dependent_name, Relationship
FROM EMPLOYEE e INNER JOIN DEPENDENT d ON e.SSN = d.SSN

-- Task 8: LEFT JOIN
SELECT e.SSN, e.Fname, e.Lname, d.Dependent_name, d.Relationship
FROM EMPLOYEE e LEFT JOIN DEPENDENT d ON e.SSN = d.SSN

-- Task 9: Multiple JOIN 
SELECT e.Fname, e.Lname, d.Dname, p.Pname, p.Location, w.Working_hours
FROM EMPLOYEE e INNER JOIN DEPARTMENT d ON e.Dno = d.Dno INNER JOIN EMPLOYEE_WORK w ON e.SSN = w.SSN INNER JOIN PROJECT p ON p.Pno = w.Pno

-- Task 10: Employee Count 
SELECT COUNT(SSN)
FROM EMPLOYEE

-- Task 11: Salary Analysis 
SELECT SUM(salary) AS Total_Salary, AVG(salary) AS Average_Salary, MIN(salary) AS Minimum_salary, MAX(salary) AS Maximum_salary
FROM EMPLOYEE


-- Task 12: Department Employee Count 
SELECT Dno, COUNT(SSN)
FROM EMPLOYEE
GROUP BY Dno

-- Task 13: Department Salary 
SELECT Dno, SUM(salary) AS Total_Salary, AVG(salary) AS Average_Salary
FROM EMPLOYEE
GROUP BY Dno

-- Task 14: Project Hours 
SELECT Pno, SUM(Working_hours)
FROM EMPLOYEE_WORK
GROUP BY Pno

-- Task 15: Employee Working Hours 
SELECT SSN, SUM(Working_hours)
FROM EMPLOYEE_WORK
GROUP BY SSN

-- Task 16: Department Salary Analysis 
SELECT Dname, COUNT(SSN) AS No_Employees, SUM(salary) AS Total_Salary, AVG(salary) AS Average_Salary
FROM EMPLOYEE e INNER JOIN DEPARTMENT d ON e.Dno = d.Dno
GROUP BY Dname

-- Task 17: Project Employee Analysis 
SELECT Pname, COUNT(SSN) AS No_employee, SUM(Working_hours) AS Total_hours, AVG(Working_hours) AS Average_hours
FROM PROJECT p INNER JOIN EMPLOYEE_WORK e ON p.Pno = e.Pno
GROUP BY Pname

-- Task 18: Department Project Analysis 
SELECT d.Dname, COUNT(p.Pno), SUM(Working_hours)
FROM DEPARTMENT d INNER JOIN PROJECT p ON d.Dno = p.Dno Inner JOIN EMPLOYEE_WORK w ON p.Pno = w.Pno
GROUP BY Dname

-- Task 19 
SELECT Dno, AVG(salary) AS Average_salary
FROM EMPLOYEE
GROUP BY Dno
HAVING AVG(salary) > 30000

-- Task 20 
SELECT Pno, SUM(Working_hours) AS Total_working_hours
FROM EMPLOYEE_WORK
GROUP BY Pno
HAVING SUM(Working_hours) > 15

-- Task 21 
SELECT Dno, COUNT(SSN) AS No_employee
FROM EMPLOYEE
GROUP BY Dno
HAVING COUNT(SSN) > 1
