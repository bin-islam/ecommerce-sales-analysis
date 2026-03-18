-- ============================================
-- E-Commerce Sales Analysis -- SQL Queries
-- Dataset: UK Online Retail 2010-2011
-- ============================================


-- Query 1: Monthly Revenue Trend
SELECT 
    strftime('%Y-%m', InvoiceDate) AS Month,
    ROUND(SUM(Revenue), 2)         AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo)      AS Total_Orders
FROM transactions
GROUP BY Month
ORDER BY Month;


-- Query 2: Top 10 Products by Revenue
SELECT 
    Description,
    ROUND(SUM(Revenue), 2)    AS Total_Revenue,
    SUM(Quantity)             AS Total_Units_Sold,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM transactions
WHERE Description NOT IN ('POSTAGE', 'Manual', 'AMAZONFEE', 'Bank Charges', 'CRUK Commission')
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;


-- Query 3: Revenue by Country
SELECT 
    Country,
    ROUND(SUM(Revenue), 2)     AS Total_Revenue,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    COUNT(DISTINCT InvoiceNo)  AS Total_Orders
FROM transactions
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;


-- Query 4: RFM Summary
WITH rfm_base AS (
    SELECT
        CustomerID,
        ROUND(julianday('2011-12-10') - julianday(MAX(InvoiceDate)), 0) AS Recency,
        COUNT(DISTINCT InvoiceNo)                                        AS Frequency,
        ROUND(SUM(Revenue), 2)                                           AS Monetary
    FROM transactions
    GROUP BY CustomerID
)
SELECT
    COUNT(CustomerID)        AS Total_Customers,
    ROUND(AVG(Recency), 1)   AS Avg_Recency_Days,
    ROUND(AVG(Frequency), 1) AS Avg_Frequency,
    ROUND(AVG(Monetary), 2)  AS Avg_Monetary
FROM rfm_base;