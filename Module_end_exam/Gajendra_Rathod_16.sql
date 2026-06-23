-- SET- 5012                                            PGCP-BDA (Feb 26 Batch)
--  Date : 17/04/2026
-- —------------------------------------------------------------------------------------------------------------------------ 
-- Note: Submit a .sql file for MYSQL with its name as your PRN number_name 
-- (eg: 01_Rahul_Sinha.sql)
-- —------------------------------------------------------------------------------------------------------------------------ 
-- Section 1: Basic SQL (6 Marks)
-- Q1. (6 Marks)
-- Write a CREATE TABLE statement for a table task with the following structure:
-- task_id (Primary Key, Auto Increment)
-- task_name (VARCHAR, NOT NULL)
-- due_date (DATE)
-- Ensure the storage engine is InnoDB.

CREATE TABLE task(
	task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(50) NOT NULL,
    due_date date
)Engine =InnoDb;


-- Insert the following records (let PK auto-generate):
-- ('Data Cleaning', '2025-03-01')
-- ('Model Training', '2025-03-15')

INSERT INTO task (task_name, due_date) VALUES ('Data Cleaning','2025-03-01');
INSERT INTO task (task_name, due_date) VALUES ('Model Training','2025-03-15');
SELECT * FROM task;

-- Update:
-- Change task_name = 'Model Training' to 'ML Training' using a proper condition.

UPDATE task
SET task_name = 'ML Training'
WHERE task_name = 'Model Training';

SET SQL_SAFE_UPDATES = 0;

-- Retrieve all tasks where task_name starts with 'D'.
SELECT * FROM task 
WHERE task_name LIKE 'D%';


-- Section 2: Work on Given Schema (classicmodels) (34 Marks)
USE classicmodels;

-- Q2. DDL & DML Operations (2 Marks)
-- a) Add a column:
--  profit_margin DECIMAL(5,2) NOT NULL DEFAULT 0.00
--  to the products table.
-- Then update it to 20.00 for all products where productLine = 'Classic Cars'.
ALTER TABLE products 
ADD COLUMN profit_margin DECIMAL(5,2) NOT NULL DEFAULT 0.00;


UPDATE products 
SET profit_margin = 20.00 
WHERE productLine = 'Classic Cars';

-- b) Perform the following on customers table:
-- Add column: contact_name VARCHAR(120)
-- Populate using CONCAT(contactFirstName, ' ', contactLastName)
ALTER TABLE customers
ADD COLUMN contact_name VARCHAR(120); 


UPDATE customers 
SET contact_name = CONCAT(contactFirstName, ' ', contactLastName);


-- Q3. Aggregation & Joins (4 Marks)
-- List the following for all orders placed in February 2005:
-- orderNumber
-- customer_name (use CONCAT)
-- total_quantity
-- total_amount
-- Order the result by total_quantity (descending).

SELECT 
    ord.orderNumber,
    CONCAT(c.contactFirstName, ' ', c.contactLastName) AS customer_name,
    SUM(od.quantityOrdered) AS total_quantity,
    SUM(od.quantityOrdered * od.priceEach) AS total_amount
FROM orders ord
JOIN customers c ON ord.customerNumber = c.customerNumber
JOIN orderdetails od ON ord.orderNumber = od.orderNumber
WHERE ord.orderDate BETWEEN '2005-02-01' AND '2005-02-28'
GROUP BY ord.orderNumber, customer_name
ORDER BY total_quantity DESC;


-- Q4. Analytical Query (3 Marks)
-- Find the top 5 products by total quantity sold.
-- Display:
-- productCode
-- productName
SELECT * FROM products;
select * from orderdetails;

SELECT 
    vastu.productCode,
    vastu.productName,
    SUM(od.quantityOrdered) AS totalQuantitySold
FROM products vastu
JOIN orderdetails od ON vastu.productCode = od.productCode
GROUP BY vastu.productCode, vastu.productName
ORDER BY totalQuantitySold DESC
LIMIT 5;

-- Q5. Trigger (6 Marks)
-- Create a BEFORE UPDATE trigger on products such that:
-- If MSRP < buyPrice, automatically set MSRP = buyPrice * 1.10


DELIMITER $$
CREATE TRIGGER trg_before_update_product 
BEFORE UPDATE ON products
FOR EACH ROW 
BEGIN
	IF NEW.MSRP < NEW.buyprice THEN 
		SET NEW.MSRP = NEW.buyprice * 1.10;
	END IF;
END
$$
DELIMITER ;


-- Q6. Stored Procedure (5 Marks)
-- Write a stored procedure:
-- get_customer_orders(p_customer_id INT)
-- It should return:
-- orderNumber
-- orderDate
-- status
-- total_amount (calculated)
-- Sorted by most recent orders first
DELIMITER $$
CREATE PROCEDURE get_customer_orders(In p_customer_id INT) 
BEGIN
	SELECT  
		o.orderNumber,
        o.orderDate,
        o.status,
        SUM(od.quantityOrdered * od.priceEach) AS total_amount
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    WHERE o.customerNumber = p_customer_id
    GROUP BY o.orderNumber, o.orderDate, o.status
    ORDER BY o.orderDate DESC;
END
$$
DELIMITER ;


-- Also show how to call it for:
-- customerNumber = 112

CALL get_customer_orders(112);


-- Q7. Function (5 Marks)
-- Create a deterministic function:
-- fn_total_quantity(p_orderNumber INT)
-- Return total quantity using:
-- SUM(quantityOrdered)

DELIMITER $$

CREATE FUNCTION fn_total_quantity(p_orderNumber INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total_qty INT;
    
    SELECT SUM(quantityOrdered) INTO v_total_qty
    FROM orderdetails
    WHERE orderNumber = p_orderNumber;

    RETURN IFNULL(v_total_qty, 0);
END; 
$$

DELIMITER ; 				

-- Demonstrate usage:
-- SELECT orderNumber, fn_total_quantity(orderNumber)
-- FROM orders;
SELECT 
    orderNumber, 
    fn_total_quantity(orderNumber) AS total_quantity
FROM orders;

-- Q8. CTE + Window Function (5 Marks)
-- Using a CTE + Window Function, rank customers by total payments made.
-- Output:
-- customerNumber
-- customer_name
-- total_payment
-- rank
-- Rank 1 = highest payment
WITH CustomerPayments AS (
    SELECT 
        c.customerNumber,
        c.customerName AS customer_name,
        SUM(paisa.amount) AS total_payment
    FROM customers c
    JOIN payments paisa ON c.customerNumber = paisa.customerNumber
    GROUP BY c.customerNumber, c.customerName
)
SELECT 
    customerNumber,
    customer_name,
    total_payment,
    RANK() OVER (ORDER BY total_payment DESC) AS `rank`
FROM CustomerPayments;

-- Q9. (4 Marks)
-- Write a query to display:
-- orderNumber
-- orderDate
-- customer_name
-- total_products
-- Only include orders having total quantity greater than 100
-- Order result by orderDate.
SELECT 
    o.orderNumber,
    o.orderDate,
    c.customerName AS customer_name,
    SUM(od.quantityOrdered) AS total_products
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.orderDate, c.customerName
HAVING total_products > 100
ORDER BY o.orderDate;



