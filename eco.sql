create database ecommerce
use ecommerece;
 -- 1. Display all records.
 
select * from  ecommerce;
-- 2.Count total records.
select count(*)	as count from ecommerce;

 -- 3. Count unique customers.

select COUNT(DISTINCT customer_id) AS total_customers
FROM ecommerce;

-- 4 Calculate total revenue.
select sum(revenue) as totalrevenue from ecommerce;	

-- 5 Calculate Average Revenue
select avg(revenue) as avgrevanue from ecommerce;
-- 6 Find Maximum Revenue and min revenue.
select max(revenue) AS MAX , min(revenue) AS MIN from ecommerce;

-- 7 Count Total Cart Abandoned Sessions

select count(*) as totalabandoned  from ecommerce where cart_abandoned = '1'
-- 8 Find Average Customer Rating
select avg(rating) as rating from ecommerce
-- 9 Revenue by Location
select location , sum(revenue) as total_revenue
from ecommerce
group by location ;

10 Revenue by Product Category
select product_category , sum(revenue) as total_revenue
from ecommerce
group by product_category ;

11 Revenue by Payment Method 
select payment_method, sum(revenue) as total_revenue
from ecommerce
group by payment_method;

 -- 12 Revenue by Marketing Channel
 select marketing_channel, sum(revenue) as total_revenue
 from ecommerce
 group by marketing_channel;

-- 13 Average Rating by Product Category 

 select product_category , avg(rating)
 from ecommerce
 group by product_category

-- 14 . Count customers by device type.
 select device_type , count(*) as custmercount
 from ecommerce
 group by device_type

-- 15 Total Revenue by Payment Method
SELECT payment_method,
       SUM(revenue) AS total_revenue
FROM ecommerce
GROUP BY payment_method;
-- 16.  Top 10 Customers
select customer_id from ecommerce
order by revenue desc
limit 10;

-- 17 . Find Top 5 locations by revenue.

select location, sum(revenue) from ecommerce
group by location
limit 5;

18 Find product category with highest revenue.
SELECT product_category,
       SUM(revenue) AS total_revenue
FROM ecommerce
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 1;

-- 19 Find product category with highest average discount

SELECT product_category,
       AVG(discount_percent) AS average_discount
FROM ecommerce
GROUP BY product_category
ORDER BY average_discount DESC
LIMIT 1;

20 Find purchase count by device type 
SELECT device_type,
       COUNT(*) AS purchase_count
FROM ecommerce
WHERE purchased = 1
GROUP BY device_type;
-- 21 Find customers whose total revenue is greater than the average revenue.

SELECT customer_id,
       SUM(revenue) AS total_revenue
FROM ecommerce
GROUP BY customer_id
HAVING SUM(revenue) >
(
SELECT AVG(revenue)
FROM ecommerce
);
-- 22 Find records where payment method is 0 or 1.
SELECT *
FROM ecommerce
WHERE payment_method IN (0,1);

-- 23 Previous Revenue
SELECT visit_date,revenue,
LAG(revenue) OVER(ORDER BY visit_date) AS previous_revenue
FROM ecommerce;
-- 24 Create a revenue summary using a CTE.
WITH revenue_cte AS
(
SELECT location,
SUM(revenue) AS total_revenue
FROM ecommerce
GROUP BY location
)
SELECT *
FROM revenue_cte
ORDER BY total_revenue DESC;