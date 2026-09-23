USE SkyTrack_Airline_System;

-- 
-- insertion at least 5 airports from different countries
INSERT INTO AIRPORT(IATA, Aname, Country, City)VALUES
(1, 'MCT Airport', 'Oman', 'Muscat'),
(2, 'SLL Airport', 'Oman', 'Salalah'),
(3, 'DQM Airport', 'Oman', 'Duqum'),
(4, 'KSH Airport', 'Oman', 'Khasab'),
(5, 'DXB Airport', 'UAE', 'Dubai');

-- show table
SELECT*FROM AIRPORT

-- insertion At least 5 aircraft with different models and manufacturers
INSERT INTO AIRCRAFT(Register_no, Model, Manufacturer, Seat_capity)VALUES
(1001, '737 MAX 7', 'Boaing', 162),
(1002, '787-9 Dreamliner', 'Boaing', 288),
(1003, 'A321neo', 'Airbus', 212),
(1004, 'A320neo', 'Airbus', 180),
(1005, 'A321-200', 'Airbus', 220);

-- show table
SELECT*FROM AIRCRAFT

-- insertion At least 8 flights — cover all four status values: Scheduled, Delayed, Cancelled, and Completed
INSERT INTO FLIGHT(Flight_no, Dept_datetime, Arrivel_datetime, Status, IATA, Register_no) VALUES
('WY-101', '2026-10-15 08:30:00', '2026-10-15 10:15:00', 'Scheduled', 1, 1001),
('OV-204', '2026-10-15 13:00:00', '2026-10-15 14:45:00', 'Scheduled', 4, 1004),
('WY-321', '2026-10-16 02:15:00', '2026-10-16 09:30:00', 'Scheduled', 2, 1002),
('OV-502', '2026-10-16 18:00:00', '2026-10-16 19:15:00', 'Delayed',   3, 1003),
('WY-102', '2026-10-17 07:00:00', '2026-10-17 08:45:00', 'Scheduled', 1, 1001),
('OV-205', '2026-10-17 11:30:00', '2026-10-17 13:15:00', 'Completed', 4, 1004),
('WY-408', '2026-10-18 21:45:00', '2026-10-19 01:30:00', 'Scheduled', 5, 1005),
('WY-999', '2026-10-19 05:00:00', '2026-10-19 06:45:00', 'Cancelled', 2, 1002);

-- show table
SELECT*FROM FLIGHT

-- insertion At least 8 passengers from different nationalities
INSERT INTO PASSENGER(National_Id, Fname, Lname, Email, Nationality, BDate)VALUES
(84021991, 'Jokha', 'Al-Harthi', 'jokha.hamed.official@gmail.com', 'Omani', '2002-12-17'),
(93051442, 'Nawras', 'Al-Sawafi', 'nawras.saif@gmail.com', 'British', '2004-03-03'),
(78112233, 'Mohammed', 'Daiyal', 'daniyal@rihal.codeline.om', 'Indian', '1978-11-03'),
(89061544, 'Hamed', 'Al-Harthi', 'alharthi@gmail.com', 'Borondi', '1966-09-18'),
(95013055, 'Sept', 'Al-Rashdi', 'sept.khalfan@gmail.com', 'Tanizania', '1968-06-22'),
(92072266, 'Weam', 'Al-Habsi', 'Weam@gmail.com', 'Emirati', '1995-07-22'),
(87090877, 'Fatima', 'Alshargi', 'fatima@gmail.com', 'American', '2000-09-08'),
(96031288, 'Hande', 'Erçel', 'Hande@gmail.com', 'Turkish', '1993-11-24');

-- show table
SELECT*FROM PASSENGER

