-- AdventureWorksLT2022 (Portfolio Demo)
-- SQL baseline totals used to validate Power BI measures

USE AdventureWorksLT2022;
GO

-- Profiling: row count + date coverage
SELECT
  COUNT(*) AS FactRows,
  MIN(OrderDate) AS MinOrderDate,
  MAX(OrderDate) AS MaxOrderDate
FROM SalesLT.vw_FactSales;

-- Baseline totals (for reconciliation)
SELECT
  COUNT(DISTINCT SalesOrderID) AS Orders,
  SUM(OrderQty)                AS Units,
  CAST(SUM(LineTotal) AS decimal(18,2)) AS Revenue
FROM SalesLT.vw_FactSales;
