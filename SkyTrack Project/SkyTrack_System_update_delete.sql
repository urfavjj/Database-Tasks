USE SkyTrack_Airline_System

-- Part 2: UPDATE and DELETE
-- Update one flight status from 'Scheduled' to 'Completed'
UPDATE FLIGHT 
SET Status = 'Completed'
where Flight_no = 'WY-101'

-- Change one flight status from 'Delayed' to 'Cancelled'.
UPDATE FLIGHT
SET Status = 'Cancelled'
where Flight_no = 'OV-502'

-- Increase all Economy class booking prices by 10%.
UPDATE BOOKING
SET Price = Price * 0.10
WHERE Class = 'Economy'

-- Update one passenger's phone number
UPDATE PASS_PHONE
SET Phone = '+968 72866566'
WHERE National_Id = 84021991 AND Phone = '+968 9123 4567'

-- Move one crew member to a different role.
UPDATE CREW_MEMBER
SET CRole = 'Engineer'
WHERE License_no = 'ATPL-4001'

-- Delete one cancelled flight (The DELETE statement conflicted with the REFERENCE constraint "fk_flight_crew_no". The conflict occurred in database "SkyTrack_Airline_System", table "dbo.FLIGHTCREW", column 'Flight_no')
-- we need to delete from the flight crew first
DELETE FROM FLIGHTCREW
WHERE Flight_no = 'WY-999'

-- wee need also to delete from booking
DELETE FROM BOOKING
WHERE Flight_no = 'WY-999'

-- final we can the cancelled flight
DELETE FROM FLIGHT
WHERE Flight_no = 'WY-999'