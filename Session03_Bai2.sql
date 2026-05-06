DROP DATABASE IF EXISTS session03;
CREATE DATABASE session03;
USE session03;

/*
-- Phân tích lỗi
VALUES ('Giao Hàng Nhanh, '0901234567');
1. Lỗi cú pháp thiếu dấu ' nên toàn bộ code sẽ báo đỏ

INSERT INTO SHIPPERS
VALUES ('Viettel Post');
2. Lỗi cấu trúc sau INSERT INTO SHIPPERS nên cung cấp đầy đủ thông tin cột nếu ko sẽ báo đỏ

CREATE TABLE SHIPPERS (
ShipperID INT PRIMARY KEY AUTO_INCREMENT,
ShipperName VARCHAR(255),
Phone VARCHAR(20)
);

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh, '0901234567');

INSERT INTO SHIPPERS
VALUES ('Viettel Post');
*/

CREATE TABLE SHIPPERS (
ShipperID INT PRIMARY KEY AUTO_INCREMENT,
ShipperName VARCHAR(255),
Phone VARCHAR(20)
);

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567');

INSERT INTO SHIPPERS(ShipperName, Phone)
VALUES ('Viettel Post', '0901234568');