# NorthwindTraders_project1TrackA
This is my Internship Project with Dahel Technology

## Overview
This project contains advanced SQL analytics queries built using the Northwind Traders database as part of the DAHEL Technologies Data Analytics Internship Project.

The project demonstrates practical SQL skills used in real-world business analysis, reporting, and dashboard development using Powerbi

---

# Database Used
- Northwind Traders Database
- MySQL Workbench

---

# Project Objectives
The goal of this project was to:
- Analyze sales and customer behavior
- Generate business insights from transactional data
- Practice advanced SQL concepts
- Build reporting queries similar to real business dashboards

---

# SQL Concepts & Functions Used

## Joins
- INNER JOIN
- LEFT JOIN
- SELF JOIN

## Aggregate Functions
- SUM()
- COUNT()
- AVG()
- MAX()
- MIN()
- ROUND()

## Window Functions
- RANK()
- LAG()
- OVER()
- PARTITION BY

## Date Functions
- YEAR()
- MONTH()
- QUARTER()
- DATEDIFF()
- DATE_SUB()

## Conditional Logic
- CASE WHEN

## Advanced SQL Features
- CTEs (WITH clause)
- Stored Procedures
- Views
- UNION ALL
- Subqueries

---

# Key Analysis Performed

## Customer Analysis
- RFM Analysis
- Spending tier segmentation
- Top customers by revenue
- Geographic revenue analysis

## Product Analysis
- Top-selling products
- Cross-selling opportunities
- Product reorder reports
- Slow-moving inventory detection

## Employee Analysis
- Employee revenue contribution
- Employee performance dashboard
- Territory revenue contribution

## Sales & Revenue Analysis
- Monthly revenue trends
- Quarter-over-quarter growth
- Revenue by category
- Order value analysis

---

# Challenges Encountered

## 1. GROUP BY Errors
Encountered:
Error Code: 1055 - Expression not in GROUP BY clause

### Solution
Added all non-aggregated columns to the GROUP BY clause to comply with MySQL strict mode.

---

## 2. UNION ALL Datatype Conflicts
Some queries returned text while others returned numeric values.

### Solution
Used:
CAST(value AS CHAR)

to make all UNION outputs consistent.

---

## 3. Missing Columns in Dataset
Some versions of the Northwind database had different column names or missing fields such as:
- ReportsTo
- category_name vs CategoryName

### Solution
Adjusted queries based on the schema version being used.

---

## 4. JOIN Syntax Errors
Encountered incorrect JOIN syntax during multi-table joins.

### Solution
Ensured all joins used proper conditions:
ON table1.column = table2.column

---

# Sample Business Questions Answered
- Which products generate the most revenue?
- Which customers contribute the highest sales?
- Which employee manages the most revenue?
- Which products are frequently bought together?
- Which regions generate the highest revenue?
- Which products require restocking?

---

# Tools Used
- MySQL Workbench
- Northwind Database
- PowerBi
- GitHub

---

# Learning Outcomes
Through this project, I gained practical experience in:
- Writing advanced SQL queries
- Business reporting
- Data aggregation and analysis
- Debugging SQL errors
- Database relationship management
- Building analytics-ready datasets
