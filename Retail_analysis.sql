
-- =========================================================
-- Project: Retail Order Analytics Pipeline
-- Purpose: Retail data analysis using SQL and SQLite
-- =========================================================


-- 1. Dataset Overview
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT product_id) AS unique_products
FROM retail_orders_sqlcleaned;


-- 2. Category Performance
SELECT
    category,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY category
ORDER BY total_list_value DESC;


-- 3. Subcategory Performance
SELECT
    category,
    sub_category,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY category, sub_category
ORDER BY total_list_value DESC;


-- 4. Regional Performance
SELECT
    region,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY region
ORDER BY total_list_value DESC;


-- 5. Monthly Order Trends
SELECT
    SUBSTR(order_date, 1, 7) AS order_month,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY SUBSTR(order_date, 1, 7)
ORDER BY order_month;


-- 6. Customer Segment Performance
SELECT
    segment,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY segment
ORDER BY total_list_value DESC;


-- 7. Shipping Method Analysis
SELECT
    ship_mode,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY ship_mode
ORDER BY order_records DESC;


-- 8. Discount Value Analysis
SELECT
    discount_percent,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY discount_percent
ORDER BY discount_percent;


-- 9. Overall Price and Cost Summary
SELECT
    ROUND(SUM(list_price * quantity), 2) AS total_list_value,
    ROUND(SUM(cost_price * quantity), 2) AS total_cost_value,
    SUM(
        CASE
            WHEN list_price = 0 AND cost_price = 0 THEN 1
            ELSE 0
        END
    ) AS zero_price_records
FROM retail_orders_sqlcleaned;


-- 10. Top 10 Products by List Value
SELECT
    product_id,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY product_id
ORDER BY total_list_value DESC
LIMIT 10;


-- 11. Top 10 States by List Value
SELECT
    state,
    COUNT(*) AS order_records,
    SUM(quantity) AS units_sold,
    ROUND(SUM(list_price * quantity), 2) AS total_list_value
FROM retail_orders_sqlcleaned
GROUP BY state
ORDER BY total_list_value DESC
LIMIT 10;
