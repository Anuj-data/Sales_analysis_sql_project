--craeting table 



CREATE TABLE retail_sales (
			transactions_id INT PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,
			customer_id INT,
			gender VARCHAR(255),
			age INT,
			category VARCHAR(255),
			quantiy INT,
			price_per_unit FLOAT,
			cogs FLOAT,
			total_sale FLOAT
);

SELECT 
	*
FROM
	retail_sales;


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'.


SELECT *
FROM
	retail_sales
WHERE
	sale_date = '2022-11-05';

/* Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
the quantity sold is more than 10 in the month of Nov-2022. */


	
SELECT 
	category,
	quantiy,
	sale_date
FROM 
	retail_sales
WHERE category = 'Clothing'
  AND quantiy > 10
  AND EXTRACT(MONTH FROM sale_date) = 11
  AND EXTRACT(YEAR FROM sale_date) = 2022;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.


SELECT 
	SUM(total_sale) AS total_sales,
	category
FROM
	retail_sales
GROUP BY
	category;



-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


SELECT 
	AVG(age) AS average_age,
	category
FROM
	retail_sales
WHERE
	category = 'Beauty'
GROUP BY
	category;


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT 
    *
FROM 
    retail_sales
WHERE 
    total_sale < 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    gender,
    category,
    COUNT(transactions_id) AS total_number_of_transactions
FROM 
    retail_sales
GROUP BY
    gender,
    category;



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.


SELECT 
    EXTRACT(YEAR FROM sale_date) AS sales_year,
    EXTRACT(MONTH FROM sale_date) AS sales_month,
    AVG(total_sale) AS average_sales
FROM 
    retail_sales
GROUP BY 
    sales_year,
    sales_month
ORDER BY 
    sales_year,
    average_sales DESC;



-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
    customer_id,         
    SUM(total_sale) AS total_sales
FROM 
    retail_sales     
GROUP BY 
    customer_id
ORDER BY 
    total_sales DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM 
    retail_sales
GROUP BY 
    category;


/* Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon 
Between 12 & 17, Evening >17) */

SELECT 
	quantiy,
CASE
	WHEN EXTRACT(HOUR FROM sale_time) <=12 THEN 'Morning'
	WHEN EXTRACT (HOUR FROM sale_time) Between 12 AND 17 THEN 'Afternoon'
	WHEN EXTRACT (HOUR FROM sale_time) >17 THEN 'Evening'
	ELSE 'Null'
END AS 
	shifts
FROM
	retail_sales;


---Thankyou

