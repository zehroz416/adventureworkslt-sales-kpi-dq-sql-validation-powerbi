-- AdventureWorksLT2022 (Portfolio Demo)
-- Reporting views for Power BI import
USE AdventureWorksLT2022;
GO

CREATE OR ALTER VIEW SalesLT.vw_FactSales AS
SELECT
    d.SalesOrderID,
    d.SalesOrderDetailID,
    h.OrderDate,
    h.DueDate,
    h.ShipDate,
    h.Status,
    h.CustomerID,
    h.ShipToAddressID,
    h.BillToAddressID,
    d.ProductID,
    d.OrderQty,
    d.UnitPrice,
    d.UnitPriceDiscount,
    d.LineTotal
FROM SalesLT.SalesOrderDetail d
JOIN SalesLT.SalesOrderHeader h
  ON d.SalesOrderID = h.SalesOrderID;
GO

CREATE OR ALTER VIEW SalesLT.vw_DimCustomer AS
SELECT
  CustomerID,
  Title,
  FirstName,
  LastName,
  CompanyName,
  EmailAddress,
  Phone
FROM SalesLT.Customer;
GO

CREATE OR ALTER VIEW SalesLT.vw_DimProduct AS
SELECT
  ProductID,
  Name AS ProductName,
  ProductNumber,
  Color,
  StandardCost,
  ListPrice
FROM SalesLT.Product;
GO
