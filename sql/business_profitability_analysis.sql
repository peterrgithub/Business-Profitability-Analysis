-- Business Profitability Analysis
-- SQL validation and business analysis
--
-- Source dataset:
-- Kaggle Sample Superstore dataset
--
-- Purpose:
-- Use SQL to reproduce and validate selected profitability
-- calculations from the Python/pandas analysis.
--
-- Assumed table name:
-- superstore
--
-- Note:
-- The source dataset is an order-line level dataset.
-- Repeated Order IDs are therefore expected.

-- ============================================================
-- 1. OVERALL SALES AND PROFITABILITY
-- ============================================================

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM superstore;

-- ============================================================
-- 2. PROFITABILITY BY CATEGORY
-- ============================================================

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

-- ============================================================
-- 3. PROFITABILITY BY REGION
-- ============================================================

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM superstore
GROUP BY Region
ORDER BY Profit_Margin_Percent DESC;

-- ============================================================
-- 4. PROFITABILITY BY DISCOUNT LEVEL
-- ============================================================

SELECT
    Discount,
    COUNT(*) AS Order_Line_Count,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- ============================================================
-- 5. LOSS-MAKING PRODUCTS
-- ============================================================

SELECT
    "Product Name",
    COUNT(*) AS Order_Line_Count,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM superstore
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;