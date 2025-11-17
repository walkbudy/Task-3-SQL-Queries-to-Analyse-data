🍫 Awesome Chocolates SQL Data Analysis
📋 Task Overview
This project is part of Task 4 - SQL for Data Analysis in the Data Analyst Internship Program. The goal is to practice SQL skills by querying and analyzing structured data from the awesome chocolates MySQL database.

🧰 Tools Used
Database: MySQL 8.0

Language: SQL

Editor: MySQL Workbench / VS Code with SQL extension

Dataset: awesome-chocolates-data.sql

📁 Dataset Overview
The dataset includes the following tables:

geo: Contains geographic data of regions.

people: Salesperson and team information.

products: Chocolate product details.

sales: Detailed sales transactions across regions and time.

🔍 Key Concepts Applied
Basic SQL Queries: SELECT, WHERE, ORDER BY, GROUP BY

Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN

Aggregate Functions: SUM(), AVG(), COUNT()

Subqueries and Nested SELECTs

Views creation for analysis

Query optimization strategies

🧪 Sample Queries Executed
Total Sales by Region

sql
Copy
Edit
SELECT g.Region, SUM(s.Amount) AS TotalSales
FROM sales s
JOIN geo g ON s.GeoID = g.GeoID
GROUP BY g.Region;
Top 5 Selling Products

sql
Copy
Edit
SELECT p.Product, SUM(s.Boxes) AS TotalBoxes
FROM sales s
JOIN products p ON s.PID = p.PID
GROUP BY p.Product
ORDER BY TotalBoxes DESC
LIMIT 5;
Average Revenue per Customer per Salesperson

sql
Copy
Edit
SELECT sp.Salesperson, AVG(s.Amount / s.Customers) AS AvgRevenuePerCustomer
FROM sales s
JOIN people sp ON s.SPID = sp.SPID
GROUP BY sp.Salesperson;
Create a View: High-Volume Sales

sql
Copy
Edit
CREATE VIEW HighVolumeSales AS
SELECT * FROM sales
WHERE Boxes > 500;
📸 Screenshots
Screenshots of output for each query have been added in the repository.

📦 Deliverables
awesome-chocolates-data.sql: Dataset used

queries.sql: All executed queries

screenshots/: Output screenshots for each query

README.md: This documentation
