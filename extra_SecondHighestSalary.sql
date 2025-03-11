/*
176. Second Highest Salary
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

SELECT IFNULL((SELECT distinct(salary) FROM Employee 
ORDER BY salary DESC
LIMIT 1
OFFSET 1), NULL) AS SecondHighestSalary;

SELECT(SELECT salary FROM
(SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk FROM Employee) ranked
WHERE rnk=2
LIMIT 1) AS SecondHighestSalary;

/*learning:
#1. OFFSET SKIPS THE FIRST N
#2.IFNULL deals with NULL values
#3.IF SELECT STATEMENT IS USED AS AN EXPRESSION DONT FORGET TO USE PARANTHESIS 

/*MISTAKE TO REMEMBER:
IFNULL(expression, NULL) -->IF YOU ARE USING IFNULL, THE SELECT SHOULD RETURN ONE VALUE SINCE IT IS AN EXPRESSION
*
/*learning 2:
How to use subqueries: 
when to use denserank over rank
 */

