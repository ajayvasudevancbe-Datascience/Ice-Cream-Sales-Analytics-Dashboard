-- ============================================================
-- 🍦 ICE CREAM SALES ANALYSIS PROJECT
-- Database: MySQL
-- ============================================================


-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

CREATE DATABASE IF NOT EXISTS ice_cream_sales;

USE ice_cream_sales;


-- ============================================================
-- 2. CREATE TABLE
-- ============================================================

DROP TABLE IF EXISTS ice_cream_sales_data;

CREATE TABLE ice_cream_sales_data (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    flavor VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    store_location VARCHAR(100),
    payment_method VARCHAR(50)
);


-- ============================================================
-- 3. INSERT DATA
-- ============================================================

INSERT INTO ice_cream_sales_data
(sale_id, sale_date, product_name, category, flavor,
 quantity, unit_price, total_amount, store_location, payment_method)
VALUES

(1, '2026-01-05', 'Vanilla Cup', 'Cup', 'Vanilla',
 10, 50.00, 500.00, 'Madurai', 'UPI'),

(2, '2026-01-06', 'Chocolate Cone', 'Cone', 'Chocolate',
 8, 60.00, 480.00, 'Chennai', 'Cash'),

(3, '2026-01-07', 'Strawberry Cup', 'Cup', 'Strawberry',
 12, 55.00, 660.00, 'Coimbatore', 'Card'),

(4, '2026-01-08', 'Mango Bar', 'Bar', 'Mango',
 15, 40.00, 600.00, 'Madurai', 'UPI'),

(5, '2026-01-10', 'Butterscotch Cone', 'Cone', 'Butterscotch',
 9, 65.00, 585.00, 'Chennai', 'UPI'),

(6, '2026-01-12', 'Vanilla Cup', 'Cup', 'Vanilla',
 14, 50.00, 700.00, 'Coimbatore', 'Cash'),

(7, '2026-01-15', 'Chocolate Bar', 'Bar', 'Chocolate',
 11, 45.00, 495.00, 'Madurai', 'Card'),

(8, '2026-01-18', 'Strawberry Cone', 'Cone', 'Strawberry',
 13, 60.00, 780.00, 'Chennai', 'UPI'),

(9, '2026-01-20', 'Mango Cup', 'Cup', 'Mango',
 16, 55.00, 880.00, 'Coimbatore', 'Card'),

(10, '2026-01-22', 'Chocolate Cone', 'Cone', 'Chocolate',
 10, 60.00, 600.00, 'Madurai', 'Cash'),

(11, '2026-02-02', 'Vanilla Cup', 'Cup', 'Vanilla',
 18, 50.00, 900.00, 'Chennai', 'UPI'),

(12, '2026-02-05', 'Mango Bar', 'Bar', 'Mango',
 20, 40.00, 800.00, 'Coimbatore', 'Card'),

(13, '2026-02-08', 'Chocolate Cup', 'Cup', 'Chocolate',
 15, 55.00, 825.00, 'Madurai', 'UPI'),

(14, '2026-02-12', 'Strawberry Cone', 'Cone', 'Strawberry',
 17, 60.00, 1020.00, 'Chennai', 'Card'),

(15, '2026-02-15', 'Butterscotch Cup', 'Cup', 'Butterscotch',
 12, 55.00, 660.00, 'Coimbatore', 'Cash'),

(16, '2026-02-18', 'Mango Cup', 'Cup', 'Mango',
 19, 55.00, 1045.00, 'Madurai', 'UPI'),

(17, '2026-02-20', 'Chocolate Bar', 'Bar', 'Chocolate',
 14, 45.00, 630.00, 'Chennai', 'Card'),

(18, '2026-02-22', 'Vanilla Cone', 'Cone', 'Vanilla',
 16, 60.00, 960.00, 'Coimbatore', 'UPI'),

(19, '2026-02-25', 'Strawberry Cup', 'Cup', 'Strawberry',
 20, 55.00, 1100.00, 'Madurai', 'Cash'),

(20, '2026-02-28', 'Mango Bar', 'Bar', 'Mango',
 18, 40.00, 720.00, 'Chennai', 'UPI');


-- ============================================================
-- 4. VIEW ALL DATA
-- ============================================================

SELECT *
FROM ice_cream_sales_data;


