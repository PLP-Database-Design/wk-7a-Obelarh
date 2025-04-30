-- ANSWER 1

CREATE DATABASE Product;
USE Product;

CREATE DATABASE Product;
USE Product;

-- Customers table: one row per customer
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL
);

-- Orders table: one row per order
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Products per order
CREATE TABLE OrderProducts (
    OrderProductID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductName VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert customers
INSERT INTO Customers (CustomerName) VALUES
('John Doe'), 
('Jane Smith'), 
('Emily Clark');

-- Insert orders
INSERT INTO Orders (CustomerID) VALUES
(1), (2), (3);  -- OrderIDs: 1, 2, 3

-- Insert products for each order
INSERT INTO OrderProducts (OrderID, ProductName) VALUES
(1, 'Laptop'),
(1, 'Mouse'),
(2, 'Tablet'),
(2, 'Keyboard'),
(2, 'Mouse'),
(3, 'Phone');


SELECT 
    o.OrderID, 
    c.CustomerName, 
    op.ProductName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderProducts op ON o.OrderID = op.OrderID;


-- ANSWER 2

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderItems
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

SELECT 
    o.OrderID,
    o.CustomerName,
    i.Product,
    i.Quantity
FROM Orders o
JOIN OrderItems i ON o.OrderID = i.OrderID;
