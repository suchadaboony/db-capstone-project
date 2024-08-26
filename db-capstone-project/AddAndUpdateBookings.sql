-- Exercise: Create SQL queries to add and update bookings

-- Task 1 create a new procedure called AddBooking 
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER // 
CREATE PROCEDURE AddBooking(
	IN bookingid INT,
    IN customerid INT,
	IN tableno INT,
    IN bookingdate DATETIME)
BEGIN

INSERT INTO LittleLemonDB.Bookings (BookingID, CustomerID, TableNo, BookingSlot, EmployeeID)
VALUES (bookingid, customerid, tableno, bookingdate, 4); 

SELECT 'New Booking added' AS Confirmation;

END //  

-- Call stored procedure
-- AddBooking(bookingid, customerid, tableno, bookingdate)
CALL AddBooking(9, 3, 4, '2022-11-13'); 





-- Task 2. create a new procedure called UpdateBooking
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS UpdateBooking; 
DELIMITER // 
CREATE PROCEDURE UpdateBooking(
	IN bookingid INT,
    IN newbookingdate DATETIME)
BEGIN
update LittleLemonDB.Bookings 
SET LittleLemonDB.Bookings.BookingSlot = newbookingdate 
where LittleLemonDB.Bookings.BookingID = bookingid;

SELECT CONCAT('Booking ',bookingid ,' updated' ) AS Confirmation;
END //  


CALL UpdateBooking(9, '2022-11-12');

select * FROM LittleLemonDB.Bookings where BookingID = 9;


-- Task 3. create a new procedure called CancelBooking 
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS CancelBooking; 
DELIMITER // 
CREATE PROCEDURE CancelBooking(IN bookingid INT)
BEGIN

DELETE FROM LittleLemonDB.Bookings 
WHERE LittleLemonDB.Bookings.BookingID = bookingid;

SELECT CONCAT('Booking ',bookingid ,' is cancelled' ) AS Confirmation;
END  // 


CALL CancelBooking(9); 

select * FROM LittleLemonDB.Bookings where BookingID = 9;

 
 





