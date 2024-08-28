
-- Task1: Create View
USE LittleLemonDB; 
CREATE VIEW OrderView AS
SELECT Orders.OrderID, SUM(Quantity) AS Quantity, TotalCost AS Cost
FROM LittleLemonDB.Orders
INNER JOIN LittleLemonDB.OrderMenuItems
ON Orders.OrderID = OrderMenuItems.OrderID
GROUP BY Orders.OrderID, Orders.TotalCost
HAVING SUM(Quantity) > 2; 


-- Task2: 
SELECT Customers.CustomerID, CONCAT(FirstName," ", LastName) AS FullName
,Orders.OrderID, TotalCost AS Cost, Menus.MenuName, MenuItems.CourseName
FROM LittleLemonDB.Customers 
INNER JOIN LittleLemonDB.Orders 		ON Customers.CustomerID = Orders.CustomerID
INNER JOIN LittleLemonDB.OrderMenuItems ON OrderMenuItems.OrderID = Orders.OrderID
INNER JOIN LittleLemonDB.Menus 			ON Menus.MenuID = OrderMenuItems.MenuID
INNER JOIN LittleLemonDB.MenuItems 		ON MenuItems.MenuItemsID = Menus.MenuItemID
WHERE TotalCost > 150
ORDER BY TotalCost ; 



-- Task3: 
SELECT MenuName
FROM LittleLemonDB.Menus
WHERE MenuID IN (
SELECT MenuID 
FROM LittleLemonDB.OrderMenuItems
WHERE Quantity > 2)

