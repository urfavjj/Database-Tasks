USE SkyTrack_Airline_System

-- Part 3: Data Queries

-- List all flights and their current status, ordered by departure datetime from earliest to latest.
SELECT Flight_no, Status
FROM FLIGHT
ORDER BY Dept_datetime ASC;

-- Show all passengers, ordered alphabetically by full name
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM PASSENGER
ORDER BY Full_Name ASC;

-- List all aircraft and their seating capacity, ordered from largest to smallest
SELECT Register_no, Seat_capity
FROM AIRCRAFT
ORDER BY Seat_capity DESC;

-- List all flights that have a status of 'Delayed' or 'Cancelled'
SELECT Flight_no, Status
FROM FLIGHT
WHERE Status = 'Delayed' OR Status = 'Cancelled'

-- Show all passengers whose nationality is 'Omani'
SELECT National_id, Nationality
FROM PASSENGER
WHERE Nationality = 'Omani'

-- List all airports, ordered by country
SELECT IATA, Country
FROM AIRPORT
ORDER BY Country;