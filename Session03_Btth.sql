DROP DATABASE IF EXISTS session03;
CREATE DATABASE session03;
USE session03;

CREATE TABLE products (
    product_id CHAR(5) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    size VARCHAR(10),
    price DECIMAL(18, 2) NOT NULL CHECK (price >= 0)
);

INSERT INTO products (product_id, product_name, size, price) 
VALUES ('P01', 'Áo sơ mi trắng', 'L', 250000),
		('P02', 'Quần Jean xanh', 'M', 450000),
		('P03', 'Áo thun Basic', 'XL', 150000),
        ('P04', 'Áo hoodie', NULL, 0);
        
UPDATE products 
SET price = 400000 
WHERE product_id = 'P02';

UPDATE products 
SET price = price * 1.1;

DELETE FROM products 
WHERE product_id = 'P03';

SELECT product_id, product_name, size, price FROM products;

SELECT product_name, size FROM products;

SELECT product_id, product_name, price FROM products 
WHERE price > 300000;