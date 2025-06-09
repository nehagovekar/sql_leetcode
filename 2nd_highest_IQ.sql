/*
Write a SQL query to select the 2nd highest salary in the engineering department.

Note: If more than one person shares the highest salary, the query should select the next highest salary.

Example:

Input:

employees table

Column	Type
id	INTEGER
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
departments table

Column	Type
id	INTEGER
name	VARCHAR
Output:

Column	Type
salary	INTEGER
*/
WITH ranking AS
(SELECT id,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk, salary, department_id
FROM employees
)
SELECT salary from ranking r
JOIN departments d
ON r.department_id= d.id
where r.rnk =2 and d.name='engineering';
