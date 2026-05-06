DROP DATABASE IF EXISTS session03;
CREATE DATABASE session03;
USE session03;

/*
Phân tích 
Input: lấy dữ liệu từ bảng CUSTOMERS
Output: các cột fullname, email
SELECT * không được dùng vì:
- Tốn dung lượng và gây lag hệ thống
- Bảng CUSTOMERS có nhiều dữ liệu có thể sẽ đọc thừa

Giải pháp
- Thêm NOT NULL ở email để chặn trống dữ liệu
- Chặn tài khoản bị khóa 
CREATE TABLE CUSTOMERS (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
	FullName VARCHAR(100),
	Email VARCHAR(100),
	City VARCHAR(50),
	LastPurchaseDate DATE,
	Status VARCHAR(20),
	Gender VARCHAR(10),
	DateOfBirth DATE,
	Points INT,
	Address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO CUSTOMERS (FullName, Email, City, LastPurchaseDate, Status) VALUES
('Nguyễn Văn A', 'anv@gmail.com', 'Hà Nội', '2025-05-20', 'Active'),
('Trần Thị B', 'btt@gmail.com', 'Hà Nội', '2026-02-10', 'Active'),
('Lê Văn C', NULL, 'Hà Nội, 2025-01-15', 'Active'),
( 'Phạm Minh D', 'dpm@gmail.com', 'Hà Nội', '2024-12-01', 'Locked'),
('Hoàng An E', 'eha@gmail.com', 'TP HCM', '2025-03-01', 'Active');
*/

CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    LastPurchaseDate DATE,
    Status VARCHAR(20),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Points INT,
    Address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO CUSTOMERS (FullName, Email, City, LastPurchaseDate, Status) VALUES
('Nguyễn Văn A', 'anv@gmail.com', 'Hà Nội', '2025-05-20', 'Active'),
('Trần Thị B', 'btt@gmail.com', 'Hà Nội', '2026-02-10', 'Active'),
('Phạm Minh D', 'dpm@gmail.com', 'Hà Nội', '2024-12-01', 'Locked'),
('Hoàng An E', 'eha@gmail.com', 'TP HCM', '2025-03-01', 'Active');

SELECT FullName, Email 
FROM CUSTOMERS
WHERE Email IS NOT NULL 
  AND Status = 'Active'
  AND City = 'Hà Nội'
  AND LastPurchaseDate < '2025-11-01';