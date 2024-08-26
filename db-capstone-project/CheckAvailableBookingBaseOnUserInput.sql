-- Exercise: Create SQL queries to check available bookings based on user input

-- Task 1 populate the Bookings table 

SELECT BookingId, date(BookingSlot) as BookingDate, TableNo as TableNumber, CustomerID
FROM LittleLemonDB.Bookings;

-- Task 2 create a stored procedure called CheckBooking 
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS CheckBooking; 
DELIMITER // 
CREATE PROCEDURE CheckBooking(IN bookingdate DATETIME, IN tableno INT)
BEGIN
DECLARE counter INT DEFAULT 0; 
 
SELECT COUNT(*) 
INTO counter
FROM LittleLemonDB.Bookings 
WHERE DATE(BookingSlot) = bookingdate
and TableNo = tableno; 

SELECT IF (counter > 0, 
CONCAT ('Table ' , tableno, ' is already booked'), 
CONCAT ('Table ' , tableno, ' is available') ) AS 'Booking Status'; 

END //  

-- Call stored procedure
CALL CheckBooking('2022-11-12', 3); 

CALL CheckBooking('2022-11-15', 4);


-- Task 3: create a new procedure called AddValidBooking.
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS AddValidBooking; 
DELIMITER // 
CREATE PROCEDURE AddValidBooking(IN bookingdate DATETIME, IN tableno INT)
BEGIN

DECLARE counter INT DEFAULT 0; 

START TRANSACTION; 
INSERT INTO LittleLemonDB.Bookings (TableNo, BookingSlot, EmployeeID, CustomerID)
VALUES (tableno, bookingdate, 4, 3); 

SELECT COUNT(*) 
INTO counter
FROM LittleLemonDB.Bookings 
WHERE DATE(BookingSlot) = bookingdate
AND TableNo = tableno; 


SELECT 
	IF (counter > 1 , 
		CONCAT ('Table ' , tableno, ' is already booked - booking cancelled'), 
        CONCAT ('Table ' , tableno, ' is available')) AS 'Booking status'; 

	
IF counter > 1 THEN
	ROLLBACK; 
ELSE 
	COMMIT; 
END IF; 

END //  

-- Execute stored procedure
CALL AddValidBooking('2022-11-12', 3); 

CALL AddValidBooking('2022-11-14', 3); 
