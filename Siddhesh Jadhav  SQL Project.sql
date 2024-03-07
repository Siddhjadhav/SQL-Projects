create database online_store_inventory;
use online_store_inventory;

/*-----------------------------------------------> DDL <--------------------------------------------------------*/

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL);
    
    -- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL);
    
    -- Create the OrderItems table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Create a new table called "Customers" with columns for customer information (e.g., customer_id, name, email, address).
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255)
);
desc Customers;
--  add a new column "description" of type TEXT to the "Products" table?
ALTER TABLE Products
ADD description TEXT;

-- increase the maximum length of the "product_name" column in the "Products" table to 100 characters. How would you do this?
ALTER TABLE Products
MODIFY COLUMN product_name VARCHAR(100) NOT NULL;

-- You want to remove the "email" column from the "Customers" table. How can you achieve this?
ALTER TABLE Customers
DROP COLUMN email;

--  How do you add a foreign key constraint on the "product_id" column in the "OrderItems" table to reference the "Products" table?
ALTER TABLE OrderItems
ADD CONSTRAINT fk_orderitem_product
FOREIGN KEY (product_id) REFERENCES Products(product_id);

-- You want to set the "order_date" column in the "Orders" table as NOT NULL. How can you do that?
ALTER TABLE Orders
MODIFY COLUMN order_date DATE NOT NULL;

-- You want to change the name of the "Customers" table to "Clients." How can you rename the table?
ALTER TABLE Customers
RENAME TO Clients;

ALTER TABLE Customers
add COLUMN email varchar(255) unique;
alter table products drop column description;

desc  OrderItems;

/*----------------------------------------------------> DML <---------------------------------------------------*/
INSERT INTO Products (product_id, product_name, price, stock_quantity)
VALUES
    (1, 'Laptop', 800.00, 10),
    (2, 'Smartphone', 400.00, 20),
    (3, 'Tablet', 250.00, 15),
    (4, 'Headphones', 50.00, 30),
    (5, 'Keyboard', 20.00, 50),
    (6, 'Mouse', 15.00, 60),
    (7, 'Monitor', 150.00, 12),
    (8, 'Printer', 120.00, 8),
    (9, 'External Hard Drive', 100.00, 25),
    (10, 'Webcam', 30.00, 18),
    (11, 'Desk Chair', 150.00, 5),
    (12, 'Desk', 80.00, 10),
    (13, 'Desk Lamp', 25.00, 30),
    (14, 'Bookshelf', 70.00, 7),
    (15, 'Coffee Maker', 40.00, 15),
    (16, 'Toaster', 20.00, 25),
    (17, 'Blender', 60.00, 12),
    (18, 'Vacuum Cleaner', 90.00, 9),
    (19, 'Microwave', 70.00, 10),
    (20, 'Television', 500.00, 6);
    
    
    INSERT INTO Orders (order_id, order_date)
VALUES
    (1, '2023-01-15'),
    (2, '2023-02-20'),
    (3, '2023-03-10'),
    (4, '2023-03-15'),
    (5, '2023-04-05'),
    (6, '2023-04-12'),
    (7, '2023-05-02'),
    (8, '2023-06-08'),
    (9, '2023-06-18'),
    (10, '2023-07-03'),
    (11, '2023-08-11'),
    (12, '2023-08-25'),
    (13, '2023-09-05'),
    (14, '2023-09-15'),
    (15, '2023-10-10'),
    (16, '2023-11-20'),
    (17, '2023-12-05'),
    (18, '2023-12-18'),
    (19, '2024-01-03'),
    (20, '2024-02-14');
    
    select* from orders;
    
     INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 3),
    (3, 2, 1, 1),
    (4, 2, 3, 2),
    (5, 3, 4, 4),
    (6, 3, 5, 1),
    (7, 4, 2, 2),
    (8, 4, 6, 3),
    (9, 5, 3, 1),
    (10, 5, 7, 2),
    (11, 6, 4, 1),
    (12, 6, 9, 1),
    (13, 7, 5, 3),
    (14, 7, 10, 2),
    (15, 8, 6, 1),
    (16, 8, 8, 1),
    (17, 9, 1, 2),
    (18, 9, 2, 1),
    (19, 10, 3, 1),
    (20, 10, 5, 2);


