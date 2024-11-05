# Sales Analysis SQL Project

## Introduction  
🚀 **Discover the Power of Retail Data Analysis!** 📊  
This project focuses on exploring a retail sales database using SQL. By analyzing the dataset, we aim to extract meaningful insights that can help businesses understand customer behavior, sales trends, and product performance to drive data-driven decision-making. 🌐

This project demonstrates SQL skills commonly used by data analysts to clean, explore, and analyze retail sales data. The analysis covers setting up a retail database, performing exploratory data analysis (EDA), and answering specific business questions with SQL. It’s an ideal project for beginners looking to solidify their SQL foundation.

---

## Objectives

1. **Database Setup**: Create and populate a retail sales database.
2. **Data Cleaning**: Identify and remove records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Understand the dataset through basic exploratory analysis.
4. **Business Insights**: Use SQL to answer business questions and derive insights.

---

## Project Structure

### 1. Database Setup

- **Database Creation**: The project begins with creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store sales data. The table includes fields for transaction ID, sale date, customer details, product category, sales figures, and more.

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```
### 2. Data Cleaning & Exploration

- **Record Count**: Find the total number of records.
- **Customer Count**: Count unique customers.
- **Category Count**: List all unique product categories.
- **Null Value Check**: Identify and delete records with null values.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
### 3. Data Analysis & Findings
Here are some SQL queries developed to answer key business questions:
### Q1. Retrieve all columns for sales made on '2022-11-05'.

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```
### Q2. Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in November 2022.

```sql
SELECT category, quantity, sale_date
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity > 10
  AND EXTRACT(MONTH FROM sale_date) = 11
  AND EXTRACT(YEAR FROM sale_date) = 2022;
```
# Q3: Total Sales by Category

```sql
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
```
# Q4: Average Age of Customers in the Beauty Category

```sql
SELECT AVG(age) AS average_age
FROM retail_sales
WHERE category = 'Beauty';
```
# Q5: Transactions Over $1000

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```
# Q6: Number of Transactions by Gender and Category

```sql
SELECT gender, category, COUNT(transactions_id) AS total_number_of_transactions
FROM retail_sales
GROUP BY gender, category;
```
# Q7: Average Sales by Month and Year

```sql
SELECT 
    EXTRACT(YEAR FROM sale_date) AS sales_year,
    EXTRACT(MONTH FROM sale_date) AS sales_month,
    AVG(total_sale) AS average_sales
FROM retail_sales
GROUP BY sales_year, sales_month
ORDER BY sales_year, average_sales DESC;
```
# Q8: Top 5 Customers by Total Sales

```sql
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```
# Q9: Unique Customers by Category

```sql
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```
# Q10: Orders by Shift

```sql
SELECT 
    COUNT(*) AS total_orders,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM retail_sales
GROUP BY shift;
```
# Findings 🕵️‍♂️

## Customer Demographics 👥
- The dataset encompasses a diverse range of customers across various age groups.
- Sales are distributed across multiple categories, notably **Clothing** and **Beauty**, reflecting varied consumer interests.

## High-Value Transactions 💰
- Several transactions exceed a total sale amount of **$1000**, highlighting instances of premium purchases and potential luxury market engagement.

## Sales Trends 📈
- Monthly analysis reveals significant variations in sales, allowing for the identification of **peak seasons** and potential promotional opportunities.

## Customer Insights 🔍
- The analysis uncovers the **top-spending customers** and identifies the most popular product categories, which can inform targeted marketing strategies.

---

# Reports 📊

## Sales Summary 📑
- A comprehensive report summarizing total sales figures, customer demographics, and performance across product categories.

## Trend Analysis 📉
- Insights derived from sales trends across different months and shifts, offering a clear view of seasonal patterns and sales fluctuations.

## Customer Insights 🧑‍🤝‍🧑
- Detailed reports on top customers and unique customer counts per category, providing valuable information for relationship management and retention strategies.

---

# Conclusion 🎯

This project serves as a **comprehensive introduction to SQL** for aspiring data analysts, encompassing:
- **Database Setup**: Understanding the foundational structure and design.
- **Data Cleaning**: Ensuring accuracy and reliability of data through preprocessing techniques.
- **Exploratory Data Analysis**: Employing SQL queries to uncover insights and trends.
- **Business-Driven SQL Queries**: Crafting queries tailored to drive strategic business decisions.

The findings from this project can significantly inform and guide business strategies by providing a deeper understanding of:
- **Sales Patterns**: Identifying when and where sales peak.
- **Customer Behavior**: Understanding who the customers are and what they prefer.
- **Product Performance**: Recognizing which products drive revenue and customer engagement.

This analysis positions me as a strong candidate for data analysis roles, equipped with practical experience and a clear understanding of data-driven decision-making processes.

