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
-- Call stored procedure
CALL GetMaxQuantity();


-- Task 2: create a prepared statement called GetOrderDetail
PREPARE GetOrderDetail FROM 'SELECT om.OrderId, SUM(om.Quantity) AS "Quantity", SUM(o.TotalCost) AS Cost
FROM LittleLemonDB.Orders AS o
INNER JOIN LittleLemonDB.OrderMenuItems as om 
ON o.OrderID = om.OrderID
WHERE o.CustomerID = ? GROUP BY om.OrderID '; 

-- Setting the @id
SET @id = 1;
-- Executing the statement
EXECUTE GetOrderDetail USING @id;


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

SELECT * from Orders;
SELeCT * from OrderMenuItems;

-- Call Stored Procedure
CALL CancelOrder(3); 
