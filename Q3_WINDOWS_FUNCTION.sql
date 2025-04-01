/*
Problem: Find the Second Highest Salary
Description:
You are given a table Employee with the following structure:

Column Name	Type
id	int (Primary Key)
salary	decimal
Write a SQL query to find the second highest salary in the Employee table.

If there is no second highest salary, return NULL.

Example 1:
Input:

id	salary
1	1000
2	2000
3	3000
Output:

SecondHighestSalary
2000
Example 2 (No second highest salary):
Input:

id	salary
1	1000
Output:

SecondHighestSalary
NULL
Concepts Required:
Window Functions (DENSE_RANK(), RANK())

LIMIT and OFFSET (alternative approach)

Handling NULL values properly
*/
WITH ranking AS (SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
FROM Employee)
SELECT  COALESCE(salary,null) AS SecondHighestSalary FROM ranking 
WHERE rnk=2;