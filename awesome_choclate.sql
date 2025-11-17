
-- ============================
-- PART A: SELECT, WHERE, ORDER BY, GROUP BY
-- ============================

-- 1. Top 5 products by total sales
SELECT p.Product, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
ORDER BY TotalSales DESC
LIMIT 5;

-- ============================
-- PART B: JOINS (INNER, LEFT, RIGHT)
-- ============================

-- 2. INNER JOIN: Salesperson and Geo info
SELECT pe.Salesperson, g.Geo, s.Amount
FROM sales s
INNER JOIN people pe ON s.SPID = pe.SPID
INNER JOIN geo g ON s.GeoID = g.GeoID;

-- 3. LEFT JOIN: Include all sales, even without known salesperson
SELECT s.*, pe.Salesperson
FROM sales s
LEFT JOIN people pe ON s.SPID = pe.SPID;

-- 4. RIGHT JOIN: Include all people, even if they didn’t make a sale
SELECT pe.Salesperson, s.Amount
FROM sales s
RIGHT JOIN people pe ON s.SPID = pe.SPID;

-- ============================
-- PART C: SUBQUERY
-- ============================

-- 5. Products with sales above average
SELECT p.Product, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
HAVING TotalSales > (
    SELECT AVG(Amount) FROM sales
);

-- ============================
-- PART D: AGGREGATE FUNCTIONS
-- ============================

-- 6. Average boxes sold by region
SELECT g.Region, AVG(s.Boxes) AS AvgBoxes
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region;

-- 7. Total amount and total customers by product category
SELECT pr.Category, SUM(s.Amount) AS TotalAmount, SUM(s.Customers) AS TotalCustomers
FROM sales s
JOIN products pr ON s.PID = pr.PID
GROUP BY pr.Category;

-- ============================
-- PART E: CREATE VIEW
-- ============================

-- 8. View: Product sales by region
CREATE OR REPLACE VIEW ProductSalesByRegion AS
SELECT p.Product, g.Region, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN products p ON s.PID = p.PID
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY p.Product, g.Region;

-- ============================
-- PART F: OPTIMIZATION (INDEXES)
-- ============================

-- 9. Add indexes for performance
CREATE INDEX idx_sales_spid ON sales(SPID);
CREATE INDEX idx_sales_geoid ON sales(GeoID);
CREATE INDEX idx_sales_pid ON sales(PID);
CREATE INDEX idx_sales_saledate ON sales(SaleDate);
