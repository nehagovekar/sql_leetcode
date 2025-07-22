/*
Highest Cost Orders


Last Updated: July 2025

Medium
ID 9915

289

Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. If a customer had more than one order on a certain day, sum the order costs on a daily basis. Output each customer's first name, total cost of their items, and the date.


For simplicity, you can assume that every first name in the dataset is unique.

Tables
customers
orders
More about this question
Hints
Expected Output
All required columns and the first 5 rows of the solution are shown

first_name	order_date	max_cost
Mark	2019-04-19	275
Jill	2019-04-19	275

*/

WITH selected_customers AS(
SELECT cust_id, order_date, sum(total_order_cost) as max_cost,
RANK() OVER (ORDER BY sum(total_order_cost) DESC) as rnk
FROM orders
WHERE order_date between '2019-02-01' and '2019-05-01'
GROUP BY cust_id,order_date )

SELECT c.first_name, sc.order_date, sc.max_cost FROM selected_customers sc
JOIN
customers c
ON sc.cust_id = c.id
WHERE sc.rnk=1;