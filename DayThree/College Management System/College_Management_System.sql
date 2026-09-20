CREATE DATABASE College_Management_System;
USE College_Management_System;

-- STUDENT Table
CREATE TABLE STUDENT (
    S_id INT PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Phone_no VARCHAR(20),
    DOB DATE,
    F_id INT,
    FOREIGN KEY (F_id) REFERENCES FACULTY(F_id)
);

-- FACULTY Table
CREATE TABLE FACULTY (
    F_id INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Department VARCHAR(100),
    Name VARCHAR(100),
    Mobile_no VARCHAR(20)
);

-- HOSTEL
CREATE TABLE HOSTEL (
    Hostel_id INT PRIMARY KEY,
    Hostel_name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Address VARCHAR(255),
    Pin_code VARCHAR(20),
    No_of_seats INT,
    S_id INT UNIQUE,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id)
);

-- SUBJECT Table
CREATE TABLE SUBJECT (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    F_id INT,
    FOREIGN KEY (F_id) REFERENCES FACULTY(F_id)
);

-- COURSE Table
CREATE TABLE COURSE (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(100),
    Duration INT,
    S_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id)
);


--  DEPARTMENT Table
CREATE TABLE DEPARTMENT (
    Department_id INT PRIMARY KEY,
    D_name VARCHAR(100)
);

-- Department_handles Table 
CREATE TABLE Department_handles (
    course_id INT,
    department_id INT,
    
    PRIMARY KEY (course_id, department_id),
    
    FOREIGN KEY (course_id) REFERENCES COURSE(Course_id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(Department_id)
);

-- EXAMS Table
CREATE TABLE EXAMS (
    Exam_code INT PRIMARY KEY,
    Room VARCHAR(50),
    Date DATE,
    Time TIME,
    S_id INT,
    Department_id INT,
    FOREIGN KEY (S_id) REFERENCES STUDENT(S_id),
    FOREIGN KEY (Department_id) REFERENCES DEPARTMENT(Department_id)
);



