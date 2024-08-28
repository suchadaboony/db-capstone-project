
-- Run this script to insert test data and create all stored procedures
-- SETUP: Insert test data
USE LittleLemonDB; 
INSERT INTO LittleLemonDB.MenuItems (
        MenuItemID,
        CourseName,
        StarterName,
        DesertName
    )
VALUES (
        1,
        'Bruschetta al Pomodoro',
        'Spaghetti alla Carbonara',
        'Tiramisu'
    ),
    (
        2,
        'Caprese Salad',
        'Lasagna al Forno',
        'Panna Cotta'
    ),
    (
        3,
        'Prosciutto e Melone',
        'Ossobuco alla Milanese',
        'Cannoli Siciliani'
    ),
    (
        4,
        'Fritto Misto',
        'Risotto ai Funghi Porcini',
        'Gelato'
    ),
    (
        5,
        'Carpaccio di Manzo',
        'Saltimbocca alla Romana',
        'Zuppa Inglese'
    );

INSERT INTO LittleLemonDB.Menus (
        MenuID,
        Cuisines,
        MenuName,
        Description,
        Price,
        MenuItemID
    ) VALUES (
        1,
        'Italian',
        'Set Menu 1',
        '',
        75,
        1
    ),
    (
        2,
        'Italian',
        'Set Menu 2',
        '',
        90,
        2
    ),
    (
        3,
        'Italian',
        'Set Menu 3',
        '',
        85,
        3
    ),
    (
        4,
        'Italian',
        'Set Menu 4',
        '',
        75,
        4
    ),
    (
        5,
        'Italian',
        'Set Menu 5',
        '',
        120,
        5
    );  
INSERT INTO LittleLemonDB.Address (
        AddressID,
        AddressLine1,
        AddressLine2,
        City,
        Postcode
    )
VALUES (
        1,
        '22 First Street',
        '',
        'Richmond',
        2234
    ),
    (
        2,
        '1 Fifth Street',
        '',
        'Richmond',
        2234
    ),
    (
        3,
        'Flat 2 Unit 2 Second Street',
        '',
        'Richmond',
        2234
    ),
    (
        4,
        '123 First Street',
        '',
        'Richmond',
        1234
    ),
    (
        5,
        '343 Second Street',
        '',
        'Brighton',
        3433
    ),
    (
        6,
        '33 Third Street',
        '',
        'Frankston',
        2323
    ),
    (
        7,
        '34 Mayland Street',
        '',
        'Brighton',
        1111
    ),
    (
        8,
        '34 Thomson Street',
        '',
        'Chelsea',
        3443
    ),
    (
        9,
        '4 James Street',
        '',
        'Richmond',
        1111
    ),
    (
        10,
        '5 Love Street',
        '',
        'Richmond',
        3333
    ),
    (
        11,
        '333 Third Street',
        '',
        'Frankston',
        2323
    );
INSERT INTO LittleLemonDB.Customers (
        CustomerID,
        FirstName,
        LastName,
        ContactNo,
        Email,
        AddressID
    )
VALUES (
        1,
        'Tom',
        'Smith',
        949333222,
        'tsmith@email.com',
        1
    ),
    (
        2,
        'Rose',
        'Bloom',
        696234122,
        'lbloom@email.com',
        2
    ),
    (
        3,
        'Kris',
        'Lee',
        575223111,
        'KLee@email.com',
        3
    ),
    (
        4, 
        'Tess',
        'Hobs',
        66667645,
        'thob@email.com',
        4
    ),
    (
        5,
        'Dasie',
        'Pink',
        69626122,
        'dpinkk@email.com',
        5
    ),
    (
        6,
        'Bart',
        'Simsons',
        77765433,
        'bsimson@email.com',
        6
    );

INSERT INTO LittleLemonDB.Orders (
        OrderID,
        OrderDate,
        TotalCost,
        DeliveryCost,
        DeliveryStatus,
        DeliveryDate,
        CustomerID
    )
VALUES (
        1,
        '2024-08-20',
        250,
        10,
        'Delivered',
        '2024-08-20',
        1
    ),
    (
        2,
        '2024-08-20',
        255,
        10,
        'Delivered',
        '2024-08-20',
        2
    );
INSERT INTO LittleLemonDB.OrderMenuItems (
        OrderID,
        MenuID,
        UnitPrice,
        Quantity
    )