INSERT INTO Customers (customer_id, name, email, address)
VALUES
    (1, 'John Doe', 'johndoe@example.com', '123 Main St, Cityville, USA'),
    (2, 'Alice Smith', 'alice@example.com', '456 Elm St, Townsville, USA'),
    (3, 'Bob Johnson', 'bob@example.com', '789 Oak St, Villageton, USA'),
    (4, 'Emily Brown', 'emily@example.com', '101 Pine St, Hamletville, USA'),
    (5, 'Michael Davis', 'michael@example.com', '222 Cedar St, Suburbia, USA'),
    (6, 'Sarah Wilson', 'sarah@example.com', '333 Birch St, Countryside, USA'),
    (7, 'David Lee', 'david@example.com', '444 Spruce St, Metropolis, USA'),
    (8, 'Laura Jones', 'laura@example.com', '555 Redwood St, Capital City, USA'),
    (9, 'William White', 'william@example.com', '666 Sequoia St, Lakeside, USA'),
    (10, 'Olivia Taylor', 'olivia@example.com', '777 Hemlock St, Riverside, USA'),
    (11, 'James Harris', 'james@example.com', '888 Willow St, Beachtown, USA'),
    (12, 'Sophia Clark', 'sophia@example.com', '999 Aspen St, Mountainview, USA'),
    (13, 'Daniel Adams', 'daniel@example.com', '111 Pine St, Hillside, USA'),
    (14, 'Chloe Hall', 'chloe@example.com', '222 Oak St, Riverside, USA'),
    (15, 'Joseph Turner', 'joseph@example.com', '333 Birch St, Countryside, USA'),
    (16, 'Grace Baker', 'grace@example.com', '444 Cedar St, Lakeside, USA'),
    (17, 'Matthew Mitchell', 'matthew@example.com', '555 Elm St, Cityville, USA'),
    (18, 'Ava Martin', 'ava@example.com', '666 Maple St, Villageton, USA'),
    (19, 'Ethan Walker', 'ethan@example.com', '777 Birch St, Townsville, USA'),
    (20, 'Emma Wilson', 'emma@example.com', '888 Oak St, Villageton, USA');
    
    select * from customers;
    
    /*---------------------------------------------------> Update <--------------------------------------------------------*/
    
    -- Update the price of the product with product_id 3 (Table: Products).
UPDATE Products
SET price = 270.00
WHERE product_id = 3;

-- Increase the stock quantity of the product with product_id 2 by 5 (Table: Products).
UPDATE Products
SET stock_quantity = stock_quantity + 5
WHERE product_id = 2;


-- Change the order date of order with order_id 4 to '2023-03-20' (Table: Orders).
UPDATE Orders
SET order_date = '2023-03-20'
WHERE order_id = 4;

-- Increase the quantity of the first order item (order_item_id 1) in order 1 to 3 (Table: OrderItems).

UPDATE OrderItems
SET quantity = 3
WHERE order_item_id = 1;

-- Change the email of the customer with customer_id 5 to 'newemail@example.com' (Table: Customers).

UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 5;

-- Decrease the stock quantity of the product with product_id 7 by 2 (Table: Products).
UPDATE Products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 7;


-- Update the address of the customer with customer_id 10 to '123 Updated St, Newville, USA' (Table: Customers).
UPDATE Customers
SET address = '123 Updated St, Newville, USA'
WHERE customer_id = 10;



-- Change the name of the product with product_id 12 to 'Office Desk' (Table: Products).

UPDATE Products
SET product_name = 'Office Desk'
WHERE product_id = 12;


-- Change the product for the third order item (order_item_id 3) in order 2 to product_id 8 (Table: OrderItems).
UPDATE OrderItems
SET product_id = 8
WHERE order_item_id = 3;


/*-----------------------------------------------> Where clause <-------------------------------------------------------*/

-- : Retrieve all products from the "Products" table with a price greater than $100.
SELECT *
FROM Products
WHERE price > 100;

-- Find all orders from the "Orders" table that were placed on or after '2023-06-01'.
SELECT *
FROM Orders
WHERE order_date >= '2023-06-01';


-- Retrieve all order items from the "OrderItems" table where the quantity is less than 3.
SELECT *
FROM OrderItems
WHERE quantity < 3;


-- Find all customers from the "Customers" table whose email address contains 'example.com'.
SELECT *
FROM Customers
WHERE email LIKE '%example.com%';

-- Retrieve products from the "Products" table with a stock quantity less than 10 and a price greater than $50.
SELECT *
FROM Products
WHERE stock_quantity < 10 AND price > 50.00;

/*--------------------------------------------------- Operators------------------------------------------------*/
--  Retrieve all products from the "Products" table with a price greater than or equal to $200.
SELECT *
FROM Products
WHERE price >= 200.00;


--  Find all customers from the "Customers" table who either have an address in the USA or an email ending with '@example.com'.

SELECT *
FROM Customers
WHERE address LIKE '%USA%' OR email LIKE '%@example.com';

-- Find all products from the "Products" table that are not in stock (stock quantity is zero).

SELECT *
FROM Products
WHERE stock_quantity = 0;


-- Calculate the total price of products (price multiplied by quantity) for all order items in the "Products" table.

SELECT product_id, price * stock_quantity AS total_price
FROM Products;

-- Retrieve all products from the "Products" table with a price between $50 and $100.

SELECT *
FROM Products
WHERE price >= 50.00 AND price <= 100.00;

-- Find all orders from the "Orders" table placed after '2023-06-15'.

SELECT *
FROM Orders
WHERE order_date > '2023-06-15';


--  Retrieve all products from the "Products" table that are not priced at $150.
SELECT *
FROM Products
WHERE price != 150.00;

-- Find all customers from the "Customers" table who have either an address in 'Cityville' or an email ending with '@example.com'.
SELECT *
FROM Customers
WHERE address LIKE '%Cityville%' OR email LIKE '%@example.com';

