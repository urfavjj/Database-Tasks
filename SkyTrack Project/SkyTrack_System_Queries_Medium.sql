USE SkyTrack_Airline_System

-- For each flight, show the flight number, the name of the origin airport, and the name of the destination airport
SELECT Flight_no, orgin, destination
FROM FLIGHT f INNER JOIN AIRPORT a ON f.IATA = a.IATA

-- Show each booking along with the full name of the passenger who made it and the flight number it belongs to.
SELECT Booking_Id, CONCAT(Fname, ' ', Lname) AS Full_Name, f.Flight_no
FROM BOOKING b INNER JOIN PASSENGER p ON b.National_Id = p.National_Id INNER JOIN FLIGHT f ON b.Flight_no = f.Flight_no

--  List all crew members assigned to flight 'SK101', showing their full name and role
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name, CRole, f.Flight_no
FROM CREW_MEMBER c INNER JOIN FLIGHTCREW f ON c.License_no = f.License_no
WHERE Flight_No = 'SK101'

-- Show all completed flights along with the aircraft model used on each flight.
SELECT Flight_no,Model
FROM FLIGHT f INNER JOIN AIRCRAFT a ON f.Register_no = a.Register_no
WHERE Status = 'Completed'

--  For each passenger, show their full name and the total number of bookings they have made. Order by booking count from highest to lowest.
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name, COUNT(Booking_Id) AS Total_No_Bookings
FROM PASSENGER p INNER JOIN BOOKING b ON p.National_Id = b.National_Id
GROUP BY CONCAT(Fname, ' ', Lname)
ORDER BY Total_No_Bookings DESC;

-- Show the total revenue collected from each booking class
SELECT Class, SUM(Price) AS Total_revenue
FROM BOOKING
GROUP BY Class

-- Count how many flights each aircraft has been assigned to
SELECT a.Register_No, COUNT(f.Flight_no) AS No_flights
FROM AIRCRAFT a LEFT JOIN FLIGHT f ON a.Register_No = f.Register_no 
GROUP BY a.Register_no
ORDER BY No_flights ASC;

-- List all flights that have more than one booking.
SELECT b.Flight_no, COUNT(Booking_Id) AS No_Booking 
FROM BOOKING b INNER JOIN FLIGHT f ON f.Flight_No = b.Flight_no
GROUP BY b.Flight_no
HAVING COUNT(Booking_Id) > 1

-- Show the full details of all bookings — passenger name, flight number, origin airport, destination airport, class, and price paid.
SELECT b.Flight_no, CONCAT(Fname, ' ', Lname) AS Full_Name, orgin, destination, Class, Price
FROM BOOKING b INNER JOIN PASSENGER p ON b.National_Id = p.National_Id INNER JOIN FLIGHT f ON b.Flight_no = f.Flight_no INNER JOIN AIRPORT a ON f.IATA = a.IATA