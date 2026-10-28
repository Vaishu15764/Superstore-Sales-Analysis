USE SuperstoreDB;
GO

-- total rows
SELECT COUNT(*) AS TotalRows
FROM dbo.superstore_cleaned;

-- Preview the data
SELECT TOP 10 *
FROM dbo.superstore_cleaned;

-- unique categories
SELECT DISTINCT Category
FROM dbo.superstore_cleaned;

-- unique regions
SELECT DISTINCT Region
FROM dbo.superstore_cleaned;

-- Unique shipping mode
SELECT DISTINCT Ship_Mode
FROM dbo.superstore_cleaned;

-- Missing values
SELECT 
    SUM(CASE WHEN Postal_Code IS NULL THEN 1 ELSE 0 END) AS MissingPostal_Code,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS MissingSales,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS MissingOrder_Date
FROM dbo.superstore_cleaned;

-- calculating business KPIs
SELECT 
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    COUNT(DISTINCT Customer_ID) AS TotalCustomers,
    COUNT(DISTINCT Product_ID) AS UniqueProducts,
    ROUND(SUM(Sales),2) AS TotalSales,
    ROUND(AVG(Sales),2) AS AverageSalesPerRecord
FROM dbo.superstore_cleaned;

------------- ** Sales by Ctegory**--------------
-- Q. Which category generates the highest sales?
SELECT Category, ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Category
ORDER BY TotalSales DESC;

--------------- ** Sales by Region-----------------
-- Q. Which region performs best?
SELECT Region , ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Region
ORDER BY TotalSales DESC;

----------------**Sales by customer segment**--------
-- Q. Which customer segment contributes the most revenue?
SELECT Segment, ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Segment
ORDER BY TotalSales DESC;

-----------------**Top 10 states by sales**------------
SELECT TOP 10 State, ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY State
ORDER BY TotalSales DESC;

---------------- ** Top 10 product by sales **--------------
SELECT TOP 10 Product_Name , ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Product_Name
ORDER BY TotalSales DESC;

------------- ** Sales by sub-category **--------------------
SELECT Sub_Category , ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Sub_Category
ORDER BY TotalSales DESC;

-----------------** Monthly sales trend **-----------------------
-- Q. How do sales change over time?
SELECT 
     YEAR(Order_Date) AS OrderYear,
     MONTH(Order_Date) AS MonthNumber,
     DATENAME(MONTH, Order_Date) AS MonthName,
     ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY 
     YEAR(Order_Date),
     MONTH(Order_Date),
     DATENAME(MONTH, Order_Date)
ORDER BY
     OrderYear,
     MonthNumber;

----------------** Year-over-year sales growth **-----------------
-- Q. Are sales growing or declining each year?

WITH YearlySales AS (
    SELECT
        YEAR(Order_Date) AS OrderYear,
        SUM(Sales) AS TotalSales
    FROM dbo.superstore_cleaned
    GROUP BY YEAR(Order_Date)
),
SalesComparison AS (
    SELECT
        OrderYear,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY OrderYear) AS PreviousYearSales
    FROM YearlySales
)
SELECT
    OrderYear,
    ROUND(TotalSales, 2) AS TotalSales,
    ROUND(PreviousYearSales, 2) AS PreviousYearSales,
    ROUND(
        (TotalSales - PreviousYearSales) * 100.0
        / NULLIF(PreviousYearSales, 0),
        2
    ) AS YoYGrowthPercent
FROM SalesComparison
ORDER BY OrderYear;



-------------------------** Average shipping time **-----------------------

SELECT
    Ship_Mode,
    COUNT(*) AS TotalRecords,
    ROUND(
        AVG(CAST(DATEDIFF(DAY, Order_Date, Ship_Date) AS FLOAT)),
        2
    ) AS AverageShippingDays
FROM dbo.superstore_cleaned
WHERE Order_Date IS NOT NULL
  AND Ship_Date IS NOT NULL
GROUP BY Ship_Mode
ORDER BY AverageShippingDays;

-------------------- ** Sales by category and region.**------------------
SELECT 
    Category , 
    Region, 
    ROUND(SUM(Sales),2) AS TotalSales
FROM dbo.superstore_cleaned
GROUP BY Category , Region
ORDER BY Category , TotalSales DESC;
     
---------------------** Top 10 Customers by Sales**-----------------------
SELECT TOP 10
      Customer_ID,
      Customer_Name,
      ROUND(SUM(Sales),2) AS TotalSales,
      COUNT(DISTINCT Order_ID)AS TotalOrders
FROM dbo.superstore_cleaned
GROUP BY 
      Customer_ID,
      Customer_Name
ORDER BY TotalSales DESC;

---------------------**Sales Contribution Percentage by Category **-----------
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS CategorySales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales)
         FROM dbo.superstore_cleaned),
        2
    ) AS SalesContributionPercent
FROM dbo.superstore_cleaned
GROUP BY Category
ORDER BY CategorySales DESC;

---------------------**Running Total of Monthly Sales **-----------------------
-- Q. How do total sales accumulate month by month over time?

;WITH MonthlySales AS (
    SELECT
        YEAR(Order_Date) AS OrderYear,
        MONTH(Order_Date) AS MonthNumber,
        SUM(Sales) AS TotalSales
    FROM dbo.superstore_cleaned
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)
SELECT
    OrderYear,
    MonthNumber,
    ROUND(TotalSales, 2) AS MonthlySales,
    ROUND(
        SUM(TotalSales) OVER (
            ORDER BY OrderYear, MonthNumber
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS RunningTotalSales
FROM MonthlySales
ORDER BY OrderYear, MonthNumber;

-------------------** Shipping Performance Analysis **-------------
-- Q. Which shipping mode has the longest average shipping time?

SELECT
    Ship_Mode,
    COUNT(*) AS TotalRecords,
    ROUND(
        AVG(
            CAST(
                DATEDIFF(DAY, Order_Date, Ship_Date)
                AS FLOAT
            )
        ),
        2
    ) AS AverageShippingDays
FROM dbo.superstore_cleaned
WHERE Order_Date IS NOT NULL
  AND Ship_Date IS NOT NULL
GROUP BY Ship_Mode
ORDER BY AverageShippingDays DESC;
