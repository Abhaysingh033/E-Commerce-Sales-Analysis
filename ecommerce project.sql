# 1. DATABASE SELECTION
-- Select database
use ecommerce_sales_db;
-- check total rows in table
SELECT COUNT(*) AS total_rows
FROM ecommerce_sales_data;
-- preview first 5 rows
SELECT *
FROM ecommerce_sales_data
LIMIT 5;
# 2. COLUMN CLEANING & RENAMING
-- Renaming incorrect column name
ALTER TABLE ecommerce_sales_data
RENAME COLUMN `ï»¿order_date` TO order_date;
# DATE VALIDATION
SELECT order_date
FROM ecommerce_sales_data
WHERE STR_TO_DATE(order_date, '%Y-%m-%d') IS NULL
  AND order_date IS NOT NULL;
# DATA TYPE MODIFICATION
-- Convert order_date from TEXT to DATE
ALTER TABLE ecommerce_sales_data
MODIFY COLUMN order_date DATE;
-- Check table structure
DESCRIBE ecommerce_sales_data;
-- Check total rows
SELECT COUNT(*) FROM ecommerce_sales_data;
#OVERALL PERFORMANCE
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM ecommerce_sales_data;
#MONTHLY SALES TREND
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS 'year_month',
    SUM(sales) AS monthly_sales
FROM ecommerce_sales_data
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY DATE_FORMAT(order_date, '%Y-%m');
#PRODUCT ANALYSIS
-- Top 10 product
SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
-- Category wise performance
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY category
ORDER BY total_sales DESC;
-- Region wise sales
SELECT 
    region,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
GROUP BY region
ORDER BY total_sales DESC;
#PROFITABILITY ANALYSIS
SELECT 
    category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_2
FROM ecommerce_sales_data
GROUP BY category
ORDER BY profit_margin_2 DESC;














































