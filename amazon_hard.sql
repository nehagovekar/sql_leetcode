/*
70. What are the averages of total spend across users before and after joining prime?
146
65%
What are the averages of total spend across users before and after joining prime? Note that a single transaction spend is calculated by shipping_cost + (quantity * price). Round the output to 2 decimal places.

cte
subquery
group by
join
Hint #1
How do you break down a complex query? Use a CTE.

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
avg_pre_prime_spend	avg_post_prime_spend
170.33	251.44
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
amazon_products	
product_id	bigint
product_name	varchar
category	varchar
price	double
rating	bigint
published_at	date
amazon_transactions	
transaction_id	bigint
user_id	bigint
product_id	bigint
transaction_dt	timestamp
payment_method	varchar
shipping_cost	double
quantity	bigint
amazon_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	timestamp
prime_member	bigint
prime_joined_dt	timestamp
*/
WITH selected_users AS (SELECT at.product_id, at.transaction_dt, au.prime_joined_dt,  (price * quantity) + shipping_cost total_cost,
CASE WHEN transaction_dt >= prime_joined_dt THEN 1 ELSE 0 END as is_prime_purchase
FROM amazon_transactions at
JOIN amazon_users au
ON at.user_id=au.user_id
JOIN amazon_products ap 
ON ap.product_id= at.product_id),
post_prime AS
(SELECT ROUND(AVG(total_cost),2) AS avg_post_prime_spend
  FROM selected_users
  WHERE is_prime_purchase=1),
pre_prime AS
(SELECT ROUND(AVG(total_cost),2) AS avg_pre_prime_spend
  FROM selected_users
  WHERE is_prime_purchase=0)
SELECT 
    pre.avg_pre_prime_spend,
    post.avg_post_prime_spend
FROM pre_prime pre
CROSS JOIN post_prime post;

  