-- ============================================================
-- 5. BASIC SALES ANALYSIS
-- ============================================================

-- Total Revenue

SELECT
    SUM(total_amount) AS total_revenue
FROM ice_cream_sales_data;


-- Total Quantity Sold

SELECT
    SUM(quantity) AS total_quantity_sold
FROM ice_cream_sales_data;


-- Total Transactions

SELECT
    COUNT(*) AS total_transactions
FROM ice_cream_sales_data;


-- Average Transaction Value

SELECT
    ROUND(AVG(total_amount), 2) AS average_transaction_value
FROM ice_cream_sales_data;


-- ============================================================
-- 6. PRODUCT ANALYSIS
-- ============================================================

-- Sales by Product

SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY product_name
ORDER BY total_sales DESC;


-- Top-Selling Product

SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 7. FLAVOR ANALYSIS
-- ============================================================

SELECT
    flavor,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY flavor
ORDER BY total_sales DESC;


-- Best Performing Flavor

SELECT
    flavor,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY flavor
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 8. CATEGORY ANALYSIS
-- ============================================================

SELECT
    category,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY category
ORDER BY total_sales DESC;


-- ============================================================
-- 9. STORE ANALYSIS
-- ============================================================

SELECT
    store_location,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY store_location
ORDER BY total_sales DESC;


-- Best Performing Store

SELECT
    store_location,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY store_location
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 10. PAYMENT METHOD ANALYSIS
-- ============================================================

SELECT
    payment_method,
    COUNT(*) AS transactions,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY payment_method
ORDER BY total_sales DESC;


-- ============================================================
-- 11. MONTHLY SALES
-- ============================================================

SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
    SUM(total_amount) AS monthly_sales
FROM ice_cream_sales_data
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY sales_month;


-- ============================================================
-- 12. DAILY SALES
-- ============================================================

SELECT
    sale_date,
    SUM(total_amount) AS daily_sales
FROM ice_cream_sales_data
GROUP BY sale_date
ORDER BY sale_date;


-- ============================================================
-- 13. HIGHEST SALES DAY
-- ============================================================

SELECT
    sale_date,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 14. MONTHLY CATEGORY PERFORMANCE
-- ============================================================

SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
    category,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY
    DATE_FORMAT(sale_date, '%Y-%m'),
    category
ORDER BY
    sales_month,
    total_sales DESC;


-- ============================================================
-- 15. SALES CLASSIFICATION USING CASE
-- ============================================================

SELECT
    product_name,
    total_amount,
    CASE
        WHEN total_amount >= 800 THEN 'High Sales'
        WHEN total_amount >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM ice_cream_sales_data;


-- ============================================================
-- 16. PRODUCT RANKING USING WINDOW FUNCTION
-- ============================================================

SELECT
    product_name,
    SUM(total_amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(total_amount) DESC
    ) AS sales_rank
FROM ice_cream_sales_data
GROUP BY product_name;


-- ============================================================
-- 17. RUNNING TOTAL SALES
-- ============================================================

SELECT
    sale_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY sale_date, sale_id
    ) AS running_total
FROM ice_cream_sales_data
ORDER BY sale_date, sale_id;


-- ============================================================
-- 18. TOP 5 PRODUCTS
-- ============================================================

SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- 19. STORE + FLAVOR ANALYSIS
-- ============================================================

SELECT
    store_location,
    flavor,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_sales
FROM ice_cream_sales_data
GROUP BY
    store_location,
    flavor
ORDER BY total_sales DESC;


-- ============================================================
-- 20. PRODUCT PROFITABILITY VIEW
-- ============================================================

SELECT
    product_name,
    category,
    SUM(quantity) AS quantity_sold,
    SUM(total_amount) AS revenue,
    ROUND(AVG(unit_price), 2) AS average_price
FROM ice_cream_sales_data
GROUP BY
    product_name,
    category
ORDER BY revenue DESC;


-- ============================================================
-- 21. FINAL BUSINESS SUMMARY
-- ============================================================

SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_transaction_value,
    MIN(total_amount) AS minimum_transaction,
    MAX(total_amount) AS maximum_transaction
FROM ice_cream_sales_data;


-- ============================================================
-- END OF PROJECT
-- ============================================================