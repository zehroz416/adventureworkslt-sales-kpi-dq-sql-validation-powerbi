-- AdventureWorksLT2022 (Portfolio Demo)
-- Data Quality checks (based on reporting view)

USE AdventureWorksLT2022;
GO

-- 1) Duplicate check (Fact grain)
SELECT COUNT(*) AS DuplicateRows
FROM (
  SELECT SalesOrderID, SalesOrderDetailID
  FROM SalesLT.vw_FactSales
  GROUP BY SalesOrderID, SalesOrderDetailID
  HAVING COUNT(*) > 1
) x;

-- 2) Missing keys / dates
SELECT
  SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
  SUM(CASE WHEN ProductID  IS NULL THEN 1 ELSE 0 END) AS MissingProductID,
  SUM(CASE WHEN OrderDate  IS NULL THEN 1 ELSE 0 END) AS MissingOrderDate
FROM SalesLT.vw_FactSales;

-- 3) Negative/zero sanity checks
SELECT
  SUM(CASE WHEN OrderQty <= 0 THEN 1 ELSE 0 END) AS BadQty,
  SUM(CASE WHEN UnitPrice < 0 THEN 1 ELSE 0 END) AS BadUnitPrice,
  SUM(CASE WHEN LineTotal < 0 THEN 1 ELSE 0 END) AS BadLineTotal
FROM SalesLT.vw_FactSales;
