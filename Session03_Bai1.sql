DROP DATABASE IF EXISTS session03;
CREATE DATABASE session03;
USE session03;

/*
-- Phân tích lỗi:
UPDATE mà không có WHERE sẽ cập nhật tất cả các bẳng
Nên sẽ giảm giá tất cả các món đồ khiến siêu thị lỗ

CREATE TABLE PRODUCTS (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
OriginalPrice DECIMAL(18,2)
);

INSERT INTO PRODUCTS (ProductID, ProductName, Category, OriginalPrice)
VALUES
(1, 'iPhone 15', 'Electronics', 20000000),
(2, 'Samsung Refrigerator', 'Electronics', 15000000),
(3, 'Water Spinach', 'Food', 10000),
(4, 'Filtered Fresh Milk 4', 'Food', 28000);

UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9;
*/

CREATE TABLE PRODUCTS (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
OriginalPrice DECIMAL(18,2)
);

INSERT INTO PRODUCTS (ProductID, ProductName, Category, OriginalPrice)
VALUES
(1, 'iPhone 15', 'Electronics', 20000000),
(2, 'Samsung Refrigerator', 'Electronics', 15000000),
(3, 'Water Spinach', 'Food', 10000),
(4, 'Filtered Fresh Milk 4', 'Food', 28000);

UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9
WHERE ProductID = 3;