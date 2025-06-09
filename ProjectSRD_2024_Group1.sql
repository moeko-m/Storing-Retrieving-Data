-- Afonso Gamito
-- Catarina Carneiro
-- Gonçalo Pacheco
-- Hassan Bhatti
-- Moeko Mitani

USE fs;

/* CREATE TABLES */
-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50),
    phone VARCHAR(15),
    address TEXT
);

-- Suppliers Table 
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_name VARCHAR(50),
    contact_phone VARCHAR(15)
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    position VARCHAR(50),
    email VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    delivery_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    line_total DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Ratings Table
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    rating_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Logs Table
CREATE TABLE Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message TEXT,
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


/* INSERT SAMPLE DATA */
-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2345678901', '789 Pine Road'),
('Bob', 'Brown', 'bob.brown@example.com', '3456789012', '101 Maple Street'),
('Charlie', 'Davis', 'charlie.davis@example.com', '4567890123', '202 Birch Lane');

-- Insert Suppliers (5 Suppliers)
INSERT INTO Suppliers (supplier_name, contact_name, contact_phone) VALUES
('Flora Supply', 'Alice Green', '555-1234'),
('Blooming Goods', 'Bob Brown', '555-5678'),
('Green Gardeners', 'Charlie White', '555-2345'),
('Petals & Blooms', 'Diana Black', '555-6789'),
('Sunny Florals', 'Eve Blue', '555-3456');

-- Insert Products
INSERT INTO Products (product_name, category, price, stock_quantity, supplier_id) VALUES
('Rose Bouquet', 'Flower', 25.00, 50, 1),
('Tulip Vase', 'Flower', 15.00, 30, 2),
('Sunflower Arrangement', 'Flower', 35.00, 20, 3),
('Lily Bouquet', 'Flower', 30.00, 40, 4),
('Orchid Arrangement', 'Flower', 40.00, 25, 5),
('Daisy Basket', 'Flower', 18.00, 60, 1),
('Peony Arrangement', 'Flower', 50.00, 15, 2),
('Gerbera Vase', 'Flower', 22.00, 45, 3),
('Tulip Bouquet', 'Flower', 28.00, 35, 4),
('Chrysanthemum Vase', 'Flower', 17.00, 55, 5);

-- Insert Employees
INSERT INTO Employees (first_name, last_name, position, email) VALUES
('Eve', 'White', 'Sales Associate', 'eve.white@example.com'),
('Mike', 'Black', 'Manager', 'mike.black@example.com'),
('Lily', 'Gray', 'Cashier', 'lily.gray@example.com');

-- Insert Orders (with transactions covering two consecutive years)
INSERT INTO Orders (customer_id, employee_id, order_date, delivery_date, total_amount) VALUES
(1, 2, '2023-06-15', '2023-06-17', 120.50),
(2, 1, '2023-07-20', '2023-07-22', 150.75),
(3, 3, '2023-09-10', '2023-09-12', 180.00),
(4, 1, '2024-01-15', '2024-01-17', 200.25),
(5, 2, '2024-02-10', '2024-02-12', 250.00),
(1, 3, '2024-03-05', '2024-03-07', 110.50),
(2, 1, '2024-04-10', '2024-04-12', 125.25),
(3, 2, '2024-05-15', '2024-05-17', 170.00),
(4, 3, '2024-06-20', '2024-06-22', 200.50),
(5, 1, '2024-07-10', '2024-07-12', 220.75),
(1, 2, '2024-08-05', '2024-08-07', 140.00),
(2, 3, '2024-09-15', '2024-09-17', 130.25),
(3, 1, '2024-10-10', '2024-10-12', 160.75),
(4, 2, '2024-11-20', '2024-11-22', 210.00),
(5, 3, '2024-12-15', '2024-12-17', 240.50),
(1, 1, '2024-01-05', '2024-01-07', 115.00),
(2, 2, '2024-02-20', '2024-02-22', 135.75),
(3, 1, '2024-03-12', '2024-03-14', 145.25),
(4, 3, '2024-04-25', '2024-04-27', 160.00),
(5, 2, '2024-05-30', '2024-06-01', 175.50);