--  Calculate the average price of all products in the "Products" table.
SELECT AVG(price) AS average_price
FROM Products;


/* -------------------------------------> Order by/Distinct/Limit <-------------------------------------------------------------*/
-- Retrieve all products from the "Products" table and order them by price in descending order.
SELECT *
FROM Products
ORDER BY price DESC;

-- Get a list of customers from the "Customers" table ordered by their names in ascending order.
SELECT DISTINCT name
FROM Customers
ORDER BY name ASC;

-- Retrieve products from the "Products" table ordered by product_name in ascending order and then by price in descending order within each category
SELECT *
FROM Products
ORDER BY product_name ASC, price DESC;

-- Retrieve the top 5 orders with the highest total price from the "products" table
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- Retrieve orders from the "Orders" table, skipping the first 3 orders and returning the next 5.
SELECT *
FROM Orders
ORDER BY order_id
LIMIT 5 OFFSET 3;


--  Find the number of distinct customers who have placed orders from the "Orders" table.
SELECT COUNT(DISTINCT customer_id) AS distinct_customers
FROM customers;



/*-------------------------------------> Built in Function <-------------------------------------------------------*/
--  Find the length of the "product_name" for each product in the "Products" table.
SELECT product_name, LENGTH(product_name) AS name_length
FROM Products;


-- Create a full name by concatenating the "name" and "address" columns from the "Customers" table.
SELECT CONCAT(name, '    ', address) AS cust_detail
FROM Customers;

-- Retrieve all customer email addresses from the "Customers" table in uppercase.
SELECT UPPER(email) AS uppercase_email
FROM Customers;


-- Get a list of product product_name from the "Products" table in lowercase.
SELECT LOWER(product_name) AS lowercase_name
FROM Products;

-- Extract the first 3 characters from the "product_name" column for all products in the "Products" table.
SELECT product_name, SUBSTRING(product_name, 1, 3) AS first_three_chars
FROM Products;

-- Retrieve the order date from the "Orders" table in the 'MM/DD/YYYY' format.
SELECT DATE_FORMAT(order_date, '%m/%d/%Y') AS formatted_date
FROM Orders;

-- Calculate the total price of each order in the "Product" table by summing the prices of order items.

SELECT product_id, SUM(price * stock_quantity) AS total_price
FROM products
GROUP BY product_id;

-- Find the average price of products in the "Products" table.
SELECT AVG(price) AS average_price
FROM Products;


-- : Calculate the number of days between the order date and the current date for each order in the "Orders" table.
SELECT order_id, DATEDIFF(NOW(), order_date) AS days_since_order
FROM Orders;


/*----------------------------------------------> Group by with having <-------------------------------------------------------*/
desc orders;
desc orderitems;
desc products;

-- Find customers who have placed orders totaling more than $1,000 and list the total purchase amount for each customer.
SELECT c.customer_id, c.name, SUM(p.price * oi.quantity) AS total_purchase
FROM Customers c, OrderItems oi, Products p
WHERE c.customer_id = oi.order_id
  AND oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING total_purchase > 1000;

--  List the order dates with total sales exceeding $500 and the total sales amount for each date.
SELECT o.order_date, SUM(p.price * oi.quantity) AS total_sales
FROM Orders o, OrderItems oi, Products p
WHERE o.order_id = oi.order_id
  AND oi.product_id = p.product_id
GROUP BY o.order_date
HAVING total_sales > 500;


-- Identify products that have been ordered more than 10 times, and list the product name and the total quantity ordered.
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_ordered_quantity
FROM Products p, OrderItems oi
WHERE p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING total_ordered_quantity > 10;


--  Find customers who have placed at least 3 orders and list the customer name along with the number of orders placed.

SELECT c.name, COUNT(o.order_id) AS total_orders_placed
FROM Customers c, Orders o
WHERE c.customer_id = o.order_id
GROUP BY c.name
HAVING total_orders_placed >= 3;

-- Identify product prices greater than $200 and list the product name and price.
SELECT p.product_id, p.product_name, p.price
FROM Products p
WHERE p.price > 200;



/*----------------------------------------------> Joins <-----------------------------------------------------*/
--  List all products and their corresponding order quantities, even if they haven't been ordered yet.
SELECT p.product_id, p.product_name, COALESCE(SUM(oi.quantity), 0) AS total_ordered_quantity
FROM Products p
LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Retrieve a list of products that have been ordered and products that haven't been ordered yet.


SELECT p.product_id, p.product_name, COALESCE(SUM(oi.quantity), 0) AS total_ordered_quantity
FROM Products p
JOIN OrderItems oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


/*---------------------------------------------------> Subquery <---------------------------------------------------------------*/
-- Find the product names that have been ordered and their respective prices.
SELECT product_name, price
FROM Products
WHERE product_id IN (SELECT DISTINCT product_id FROM OrderItems);


-- Identify products that have not been ordered.
SELECT product_name
FROM Products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM OrderItems);


/*-------------------------------------------------------The End-----------------------------------------------------------------*/







