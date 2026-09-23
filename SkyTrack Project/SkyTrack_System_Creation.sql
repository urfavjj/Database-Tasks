CREATE DATABASE SkyTrack_Airline_System;
USE SkyTrack_Airline_System;

-- Airport Table
CREATE TABLE AIRPORT(
	IATA INT PRIMARY KEY,
	Aname VARCHAR(50) NOT NULL,
	Country VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL
);

-- show table
SELECT*FROM AIRPORT

-- Aircraft Table
CREATE TABLE AIRCRAFT(
	Register_no INT PRIMARY KEY,
	Model VARCHAR(50) NOT NULL,
	Manufacturer VARCHAR(50) NOT NULL,
	Seat_capity INT NOT NULL,
	CONSTRAINT ck_aircraft_capcity CHECK(Seat_capity > 0)
);

-- show table
SELECT*FROM AIRCRAFT

-- Flight Table
CREATE TABLE FLIGHT(
	Flight_no VARCHAR(50) PRIMARY KEY,
	Dept_datetime DATETIME,
	Arrivel_datetime DATETIME,
	Status VARCHAR(50) DEFAULT 'Scheduled',
	IATA INT NOT NULL,
	Register_no INT NOT NULL,
	CONSTRAINT fk_flight_airport FOREIGN KEY (IATA) REFERENCES AIRPORT(IATA),
	CONSTRAINT fk_flight_aircraft FOREIGN KEY (Register_no) REFERENCES AIRCRAFT(Register_no),
	CONSTRAINT ck_flight_status CHECK (Status IN('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
	CONSTRAINT ck_flight_datetime CHECK (Arrivel_datetime > Dept_datetime)
);

-- show table
SELECT*FROM FLIGHT

-- Passenger Table
CREATE TABLE PASSENGER(
	National_Id INT PRIMARY KEY,
	Fname VARCHAR(50) NOT NULL, 
	Lname VARCHAR(50) NOT NULL, 
	Email VARCHAR(100) UNIQUE, 
	Nationality VARCHAR(50) NOT NULL,
	BDate DATE NOT NULL,
);

-- show table
SELECT*FROM PASSENGER

--Passenger_Phone Table
CREATE TABLE PASS_PHONE(
	National_Id INT NOT NULL,
	Phone VARCHAR(50) NOT NULL, 
	PRIMARY KEY (National_Id, Phone),
	CONSTRAINT fk_passPhone_Passenger FOREIGN KEY (National_Id) REFERENCES PASSENGER(National_Id)
);

-- show table
SELECT*FROM PASS_PHONE

-- Booking Table
CREATE TABLE BOOKING(
	Booking_Id VARCHAR(50) PRIMARY KEY,
	Seat_no VARCHAR(20) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Class VARCHAR(20) NOT NULL,
	Booking_date DATE NOT NULL DEFAULT GETDATE(),
	Flight_no VARCHAR(50),
	National_Id INT,
	CONSTRAINT fk_booking_flight FOREIGN KEY (Flight_no) REFERENCES FLIGHT(Flight_no),
	CONSTRAINT fk_booking_id FOREIGN KEY (National_Id) REFERENCES PASSENGER(National_Id),
	CONSTRAINT ck_booking_class CHECK(Class IN('Economy', 'Business', 'First')),
	CONSTRAINT ck_booking_price CHECK(PRICE > 0)
);

-- show table
SELECT*FROM BOOKING

-- Crew Member Table
CREATE TABLE CREW_MEMBER(
	License_no VARCHAR(20) PRIMARY KEY,
	Fname VARCHAR(50) NOT NULL, 
	Lname VARCHAR(50) NOT NULL,
	CRole VARCHAR(50) NOT NULL,
	CONSTRAINT ck_crew_role CHECK(CRole IN ('Pilot', 'Co-Pilot','Flight Attendant', 'Engineer'))
);

-- show table
SELECT*FROM CREW_MEMBER

--Crew Flight Table
CREATE TABLE FLIGHTCREW(
	Flight_no VARCHAR(50) NOT NULL,
	License_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (Flight_no, License_no),
	CONSTRAINT fk_flight_crew_no FOREIGN KEY (Flight_no) REFERENCES FLIGHT(Flight_no),
	CONSTRAINT fk_flight_crew_license FOREIGN KEY (License_no) REFERENCES CREW_MEMBER(License_no)
);

-- show table
SELECT*FROM FLIGHTCREW

-- insertion PASS_PHONE table
INSERT INTO PASS_PHONE(National_Id, Phone) VALUES
-- Jokha Al-Harthi (Omani)
(84021991, '+968 9123 4567'),
(84021991, '+968 2456 7890'), -- Secondary home number

-- Nawras Al-Sawafi (British)
(93051442, '+44 7123 456789'),

-- Mohammed Daiyal (Indian)
(78112233, '+91 98765 43210'),
(78112233, '+968 9988 7766'), -- Local Oman roaming number

-- Hamed Al-Harthi (Burundian)
(89061544, '+257 22 23 4567'),

-- Sept Al-Rashdi (Tanzanian)
(95013055, '+255 22 234 5678'),

-- Weam Al-Habsi (Emirati)
(92072266, '+971 50 123 4567'),

-- Fatima Alshargi (American)
(87090877, '+1 202 555 0143'),

-- Hande Erçel (Turkish)
(96031288, '+90 532 123 4567'),
(96031288, '+90 212 555 1234'); -- Secondary office number

-- show table
SELECT * FROM PASS_PHONE;
