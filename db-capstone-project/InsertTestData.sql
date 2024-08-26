-- Insert test data-- 

-- INSERT INTO LittleLemonDB.MenuItems(MenuItemsID, CourseName, StarterName, DesertName) 
-- VALUES
-- (1,	'Bruschetta al Pomodoro',	'Spaghetti alla Carbonara'	,'Tiramisu')
-- ,(2,'Caprese Salad','Lasagna al Forno'	,'Panna Cotta')
-- ,(3,'Prosciutto e Melone',	'Ossobuco alla Milanese',	'Cannoli Siciliani')
-- ,(4,'Fritto Misto',	'Risotto ai Funghi Porcini',	'Gelato')
-- ,(5, 'Carpaccio di Manzo',	'Saltimbocca alla Romana',	'Zuppa Inglese');

-- INSERT INTO LittleLemonDB.Menus(MenuID, Cuisines, MenuName,Description, Price, MenuItemID)
-- VALUES
--  (1, 'Italian','Set Menu 1', '', 75, 1)
-- ,(2, 'Italian','Set Menu 2', '', 90, 2)
-- ,(3, 'Italian','Set Menu 3', '', 85, 3)
-- ,(4, 'Italian','Set Menu 4', '', 75, 4)
-- ,(5, 'Italian','Set Menu 5', '', 120, 5);

-- INSERT INTO LittleLemonDB.Address(AddressID, AddressLine1, AddressLine2, City, Postcode)
-- VALUES (1, '22 First Street', '' , 'Richmond', 2234)
-- , (2, '1 Fifth Street', '' , 'Richmond', 2234)
-- , (3, 'Flat 2 Unit 2 Second Street', '' , 'Richmond', 2234);

-- INSERT INTO LittleLemonDB.Customers(CustomerID, FirstName, LastName, ContactNo, Email, AddressID)
-- VALUES 
-- (1, 'Tom', 'Smith', 949333222, 'tsmith@email.com', 1)
-- ,(2,'Rose','Bloom', 696234122, 'lbloom@email.com', 2)
-- ,(3,'Kris', 'Lee', 575223111, 'KLee@email.com',3); 

-- INSERT INTO LittleLemoOrdersnDB.Orders(OrderID, OrderDate,TotalCost,DeliveryCost,DeliveryStatus,DeliveryDate,CustomerID) 
-- values
-- (1,'2024-08-20', 250, 10, 'Delivered', '2024-08-20', 1 )
-- ,(2,'2024-08-20', 255, 10, 'Delivered', '2024-08-20', 2 ); 

-- INSERT INTO LittleLemonDB.OrderMenuItems(OrderID, MenuID, UnitPrice, Quantity)
-- VALUES 
-- (1,1,75,2)
-- ,(1,2,90,1)
-- ,(2,3,85,2)
-- ,(2,4,75,1); 

-- ---- -------------------------
-- INSERT INTO LittleLemonDB.Orders
-- (OrderID, OrderDate,TotalCost,DeliveryCost
-- ,DeliveryStatus,DeliveryDate,CustomerID) 
-- values(3,'2024-08-20', 370, 10, 'Delivered', '2024-08-20', 3 );

-- INSERT INTO LittleLemonDB.OrderMenuItems(OrderID, MenuID, UnitPrice, Quantity)
-- VALUES (3,5,120,3)
-- ---- -------------------------

-- ---- -------------------------
INSERT INTO LittleLemonDB.Address(AddressLine1, AddressLine2, City, Postcode)
VALUES('123 First Street', '', 'Richmond', 1234)
,('343 Second Street', '', 'Brighton', 3433)
,('33 Third Street', '', 'Frankston', 2323)
,('34 Mayland Street', '', 'Brighton', 1111)
,('34 Thomson Street', '', 'Chelsea', 3443)
,('4 James Street', '', 'Richmond', 1111)
,('5 Love Street', '', 'Richmond', 3333)
,('333 Third Street', '', 'Frankston', 2323)
,('344 Mayland Street', '', 'Brighton', 1111)
,('534 Tessy Street', '', 'Chelsea', 3443)
,('47 Spring Street', '', 'Richmond', 1111)
,('58 Lovely Street', '', 'Richmond', 3333);
-- ---- --------------------------- 
-- select * from LittleLemonDB.Address;

-- MOre customer
INSERT INTO LittleLemonDB.Customers( FirstName, LastName, ContactNo, Email, AddressID)
VALUES 
('Tess', 'Hobs', 66667645, 'thob@email.com', 4)
,('Dasie','Pink', 69626122, 'dpinkk@email.com', 5)
,('Bart', 'Simsons', 77765433, 'bsimson@email.com',6); 

-- ---- -------------------------
INSERT INTO LittleLemonDB.Employees (EmployeeID, FirstName, Lastname, Role, Salary, ContactNo, Email,AddressID) 
VALUES 
(1, 'Sam', 'Young','Manager',80000,92974444,'syoung@email.com',7)
,(2, 'Jo', 'Boyd','Chef',100000,22346786,'jboyd@email.com',8)
,(3, 'Bob', 'Smith','Chef',80000,33443422,'bsmith@email.com',9)
,(4, 'Marissa', 'Jones','Waitress',69000,65543444,'mjones@email.com',10)
,(5, 'Jackson', 'Phil','Waiter',69000,44556677,'jphil@email.com',11); 


-- ---- --------------------------- 

-- ---- --------------------------- 
INSERT INTO LittleLemonDB.Bookings (BookingID, TableNo, BookingSlot, EmployeeID, CustomerID)
VALUES 
(1, 5, '2022-10-10 18:00:00', 4,1)
,(2,3, '2022-11-12 18:30:00', 5,3)
,(3,2, '2022-10-11 20:00:00', 4,2)
,(4,2, '2022-10-13 19:00:00', 5,1); 

-- -- -------------------------
