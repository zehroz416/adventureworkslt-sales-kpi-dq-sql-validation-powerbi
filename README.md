# Sales KPI Reporting with Data Quality & SQL Validation (Power BI)

**Label:** Public Dataset — Portfolio Demonstration  
**Dataset:** AdventureWorksLT (Microsoft sample database)  
**Tools:** SQL Server (SSMS) • Power BI • Power Query • DAX

## Overview
This portfolio project demonstrates an **audit-first KPI reporting workflow**:
- Built a star schema model in Power BI
- Defined KPI measures (Revenue, Orders, Units, AOV, Discount)
- Implemented a **Data Quality audit** (missing keys + negative value checks)
- Reconciled Power BI totals against a **SQL baseline** (diff = 0 → PASS)

## Dataset
- **Official source:** https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks  
- **Database used:** AdventureWorksLT2022 (restored in SQL Server)

## Scope
### Grain
- **FactSales grain:** 1 row = **1 sales order line** (SalesOrderDetail line)

### Date coverage
- Sample dataset contains orders for **a single date** (trend analysis limited).

## Report pages (4)
1. **Sales KPI Overview (Executive)**
2. **Product & Customer Drilldown**
3. **Data Quality Checks (Audit)**
4. **Validation vs SQL Baseline**

## Screenshots
### Executive
![Executive](screenshots/01_executive.png)

### Drilldown
![Drilldown](screenshots/02_drilldown.png)

### Data Quality Audit
![Data Quality](screenshots/03_data_quality.png)

### Validation vs SQL Baseline
![Validation](screenshots/04_validation.png)

### Data model (Star schema)
![Model](screenshots/05_model_view.png)

## Data Quality (DQ) summary
Checks included:
- Missing CustomerID
- Missing ProductID
- Bad Qty (<=0)
- Bad UnitPrice (<0)
- Bad LineTotal (<0)

**Result:** PASS (all issue counts = 0 in this dataset)

## Validation / reconciliation summary
SQL baseline totals were compared with Power BI totals using diff measures.

- **Orders:** 32  
- **Units:** 2,087  
- **Revenue:** 708,690.15  
**Diff:** 0 → **PASS**

## OnePager
- [OnePager PDF](onepager/OnePager_SalesKPI_DQ_SQLValidation.pdf)

## Limitations
- Date coverage is limited to **1 day** in the sample dataset; trends are not representative.
- Portfolio demonstration only (public sample database).

## Video walkthrough (Loom)
(Add Loom link here)
