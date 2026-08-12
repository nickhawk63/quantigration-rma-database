-- Quantigration RMA Database
-- SQL queries used to analyze customer orders and product returns.

USE QuantigrationRMA;

-- View customer records
SELECT *
FROM Customers
LIMIT 10;


-- View order records
SELECT *
FROM Orders
LIMIT 10;


-- View RMA return records
SELECT *
FROM RMA
LIMIT 10;


-- Count the total number of returns
SELECT COUNT(*) AS TotalReturns
FROM RMA;


-- Analyze returns by state
SELECT
    Customers.State,
    COUNT(*) AS TotalReturns
FROM RMA
INNER JOIN Orders
    ON RMA.OrderID = Orders.OrderID
INNER JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.State
ORDER BY TotalReturns DESC;


-- Analyze returned products by SKU
SELECT
    Orders.SKU,
    Orders.Description,
    COUNT(*) AS TotalReturns
FROM RMA
INNER JOIN Orders
    ON RMA.OrderID = Orders.OrderID
GROUP BY Orders.SKU, Orders.Description
ORDER BY TotalReturns DESC;


-- Connect customers, orders, and RMA records
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.SKU,
    RMA.RMAID,
    RMA.Reason,
    RMA.Status
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
INNER JOIN RMA
    ON Orders.OrderID = RMA.OrderID
LIMIT 25;
