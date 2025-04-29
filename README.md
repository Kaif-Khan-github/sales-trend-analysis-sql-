# 📊 Monthly Sales Trend Analysis (SQL Project)

This project focuses on analyzing sales data from an online shop using SQL to uncover valuable business insights such as revenue trends, order volumes, customer behavior, and high-value customer segments.

---

## 📁 Dataset

**File:** `Online Shop Customer Sales Data.csv`  
Contains 65,796 rows of customer transactions including:
- `Customer_id`
- `Age`
- `Gender`
- `Purchase_DATE`
- `Purchase_VALUE`
- `Pay_Method`
- and other behavior/marketing columns

---

## 🧪 SQL Analysis Tasks

The following SQL queries were performed using **MySQL**:

### ✅ Monthly Revenue and Order Volume
Extracted total revenue and number of orders per month:
```sql
SELECT EXTRACT(YEAR ...), EXTRACT(MONTH ...), SUM(Purchase_VALUE), COUNT(*)
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

✅ Highest Revenue Month
...ORDER BY total_revenue DESC LIMIT 1;


✅ Month with Most Orders
...ORDER BY order_volume DESC LIMIT 1;

✅ Average Spend by Age Group
CASE WHEN Age < 20 THEN 'Under 20' ...


✅ Top 5 Highest Spending Customers
SELECT Customer_id, SUM(Purchase_VALUE), COUNT(*) ...


✅ Monthly Average Order Value
SELECT EXTRACT(YEAR...), EXTRACT(MONTH...), AVG(Purchase_VALUE) ...





📄 Files in this Repo
File	Description
Online Shop Customer Sales Data.csv	Raw dataset used for SQL analysis
Sales_Trend_Analysis.sql	All SQL queries used in the project
Sales_Trend_Analysis_Report_Filled.pptx	Final PowerPoint report with insights and placeholders for results
README.md	This file, documenting the project overview and usage

🧠Key Insights (from Slide 10)
Peak revenue occurred in: October 2021

Highest number of orders in: December 2021

Most valuable age group: 30s

High-spending customers: Ideal for loyalty programs



🛠️ Tools Used
MySQL (8.0+)

PowerPoint (for reporting)



