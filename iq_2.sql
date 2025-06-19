/*
Suppose your company needs to cut costs due to an economic downturn. During a coffee break, you hear a rumor that a lot of money goes to employees who don’t do their work, and you decide to find out if the rumor is true.

Given two tables: employees and projects, find the sum of the salaries of all the employees who didn’t complete any of their projects.

Clarification:

We will consider a project unfinished if it has no end date (its End_dt is NULL).

Given this, we’ll say an employee didn’t finish any of their projects when:

They were assigned at least one project.
None of their projects have an End_dt.
Example:

Input:

employees table

id	salary
INTEGER	FLOAT
projects table

employee_id	project_id	Start_dt	End_dt
INTEGER	INTEGER	DATETIME	DATETIME
Output:

total_slack_salary
INTEGER
*/
WITH filtered_user_info as 
(SELECT employee_id, COUNT(project_id) as cnt_project, COUNT(End_dt) as end, End_dt
FROM projects
GROUP BY employee_id
HAVING COUNT(project_id)>=1)
SELECT SUM(salary) AS total_slack_salary
FROM employees
JOIN filtered_user_info
ON employees.id = filtered_user_info.employee_id
WHERE end=0 and cnt_project>=1;