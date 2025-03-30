/*
Problem: Running Total of Sales
Description:
You are given a table Sales with the following columns:

Column Name	Type
id	Integer
employee_id	Integer
sales_amount	Decimal
sale_date	Date
Write a SQL query to return the running total of sales for each employee_id, ordered by sale_date. The running total should be calculated as the sum of all sales_amount for each employee up to and including that row.

Example:
Input:

id	employee_id	sales_amount	sale_date
1	101	100	2025-01-01
2	102	200	2025-01-01
3	101	150	2025-01-02
4	103	50	2025-01-02
5	102	300	2025-01-02
6	101	200	2025-01-03
Output:

employee_id	sale_date	running_total
101	2025-01-01	100
102	2025-01-01	200
101	2025-01-02	250
103	2025-01-02	50
102	2025-01-02	500
101	2025-01-03	450
Explanation:
The running total for employee_id 101 is calculated as:

Row 1: 100

Row 3: 100 + 150 = 250

Row 6: 250 + 200 = 450

The running total for employee_id 102 is:

Row 2: 200

Row 5: 200 + 300 = 500

The running total for employee_id 103 is just 50 in row 4.

Constraints:
The Sales table will have at most 10^5 rows.
*/
SELECT employee_id, sale_date,
SUM(sales_amount) OVER (partition by employee_id ORDER BY sale_date) AS running_total
FROM Sales;