-- Insert OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price, line_total) VALUES
(1, 1, 3, 25.00, 75.00),
(1, 2, 2, 15.00, 30.00),
(2, 1, 4, 25.00, 100.00),
(2, 3, 2, 35.00, 70.00),
(3, 2, 3, 15.00, 45.00),
(3, 4, 2, 30.00, 60.00),
(4, 5, 2, 40.00, 80.00),
(5, 1, 5, 25.00, 125.00),
(6, 2, 3, 15.00, 45.00),
(7, 3, 4, 35.00, 140.00),
(8, 4, 3, 30.00, 90.00),
(9, 5, 2, 40.00, 80.00),
(10, 1, 4, 25.00, 100.00),
(11, 2, 2, 15.00, 30.00),
(12, 3, 5, 35.00, 175.00),
(13, 4, 3, 30.00, 90.00),
(14, 5, 4, 40.00, 160.00),
(15, 1, 3, 25.00, 75.00),
(16, 2, 5, 15.00, 75.00),
(17, 3, 3, 35.00, 105.00),
(18, 4, 2, 30.00, 60.00);

-- Insert Ratings
INSERT INTO Ratings (customer_id, product_id, rating, comment, rating_date) VALUES
(1, 1, 5, 'Beautiful roses!', '2023-06-16'),
(2, 3, 4, 'Nice sunflowers, but a little expensive.', '2023-07-22'),
(3, 4, 5, 'Excellent lilies!', '2023-09-12'),
(4, 5, 3, 'Orchids are good but too costly.', '2024-01-17'),
(5, 1, 4, 'Great daisy basket.', '2024-02-12');


/* CREATE TRIGGERS */
-- Trigger 1: Update stock quantity after order
DELIMITER //
CREATE TRIGGER update_stock_quantity
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
//
DELIMITER ;

-- Trigger 2: Insert log entry when a new order is placed
DELIMITER //
CREATE TRIGGER insert_order_log
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Logs (log_message, log_date)
    VALUES (CONCAT('New order placed with ID: ', NEW.order_id), NOW());
END;
//
DELIMITER ;


/* TRIGGER DEMONSTRASTION */
-- trigger 1
INSERT INTO Orders (customer_id, employee_id, order_date, delivery_date, total_amount)
VALUES (1, 2, '2024-12-13', '2024-12-15', 120.50);

-- Check the logs table to see if the new log entry was created
SELECT * FROM Logs;

-- trigger 2
-- Insert a new order detail (this should invoke the trigger to update stock quantity)
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price, line_total) 
VALUES (1, 1, 3, 25.00, 75.00);  -- Example: order 1, product 1 with quantity 3

-- Check if the stock quantity of the product has been updated
SELECT product_id, product_name, stock_quantity 
FROM Products
WHERE product_id = 1;


/* BUSINESS QUESTIONS */
-- 1. What are the top-selling products for the past year?

SELECT p.product_name, SUM(od.quantity) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
JOIN Orders o ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 2. Which suppliers have the highest stock of products?

SELECT s.supplier_name, SUM(p.stock_quantity) AS total_stock
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY total_stock DESC;

-- 3. What is the total revenue for each month in the last year?

SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, SUM(o.total_amount) AS total_revenue
FROM Orders o
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY month
ORDER BY month;

-- 4. What are the most popular flower categories based on the number of sales?

SELECT p.category, SUM(od.quantity) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
JOIN Orders o ON od.order_id = o.order_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- 5. What are the top 5 customers who have spent the most money on orders?

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2023-01-01' AND '2024-12-31'
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


/* CREATE VIWES */
-- 1. Invoice Head View
-- This view will summarize the key details of the invoice, including the customer, order date, and total amount.

CREATE VIEW invoice_head AS
SELECT
    o.order_id AS invoice_number,
    CONCAT(c.first_name, ' ', c.last_name) AS billed_to,
    c.address AS billing_address,
    c.email AS billing_email,
    o.order_date AS date_of_issue,
    o.delivery_date,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    o.total_amount
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    employees e ON o.employee_id = e.employee_id;

-- 2. Invoice Details View
-- This view will list the products, their quantities, unit prices, and line totals for each invoice.

CREATE VIEW invoice_details AS
SELECT
    od.order_id AS invoice_number,
    p.product_name AS description,
    od.unit_price,
    od.quantity,
    od.line_total
FROM
    orderdetails od
JOIN
    products p ON od.product_id = p.product_id;



-- 3. Sample Query to Generate an Invoice
-- To display an invoice, you can query these views with a specific invoice_number (order ID)

-- Invoice Head
SELECT * FROM invoice_head WHERE invoice_number = 1;

-- Invoice Details
SELECT * FROM invoice_details WHERE invoice_number = 1;