--insrtion  At least 10 bookings distributed across different flights and passengers. Include all three booking classes: Economy, Business, and First.
INSERT INTO BOOKING(Booking_Id, Seat_no, Price, Class,Booking_date, Flight_no, National_Id)VALUES
('BK-9001', '14A', 45.50,   'Economy',  '2026-09-01', 'WY-101', 84021991),
('BK-9002', '15C', 55.00,   'Economy',  '2026-09-01', 'OV-204', 93051442),
('BK-9003', '02D', 180.00,  'Business', '2026-09-02', 'WY-321', 78112233),
('BK-9004', '01A', 350.00,  'First',    '2026-09-03', 'OV-502', 89061544),
('BK-9005', '12B', 65.25,   'Economy',  '2026-09-03', 'WY-102', 95013055),
('BK-9006', '04A', 210.00,  'Business', '2026-09-04', 'OV-205', 92072266),
('BK-9007', '18F', 89.90,   'Economy',  '2026-09-05', 'WY-408', 87090877),
('BK-9008', '01C', 420.00,  'First',    '2026-09-05', 'WY-999', 96031288),
('BK-9009', '10A', 50.00,   'Economy',  '2026-09-06', 'WY-101', 84021991),
('BK-9010', '03F', 195.00,  'Business', '2026-09-07', 'OV-204', 93051442);

-- show table
SELECT*FROM BOOKING

--insertion At least 6 crew members covering all four roles: Pilot, Co-Pilot, Flight Attendant, and Engineer
INSERT INTO CREW_MEMBER(License_no, Fname, Lname, CRole)VALUES
('ATPL-4001', 'Salim', 'Al-Harthy', 'Pilot'),
('CPL-5022', 'Mazin', 'Al-Zadjali', 'Co-Pilot'),
('FA-8801', 'Muna', 'Al-Shuaili', 'Flight Attendant'),
('FA-8802', 'John', 'Doe', 'Flight Attendant'),
('ENG-9044', 'Khalfan', 'Al-Riyami', 'Engineer'),
('ENG-9045', 'Said', 'Al-Alawi', 'Engineer');

-- show table
SELECT*FROM CREW_MEMBER

-- insertion Assign crew to all flights through the FlightCrew table. Each flight must have at least one pilot and at least one flight attendant.
INSERT INTO FLIGHTCREW(Flight_no, License_no)VALUES

--Flight WY-101
('WY-101', 'ATPL-4001'), -- Pilot
('WY-101', 'FA-8801'), -- Flight Attendant

-- Flight OV-204
('OV-204', 'CPL-5022'),  -- Pilot 
('OV-204', 'FA-8802'),  -- Flight Attendant

-- Flight WY-321
('WY-321', 'ATPL-4001'), -- Pilot
('WY-321', 'FA-8801'),   -- Flight Attendant
('WY-321', 'ENG-9044'),  -- Engineer

-- Flight OV-502
('OV-502', 'CPL-5022'),   -- Co-Pilot
('OV-502', 'FA-8802'),   -- Flight Attendant

-- Flight WY-102
('WY-102', 'ATPL-4001'), -- Pilot
('WY-102', 'FA-8801'),   -- Flight Attendant

-- Flight OV-205
('OV-205', 'CPL-5022'),   -- Co-Pilot
('OV-205', 'FA-8802'),   -- Flight Attendant

-- Flight WY-408
('WY-408', 'ATPL-4001'), -- Pilot
('WY-408', 'FA-8802'),   -- Flight Attendant
('WY-408', 'ENG-9045'),  -- Engineer

-- Flight WY-999
('WY-999', 'CPL-5022'),   -- Co-Pilot
('WY-999', 'FA-8801');   -- Flight Attendant

SELECT*FROM FLIGHTCREW


ALTER TABLE AIRPORT
ADD orgin VARCHAR(50) NOT NULL DEFAULT 'TBD', destination VARCHAR(50) NOT NULL DEFAULT 'TBD';

UPDATE AIRPORT
SET orgin = 'Muscat', destination = 'Dubai' 
WHERE IATA = 1;

UPDATE AIRPORT
SET orgin = 'Salalah', destination = 'Muscat' 
WHERE IATA = 2;


UPDATE AIRPORT
SET orgin = 'Khasab', destination = 'Dubai' 
WHERE IATA = 4;


UPDATE AIRPORT
SET orgin = 'Duqum', destination = 'Muscat' 
WHERE IATA = 3;

UPDATE AIRPORT
SET orgin = 'Dubai', destination = 'Muscat' 
WHERE IATA = 5;