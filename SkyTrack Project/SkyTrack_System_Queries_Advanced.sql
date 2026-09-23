USE SkyTrack_Airline_System;

--  Show each flight with its flight number, origin airport, destination airport, aircraft model, and the total number of passengers booked on it. Include flights that have no bookings.
SELECT f.Flight_no, a.orgin, a.destination, ac.Model, COUNT(Booking_Id) AS Total_passenger
FROM FLIGHT f INNER JOIN AIRPORT a ON f.IATA = a.IATA INNER JOIN AIRCRAFT ac ON f.Register_no = ac.Register_no LEFT JOIN BOOKING b ON f.Flight_no = b.Flight_no 
GROUP BY f.Flight_no, a.orgin, a.destination, ac.Model

-- List all passengers who have never made a booking.
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name, p.National_Id, Nationality
FROM PASSENGER p LEFT JOIN BOOKING b ON p.National_Id = b.National_Id
WHERE b.Booking_Id IS NULL

-- For each flight, show the flight number and the total revenue generated from its bookings. Show only flights where the total revenue exceeds 500. Order from highest to lowest.
SELECT f.Flight_no, SUM(Price) AS Total_revenue
FROM FLIGHT f INNER JOIN BOOKING b ON f.Flight_no = b.Flight_no
GROUP BY f.Flight_no
HAVING SUM(Price) > 500 
ORDER BY Total_revenue DESC;

-- Show each crew member's full name and the total number of flights they have been assigned to. Show only crew members assigned to more than one flight.
SELECT CONCAT(c.Fname, ' ', c.Lname) AS Full_Name, COUNT(fc.Flight_no) AS Total_flights
FROM CREW_MEMBER c INNER JOIN FLIGHTCREW fc ON c.License_no = fc.License_no
GROUP BY c.License_no, CONCAT(c.Fname, ' ', c.Lname) 
HAVING COUNT(fc.Flight_no) > 1

-- Find the average booking price per flight. Show only flights where the average price is above the overall average price across all bookings.
SELECT Flight_no, AVG(Price) AS avrage_price
FROM BOOKING 
GROUP BY Flight_no
HAVING AVG(Price) > (SELECT AVG(Price) AS avrage_price FROM BOOKING)


--  Show the flight with the highest number of bookings. Display its flight number, origin, destination, and total bookings.
SELECT TOP 1 (f.Flight_no) , orgin, destination, COUNT(Booking_Id) AS Total_Bookings
FROM FLIGHT f INNER JOIN AIRPORT a ON f.IATA = a.IATA INNER JOIN BOOKING b ON f.Flight_no = b.Flight_no 
GROUP BY f.Flight_no, orgin, destination
ORDER BY Total_Bookings DESC;

-- For each booking class, show the total revenue, the number of bookings, the average price, the highest price, and the lowest price.
SELECT Class, f.Flight_no, orgin, destination, COUNT(Booking_Id) AS Total_Bookings
FROM Flight f INNER JOIN AIRPORT a ON f.IATA = a.IATA INNER JOIN BOOKING b ON f.Flight_no = b.Flight_no
GROUP BY Class, f.Flight_no, orgin, destination
ORDER BY Total_Bookings DESC;

--  List all passengers who booked a flight that is currently 'Cancelled'. Show the passenger name, flight number, and booking date.
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name, b.Flight_no, Booking_date
FROM BOOKING b INNER JOIN PASSENGER p ON b.National_Id = p.National_Id INNER JOIN FLIGHT f ON f.Flight_no = f.Flight_no
WHERE Status = 'Cancelled';

-- Show all flights that have at least one pilot and at least one flight attendant assigned. Display the flight number, total crew count, and departure datetime
SELECT f.Flight_no, COUNT(fc.License_no) AS Total_crew, f.Dept_datetime
FROM FLIGHT f INNER JOIN FLIGHTCREW fc ON f.Flight_no = fc.Flight_no INNER JOIN CREW_MEMBER c ON fc.License_no = c.License_no
WHERE f.Flight_no IN (
    SELECT fc1.Flight_no 
    FROM FLIGHTCREW fc1 INNER JOIN CREW_MEMBER c1 ON fc1.License_no = c1.License_no
    WHERE c1.CRole IN ('Pilot', 'Co-Pilot')
) AND f.Flight_no IN (
    SELECT fc2.Flight_no 
    FROM FLIGHTCREW fc2 INNER JOIN CREW_MEMBER c2 ON fc2.License_no = c2.License_no
    WHERE c2.CRole = 'Flight Attendant')
GROUP BY f.Flight_no, f.Dept_datetime;


--  FINAL CHALLENGE
SELECT f.Flight_no, orgin, destination, Model, Manufacturer, COUNT(DISTINCT b.Booking_Id) AS Total_Passengers_Booked, COUNT(DISTINCT fc.License_no) AS Total_Crew_Assigned, ISNULL(SUM(DISTINCT b.Price), 0) AS Total_Revenue
FROM FLIGHT f INNER JOIN AIRPORT a ON f.IATA = a.IATA INNER JOIN AIRCRAFT ac ON f.Register_no = ac.Register_no LEFT JOIN BOOKING b ON f.Flight_no = b.Flight_no LEFT JOIN FLIGHTCREW fc ON f.Flight_no = fc.Flight_no
GROUP BY f.Flight_no, orgin, a.destination, ac.Model, ac.Manufacturer
ORDER BY Total_Revenue DESC;