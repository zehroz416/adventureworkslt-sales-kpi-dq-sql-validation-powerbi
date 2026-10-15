# Sales KPI Reporting with Data Quality & SQL Validation (Power BI)

**Label:** Public Dataset — Portfolio Demonstration  
**Dataset:** AdventureWorksLT (Microsoft sample database)  
**DB used:** AdventureWorksLT2022 (restored locally in SQL Server)  
**Tools:** SQL Server (SSMS) • Power BI • Power Query • DAX  

## Business goal
Create a trusted Sales KPI report with an audit-first workflow:
- define KPI logic and reporting rules
- run data quality checks
- reconcile Power BI totals back to SQL baselines (proof of accuracy)

## Scope
**Grain (FactSales):** 1 row = 1 sales order line (SalesOrderDetail line)  
**Date coverage:** sample contains orders for **a single date** → trend analysis is limited

## Deliverables (4 pages)
1. Executive Overview  
2. Drilldown (Product & Customer)  
3. Data Quality Audit  
4. Validation vs SQL baseline  

## Report screenshots
### Executive Overview
![Executive](screenshots/01_executive.png)

### Drilldown
![Drilldown](screenshots/02_drilldown.png)

### Data Quality Audit
![Data Quality](screenshots/03_data_quality.png)

### Validation vs SQL baseline
![Validation](screenshots/04_validation.png)

### Data model (star schema)
![Model](screenshots/05_model_view.png)

## KPI dictionary (core)
- **Revenue:** SUM(LineTotal)
- **Orders:** DISTINCTCOUNT(SalesOrderID)
- **Units:** SUM(OrderQty)
- **AOV:** Revenue / Orders
- **Discount amount:** SUM(UnitPrice * UnitPriceDiscount * OrderQty) *(if included in your model; otherwise remove this line)*

## Data quality (DQ) checks
Checks implemented (SQL + surfaced in Power BI DQ page):
- Duplicate check at fact grain (SalesOrderID + SalesOrderDetailID)
- Missing keys/dates (CustomerID, ProductID, OrderDate)
- Negative/invalid values (OrderQty <= 0, UnitPrice < 0, LineTotal < 0)

**DQ result:** PASS (all issue counts = 0 in this sample dataset)

## Validation / reconciliation (SQL vs Power BI)
Baseline totals calculated in SQL and reconciled to Power BI measures:

- **Orders:** 32  
- **Units:** 2,087  
- **Revenue:** 708,690.15  
✅ **Diff:** 0 → **PASS**

## SQL proof (reproducible)
SQL scripts used for views, DQ checks, and baseline totals:
- [01_views.sql](sql/01_views.sql)
- [02_dq_checks.sql](sql/02_dq_checks.sql)
- [03_baseline_totals.sql](sql/03_baseline_totals.sql)

*(Optional: add PDF appendix link here if/when uploaded)*
<!-- - [SQL Appendix PDF](sql/SQL_Appendix_AdventureWorksLT.pdf) -->

## OnePager
- [OnePager PDF](onepager/OnePager_SalesKPI_DQ_SQLValidation.pdf)

## Dataset source
- Official Microsoft samples: https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks

## Limitations / risks
- Dataset date coverage is **1 day**, so YoY/MoM trends are not meaningful.
- Public sample database → portfolio demonstration only.

## Limitations
- Date coverage is limited to **1 day** in the sample dataset; trends are not representative.
- Portfolio demonstration only (public sample database).

## Video walkthrough (Loom)
(Add Loom link here)
