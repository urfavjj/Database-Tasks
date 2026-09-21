CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

-- PATIENT Tale
CREATE TABLE PATIENT (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    blood_group VARCHAR(5),
    gender VARCHAR(10)
);

-- DEPARTMENT Table
CREATE TABLE DEPARTMENT (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100),
    head_doctor_id INT NULL
);

-- DOCTOR Table
CREATE TABLE DOCTOR (
    doctor_id INT PRIMARY KEY,
    specialization VARCHAR(100),
    prof_details VARCHAR(150),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);

-- Add Department Head relationship
ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK_Department_Head
FOREIGN KEY (head_doctor_id) REFERENCES DOCTOR(doctor_id);

-- APPOINTMENT Table
CREATE TABLE APPOINTMENT (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(30),
    appointment_type VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id)
);

-- SERVICE Table
CREATE TABLE SERVICE (
    service_id INT PRIMARY KEY,
    service_status VARCHAR(100),
    service_type VARCHAR(50),
    service_date DATE,
    service_time TIME,
);

-- APPOINTMENT_SERVICE Table
CREATE TABLE APPOINTMENT_SERVICE (
    appointment_id INT,
    service_id INT,
    quantity INT,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id),
    FOREIGN KEY (service_id) REFERENCES SERVICE(service_id)
);

-- MEDICAL_RECORD Table
CREATE TABLE MEDICAL_RECORD (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_id INT,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    record_date DATE,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);

-- BILLING Table
CREATE TABLE BILLING (
    bill_id INT PRIMARY KEY,
    appointment_id INT,
    total_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);