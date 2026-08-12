-- Quantigration RMA Database
-- Database setup demonstrating relational database design in MySQL.

CREATE DATABASE IF NOT EXISTS QuantigrationRMA;

USE QuantigrationRMA;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Telephone VARCHAR(20)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    SKU VARCHAR(50),
    Description VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- RMA table
CREATE TABLE RMA (
    RMAID INT PRIMARY KEY,
    OrderID INT,
    RMADate DATE,
    Reason VARCHAR(100),
    Status VARCHAR(50),
    Step VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