VALUES (1, 1, 75, 2),
    (1, 2, 90, 1),
    (2, 3, 85, 2),
    (2, 4, 75, 1);
    
INSERT INTO LittleLemonDB.Employees (
        EmployeeID,
        FirstName,
        Lastname,
        Role,
        Salary,
        ContactNo,
        Email,
        AddressID
    )
VALUES (
        1,
        'Sam',
        'Young',
        'Manager',
        80000,
        92974444,
        'syoung@email.com',
        7
    ),
    (
        2,
        'Jo',
        'Boyd',
        'Chef',
        100000,
        22346786,
        'jboyd@email.com',
        8
    ),
    (
        3,
        'Bob',
        'Smith',
        'Chef',
        80000,
        33443422,
        'bsmith@email.com',
        9
    ),
    (
        4,
        'Marissa',
        'Jones',
        'Waitress',
        69000,
        65543444,
        'mjones@email.com',
        10
    ),
    (
        5,
        'Jackson',
        'Phil',
        'Waiter',
        69000,
        44556677,
        'jphil@email.com',
        11
    );
INSERT INTO LittleLemonDB.Bookings (
        BookingID,
        TableNo,
        BookingSlot,
        EmployeeID,
        CustomerID
    )
VALUES (
        1,
        5,
        '2022-10-10 18:00:00',
        4,
        1
    ),
    (
        2,
        3,
        '2022-11-12 18:30:00',
        5,
        3
    ),
    (
        3,
        2,
        '2022-10-11 20:00:00',
        4,
        2
    ),
    (
        4,
        2,
        '2022-10-13 19:00:00',
        5,
        1
    );

-- Exercise: Create SQL queries to add and update bookings
-- Task 1 create a new procedure called AddBooking 
USE LittleLemonDB; 
DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER // 
CREATE PROCEDURE AddBooking(
	IN bid INT,
    IN cid INT,
	IN tableno INT,
    IN bookingdate DATETIME)
BEGIN
	DECLARE counter INT DEFAULT 0;
	SELECT COUNT(Customers.CustomerId) INTO counter FROM LittleLemonDB.Customers WHERE CustomerID = cid; 
    -- Check if customer is a new customer, if is this a new customer then add new customer 
	IF counter = 0 THEN 
		INSERT INTO LittleLemonDB.Customers (CustomerID,FirstName,LastName,ContactNo, Email,AddressID) 
        VALUES (cid,NULL, NULL, NULL,NULL, NULL); 
	END IF;
	-- Add booking
	INSERT INTO LittleLemonDB.Bookings (BookingID, CustomerID, TableNo, BookingSlot, EmployeeID)
	VALUES (bid, cid, tableno, bookingdate, 4);
	SELECT CONCAT('New BookingId: ',bid,' is added for CustomerId: ', cid) AS Confirmation;
END //  
DELIMITER ;

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
DELIMITER ;

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
DELIMITER ;

-- Exercise: Create SQL queries to check available bookings based on user input
-- Task 1 populate the Bookings table 

-- SELECT BookingId, date(BookingSlot) as BookingDate, TableNo as TableNumber, CustomerID
-- FROM LittleLemonDB.Bookings;

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
DELIMITER ;

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

SELECT COUNT(*) INTO counter FROM LittleLemonDB.Bookings 
WHERE DATE(BookingSlot) = bookingdate AND TableNo = tableno; 

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
DELIMITER ;

-- TASK 1 create procedure GetMaxQuantity
USE LittleLemonDB;
DROP PROCEDURE IF EXISTS GetMaxQuantity; 
DELIMITER //
CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order'
FROM (
SELECT om.OrderId, SUM(om.Quantity) AS 'Quantity'
FROM LittleLemonDB.Orders AS o
INNER JOIN LittleLemonDB.OrderMenuItems as om
ON o.OrderID = om.OrderID
GROUP BY om.OrderID ) AS t;
END// 
DELIMITER ;


-- Task 3: create a stored procedure called CancelOrder
USE LittleLemonDB;
DROP PROCEDURE IF EXISTS CancelOrder; 
DELIMITER //
CREATE PROCEDURE `CancelOrder` (IN id INT)
BEGIN
DELETE FROM LittleLemonDB.OrderMenuItems WHERE OrderID = id; 
DELETE FROM LittleLemonDB.Orders WHERE OrderID = id;
SELECT CONCAT ('Order ', id, ' is cancelled') AS Confirmation; 
END// 
DELIMITER ;






 






    
    
    