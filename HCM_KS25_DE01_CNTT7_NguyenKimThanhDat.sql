CREATE DATABASE SalesManagement;

USE SalesManagement;

CREATE TABLE Products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE Orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    totalAmount DECIMAL(10,0) NOT NULL,

    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Detail(
	order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    
    PRIMARY KEY(order_id, product_id),
    
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

ALTER TABLE Orders
ADD note TEXT;

ALTER TABLE Products
CHANGE manufacturer NhaSanXuat VARCHAR(100) NOT NULL;

DROP TABLE Order_Detail;
DROP TABLE Orders;

-- PRODUCTS
INSERT INTO Products(product_name, NhaSanXuat, price, stock) 
VALUES
('RAM 8GB DDR4', 'Kingston', 500000, 50),
('SSD 256GB', 'Samsung', 1200000, 30),
('HDD 1TB', 'Western Digital', 900000, 40),
('CPU i5', 'Intel', 5000000, 20),
('Mainboard B460', 'Asus', 2500000, 15),
('MacBook M1', 'Apple', 20000000, 10);

-- CUSTOMERS
INSERT INTO Customers(full_name, email, phone, address)
VALUES
('Nguyen Van A', 'a@gmail.com', '0900000001', 'Ha Noi'),
('Tran Thi B', 'b@gmail.com', '0900000002', 'TP HCM'),
('Le Van C', 'c@gmail.com', '0900000003', 'Da Nang'),
('Pham Thi D', 'd@gmail.com', '0900000004', 'Can Tho'),
('Hoang Van E', 'e@gmail.com', '0900000005', 'Hai Phong');

-- ORDERS
INSERT INTO Orders(customer_id, totalAmount) VALUES
(1, 2200000),
(2, 5000000),
(3, 1400000),
(4, 7500000),
(5, 3000000);

-- Order_Detail
INSERT INTO Order_Detail(order_id, product_id, quantity, price) 
VALUES
-- Order 1
(1, 1, 2, 500000),
(1, 2, 1, 1200000),

-- Order 2
(2, 4, 1, 5000000),

-- Order 3
(3, 3, 1, 900000),
(3, 1, 1, 500000),

-- Order 4
(4, 4, 1, 5000000),
(4, 5, 1, 2500000),

-- Order 5
(5, 2, 1, 1200000),
(5, 3, 2, 900000);

SET SQL_SAFE_UPDATES = 0;

UPDATE Products
SET price = price * 1.1
WHERE NhaSanXuat = 'Apple';

DELETE FROM Customers
WHERE phone IS NULL;

SELECT * FROM Products
WHERE price BETWEEN 10000000 AND 20000000;

SELECT product_id FROM Order_Detail
WHERE order_id = 1;

SELECT order_id FROM Order_Detail
WHERE product_id = 6;