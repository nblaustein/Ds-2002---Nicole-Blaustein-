-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table?
-- ------------------------------------------------------------------
SELECT COUNT(*) from products;
-- there are 45 rows in the products table 
-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------
SELECT product_name, quantity_per_unit FROM products;

-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------
SELECT id, product_name as 'Name' FROM products WHERE discontinued = 0;

-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT id, product_name as 'Name' FROM products WHERE discontinued = 1;

-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------
SELECT product_name, list_price
FROM products
where list_price=(select max(list_price) from Products) or 
list_price=(select min(list_price) from Products)
order by list_price DESC;
-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
-- ------------------------------------------------------------------
SELECT id, product_name, list_price
FROM products
WHERE list_price<20;
-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------
SELECT id, product_name, list_price
FROM products
WHERE list_price BETWEEN 15 AND 20;
-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG (list_price) FROM products);
-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products 
-- ------------------------------------------------------------------
SELECT product_name, list_price 
FROM products 
ORDER BY list_price DESC
LIMIT 10;
-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
SELECT COUNT(*)
FROM products
WHERE discontinued = '0';
-- There are 44 current products
SELECT COUNT(*)
FROM products
WHERE discontinued = '1';
-- There is 1 discontinued product 
-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------
SELECT product_name, target_level, reorder_level
FROM products
WHERE reorder_level < target_level; 
-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------
SELECT *
FROM products
INNER JOIN suppliers ON products.id=suppliers.id;
-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------
SELECT category, COUNT(*) AS product_count
FROM products
WHERE quantity_per_unit < 5
GROUP BY category;
-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00
-- ------------------------------------------------------------------
SELECT category, COUNT(*) AS product_count
FROM products
WHERE list_price < 20
GROUP BY category;
