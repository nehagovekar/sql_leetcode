/*
Problem: Ranking Employees by Sales
Description:
You are given a table Sales with the following columns:

Column Name	Type
id	Integer
employee_id	Integer
sales_amount	Decimal
sale_date	Date
Write a SQL query to rank employees based on their total sales amount in descending order.

If two employees have the same total sales amount, they should have the same rank.

The next rank should be skipped (like in the Olympic ranking system).

Example:
Input:

id	employee_id	sales_amount	sale_date
1	101	500	2025-01-01
2	102	300	2025-01-01
3	101	200	2025-01-02
4	103	700	2025-01-02
5	102	100	2025-01-02
6	101	100	2025-01-03
Output:

employee_id	total_sales	rank
103	700	1
101	800	2
102	400	3
Constraints:
The Sales table will have at most 100,000 rows.

Concepts Required:
Aggregate functions (SUM())

Window functions (RANK())

GROUP BY to calculate total sales
*/
SELECT employee_id, SUM(sales_amount) AS total_sales, RANK() OVER (ORDER BY SUM(sales_amount) DESC) as rank
FROM Sales
GROUP BY employee_id;