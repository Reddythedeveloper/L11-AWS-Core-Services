-- Query 1 — Basic Table Exploration
SELECT * FROM "ecommerce_db"."raw_data" 
LIMIT 10;

-- Query 2 — Orders by Product Category
SELECT category, COUNT(*) as total_orders
FROM "ecommerce_db"."raw_data"
GROUP BY category
LIMIT 10;

-- Query 3 — Revenue and Quantity by Fulfilment Method
SELECT "fulfilment", COUNT(*) as total_orders, SUM(qty) as total_units, SUM(amount) as total_revenue
FROM "ecommerce_db"."raw_data"
WHERE "status" NOT IN ('Cancelled', 'Pending')
GROUP BY "fulfilment"
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4 — Monthly Sales Trend
-- Note: Using string extraction for the month based on a MM-DD-YY format.
SELECT SUBSTR("date", 1, 2) AS sales_month, COUNT(*) AS total_orders, SUM(amount) AS total_revenue
FROM "ecommerce_db"."raw_data"
WHERE "status" NOT IN ('Cancelled', 'Pending')
GROUP BY SUBSTR("date", 1, 2)
ORDER BY sales_month ASC
LIMIT 10;

-- Query 5 — Top 5 Best-Selling SKUs per Category
SELECT category, sku, SUM(amount) as total_revenue, SUM(qty) as total_units,
       RANK() OVER (PARTITION BY category ORDER BY SUM(amount) DESC) as rank
FROM "ecommerce_db"."raw_data"
WHERE "status" NOT IN ('Cancelled', 'Pending') AND qty > 0
GROUP BY category, sku
ORDER BY category, rank
LIMIT 10;
