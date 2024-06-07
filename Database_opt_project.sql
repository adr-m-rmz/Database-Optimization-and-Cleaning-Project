--Optimization and data cleaning project

-- Creation of database

CREATE DATABASE SalesDB;
GO
USE SalesDB;
GO

-- Creation of table: clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name NVARCHAR(100),
    mail NVARCHAR(100),
    phone NVARCHAR(20)
);

-- Creation of table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    category NVARCHAR(50),
    price DECIMAL(10, 2)
);

-- Creation of table: sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    client_id INT,
    product_id INT,
    date_sale DATE,
    amount INT,
    total DECIMAL(10, 2),
    FOREIGN KEY(client_id) REFERENCES clients(client_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

--- Data is inserted

--- Note: As this is a fictitious database for demonstration and practice purposes, I manually inserted the data.
--- In a real database, data is typically inserted automatically through point of sale (POS) systems,
--- e-commerce platforms, CRM systems, ETL processes, and APIs.

INSERT INTO clients (client_id, client_name, mail, phone) VALUES
(1, 'Juan Perez', 'juan.perez@mail.com', '555-1234'),
(2, 'Maria Gomez', 'maria.gomez@mail.com', '555-876'),
(3, 'Lola Sandoval', 'lola.sandoval@mail.com', '555-932'),
(4, 'Ernesto Gomez', 'ernesto.gomez@mail.com', '555-877'),
(5, 'Luis Caceres', 'luis.caceres@mail.com', '555-453');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 1000.00),
(102, 'Smartphone', 'Electrónics', 8000.00),
(103, 'Tablet', 'Electrónics', 600.00),
(104, 'Impresora', 'Office', 150.00),
(105, 'Monitor', 'Electrónics', 200.00);

INSERT INTO sales (sale_id, client_id, product_id, date_sale, amount, total) VALUES
(1, 1, 101, '2023-01-10', 1, 1000.00),
(2, 2, 102, '2023-01-15', 2, 1600.00),
(3, 3, 103, '2023-01-20', 1, 600.00),
(4, 4, 101, '2023-02-10', 1, 1000.00),
(5, 5, 104, '2023-02-15', 3, 450.00),
(6, 1, 105, '2023-02-20', 2, 400.00),
(7, 3, 101, '2023-03-05', 1, 1000.00),
(8, 2, 103, '2023-03-10', 1, 600.00),
(9, 4, 104, '2023-03-15', 2, 300.00),
(10, 5, 102, '2023-03-20', 1, 800.00),
(11, 1, 101, '2023-04-01', 1, 1000.00),
(12, 1, 101, '2023-05-01', 2, 1000.00),
(13, 1, 101, '2023-01-10', 1, 1000.00),  
(14, 5, 104, '2023-02-15', 3, 450.00),
(15, 2, 103, '2023-03-10', 1, 600.00),
(16, 5, 102, '2023-03-20', 1, 800.00),
(17, 2, 101, '2023-04-10', 1, 1000.00),
(18, 3, 102, '2023-04-15', 2, 1600.00),
(19, 4, 103, '2023-04-20', 1, 600.00),
(20, 5, 101, '2023-05-10', 1, 1000.00),
(21, 1, 104, '2023-05-15', 3, 450.00),
(22, 2, 105, '2023-05-20', 2, 400.00),
(23, 3, 101, '2023-06-05', 1, 1000.00),
(24, 4, 103, '2023-06-10', 1, 600.00),
(25, 5, 104, '2023-06-15', 2, 300.00),
(26, 1, 102, '2023-06-20', 1, 800.00),
(27, 2, 101, '2023-07-01', 1, 1000.00),
(28, 3, 101, '2023-07-01', 2, 1000.00),
(29, 4, 101, '2023-07-10', 1, 1000.00),  
(30, 5, 104, '2023-07-15', 3, 450.00),
(31, 1, 103, '2023-07-20', 1, 600.00),
(32, 2, 102, '2023-07-25', 1, 800.00),
(33, 3, 101, '2023-08-10', 1, 1000.00),
(34, 4, 102, '2023-08-15', 2, 1600.00),
(35, 5, 103, '2023-08-20', 1, 600.00),
(36, 1, 101, '2023-09-10', 1, 1000.00),
(37, 2, 104, '2023-09-15', 3, 450.00),
(38, 3, 105, '2023-09-20', 2, 400.00),
(39, 4, 101, '2023-10-05', 1, 1000.00),
(40, 5, 103, '2023-10-10', 1, 600.00),
(41, 1, 104, '2023-10-15', 2, 300.00),
(42, 2, 102, '2023-10-20', 1, 800.00),
(43, 3, 101, '2023-11-01', 1, 1000.00),
(44, 4, 101, '2023-11-01', 2, 1000.00),
(45, 5, 101, '2023-11-10', 1, 1000.00),  
(46, 1, 104, '2023-11-15', 3, 450.00),
(47, 2, 103, '2023-11-20', 1, 600.00),
(48, 3, 102, '2023-11-25', 1, 800.00),
(49, 4, 101, '2023-12-10', 1, 1000.00),
(50, 5, 102, '2023-12-15', 2, 1600.00);

--- Referential Integrity Constraints

ALTER TABLE sales
ADD CONSTRAINT fk_client_id
FOREIGN KEY (client_id)
REFERENCES clients(client_id)
ON DELETE CASCADE;

ALTER TABLE sales
ADD CONSTRAINT fk_product_id
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE CASCADE;

-- These constraints ensure data consistency by guaranteeing that when records are deleted in the clients and products tables,
-- the corresponding records in the sales table are also automatically deleted.

--- --- --- Query optimization

-- Creation of an index on the product_id column of the sales table

CREATE INDEX idx_product_id ON sales(product_id);

-- Creating an index on the product_id column of the sales table allows queries that filter, group, or join data by this field to execute more efficiently.
-- Assuming that product_id is one of the most queried columns in the sales table, it was chosen for the creation of the index.
-- Although in a table with only 50 records the performance benefit may be minimal, the cost of creating and maintaining the index is low.
-- In the scenario where the table grows in the future, the index ensures that queries remain efficient as the number of records increases.

--- Search and delete of duplicates

-- Searching for duplicates in the clients table

SELECT client_name, mail, COUNT(*)
FROM clients
GROUP BY client_name, mail
HAVING COUNT(*) > 1;

--- Searching for duplicates in the products table
SELECT product_name, category, price, COUNT(*)
FROM products
GROUP BY product_name, category, price
HAVING COUNT(*) > 1;

--- Search for duplicates in the sales table
SELECT client_id, product_id, date_sale, amount, total, COUNT(*) AS duplicados
FROM sales
GROUP BY client_id, product_id, date_sale, amount, total
HAVING COUNT(*) > 1;

--- Delete of duplicates on sales table

WITH Duplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY client_id, product_id, date_sale, amount, total ORDER BY sale_id) AS rn
    FROM sales
)
DELETE FROM Duplicates
WHERE rn > 1;

--- A Common Table Expression (CTE) is used to select all rows and assign a row number to each group of duplicates
--- based on the columns client_id, product_id, date_sale, amount, and total.
--- All rows with a row number greater than 1 in each group are deleted, keeping only the first occurrence of each group of duplicates.

--- NOTE:
--- The database, tables, and data are examples and do not represent an actual database.
