create database if not exists sales;
use sales;

CREATE TABLE if not exists online_sales (
    Customer_id INT,
    Age INT,
    Gender INT,
    Revenue_Total FLOAT,
    N_Purchases INT,
    Purchase_DATE VARCHAR(10),
    Purchase_VALUE FLOAT,
    Pay_Method INT,
    Time_Spent INT,
    Browser INT,
    Newsletter INT,
    Voucher INT
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online Shop Customer Sales Data.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS month,
  SUM(Purchase_VALUE) AS total_revenue,
  COUNT(*) AS order_volume
FROM 
  online_sales
GROUP BY 
  year, month
ORDER BY 
  year, month;

 SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS month,
  COUNT(*) AS order_volume
FROM 
  online_sales
GROUP BY 
  year, month
ORDER BY 
  order_volume DESC
LIMIT 1;

SELECT 
  CASE
    WHEN Age < 20 THEN 'Under 20'
    WHEN Age BETWEEN 20 AND 29 THEN '20s'
    WHEN Age BETWEEN 30 AND 39 THEN '30s'
    WHEN Age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
  AVG(Purchase_VALUE) AS avg_spend
FROM 
  online_sales
GROUP BY 
  age_group
ORDER BY 
  avg_spend DESC;


SELECT 
  Customer_id,
  SUM(Purchase_VALUE) AS total_spent,
  COUNT(*) AS total_orders
FROM 
  online_sales
GROUP BY 
  Customer_id
ORDER BY 
  total_spent DESC
LIMIT 5;


SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Purchase_DATE, '%d.%m.%y')) AS month,
  AVG(Purchase_VALUE) AS avg_order_value
FROM 
  online_sales
GROUP BY 
  year, month
ORDER BY 
  year, month;

