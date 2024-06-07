# Database optimization and cleaning
Database optmization and cleaning in Microsoft SQL Server Management Studio

### Data Schema

clients:

#### client_id (INT): Unique identifier of the client.
#### client_name (NVARCHAR(100)): Name of the client.
#### mail (NVARCHAR(100)): Email of the client.
#### phone (NVARCHAR(20)): Phone number of the client.

products:

#### producto_id (INT): Unique identifier of the product.
#### product_name (NVARCHAR(100)): Name of the product.
#### category (NVARCHAR(50)): Category of the product.
#### price (DECIMAL(10, 2)): Price of the product.

sales:

#### sale_id (INT): Unique identifier of the sale.
#### client_id (INT): Foreign key referencing the client.
#### product_id (INT): Foreign key referencing the product.
#### date_sale (DATE): Date of the sale.
#### amount (INT): Quantity of products sold.
#### total (DECIMAL(10, 2)): Total of the sale.

### Business Logic

Sales are associated with customers and products through foreign keys in the sales table.

Each sale records the sale date, the quantity of products sold, and the total sale amount.

Customers and products have basic information such as name, email, category, etc.

The relationships between the tables are designed to maintain referential integrity and ensure data consistency.

### Cleaning and Optimization Processes

#### Removing duplicates in the sales table:

An SQL query is used to search for duplicates in the sales table based on various criteria such as customer_id, product_id, sale_date, etc.

Duplicates are automatically removed using the DELETE clause and a subquery to identify the duplicate records.

#### Index to improve performance:

An index is created on the product_id column in the sales table to improve query performance.

The reason for creating the index is documented.

NOTE: The database, tables, and data are examples and do not represent an actual database.
