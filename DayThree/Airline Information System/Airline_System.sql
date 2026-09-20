CREATE DATABASE Airline_System;
USE Airline_System;

-- AIRPORT Table
CREATE TABLE AIRPORT (
    airport_code VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    name VARCHAR(100)
);

-- AIRPLANE_TYPE Table
CREATE TABLE AIRPLANE_TYPE (
    type_name VARCHAR(50) PRIMARY KEY,
    company VARCHAR(100),
    max_seats INT
);

-- AIRPLANE Table
CREATE TABLE AIRPLANE (
    airplane_id INT PRIMARY KEY,
    total_seats INT,
    type_name VARCHAR(50),
    FOREIGN KEY (type_name) REFERENCES AIRPLANE_TYPE(type_name)
);

-- FLIGHT Table
CREATE TABLE FLIGHT (
    flight_no INT PRIMARY KEY,
    airline VARCHAR(100),
    weekdays VARCHAR(100)
);

-- FLIGHT_LEG Table
CREATE TABLE FLIGHT_LEG (
    leg_no INT PRIMARY KEY,
    scheduled_dep_time TIME,
    scheduled_arr_time TIME,
    flight_no INT,
    departure_airport_code VARCHAR(10),
    arrival_airport_code VARCHAR(10),
    FOREIGN KEY (flight_no) REFERENCES FLIGHT(flight_no),
    FOREIGN KEY (departure_airport_code) REFERENCES AIRPORT(airport_code),
    FOREIGN KEY (arrival_airport_code) REFERENCES AIRPORT(airport_code)
);

-- LEG_INSTANCE Table
CREATE TABLE LEG_INSTANCE (
    leg_no INT,
    seat_no VARCHAR(10),
    actual_dep_time TIME,
    actual_arr_time TIME,
    available_seats INT,
    airplane_id INT,

    PRIMARY KEY (leg_no, seat_no),

    FOREIGN KEY (leg_no) REFERENCES FLIGHT_LEG(leg_no),
    FOREIGN KEY (airplane_id) REFERENCES AIRPLANE(airplane_id)
);

-- SEAT Table
CREATE TABLE SEAT (
    airplane_id INT,
    seat_no VARCHAR(10),
    PRIMARY KEY (airplane_id, seat_no),
    FOREIGN KEY (airplane_id) REFERENCES AIRPLANE(airplane_id)
);

-- CUSTOMER Table
CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(20)
);

-- RESERVATION Table
CREATE TABLE RESERVATION (
    customer_id INT,
    leg_no INT,
    airplane_id INT,
    seat_no VARCHAR(10),
    PRIMARY KEY (customer_id,leg_no, airplane_id,seat_no),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (leg_no, seat_no) REFERENCES LEG_INSTANCE(leg_no, seat_no),
    FOREIGN KEY (airplane_id, seat_no) REFERENCES SEAT(airplane_id, seat_no)
);

-- FARE Table
CREATE TABLE FARE (
    code VARCHAR(20),
    amount DECIMAL(10,2),
    flight_no INT,
    PRIMARY KEY (code),
    FOREIGN KEY (flight_no) REFERENCES FLIGHT(flight_no)
);