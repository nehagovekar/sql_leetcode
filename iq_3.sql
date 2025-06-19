/*
Let’s say you’re working in HR at a major tech company, and they ask you to find employees with a high probability of leaving the company. They tell you these employees perform well but have the lowest pay.

Given two tables, employees and projects, find the five lowest-paid employees who have completed at least three projects.

Note: We consider projects to be completed when they have an end date, which is the same as saying their End_dt is not NULL.

Example:

Input:

employees table

id	salary
INTEGER	FLOAT
projects table

employee_id	project_id	Start_dt	End_dt
INTEGER	INTEGER	DATETIME	DATETIME
Output:

employee_id
INTEGER
Recommended questions for you
Personalized based on your user activity, skill level, and preferences.

.
.
.
.
.
Editor
Stats
Details


123456789
with emp as (SELECT employee_id, COUNT(project_id) as cnt FROM projects 
WHERE End_dt is NOT NULL
GROUP BY employee_id)
SELECT employee_id FROM employees
JOIN emp
ON employees.id = emp.employee_id
WHERE cnt>=3
ORDER BY employees.salary ASC
limit 5;
Use Shift + Enter to run
All test cases passed, good job!
Total tests: 1
Passed: 1
Failed: 0
Your code output
employee_id
4
3
7
2
5
Expected output
employee_id
4
3
7
2
5
Test Input
employees
projects
id	salary
1	35000
2	65000
3	40000
4	25000
5	80000
6	60000
7	55000
8	95000
9	100000
10	45000
11	70000
12	105000
Execution time: 421 ms.
Want feedback on your solutions?
Get tailored mentorship to ace your interview by our 5⭐ coaches with over 15 years of experience.

feature
Candidates have a 45% higher job success after one coaching session



Comments












Format Code
``` sql
SELECT *
FROM table1 AS tb1
INNER JOIN table2 AS tb2
	ON tb1.id = tb2.id
LIMIT 1
```
Preview
SELECT *
FROM table1 AS tb1
INNER JOIN table2 AS tb2
	ON tb1.id = tb2.id
LIMIT 1
Write at least 8 words to submit a comment. Word count: 0.


cindyjeon0721
I did not use join here

SELECT id AS employee_id
FROM employees
WHERE id in (SELECT employee_id
                FROM projects
                GROUP BY employee_id
                HAVING COUNT(End_dt) >=3)
ORDER BY salary ASC
LIMIT 5
8 months ago
4
mehul.jain.codedev
@cindyjeon0721 Yeah, this question needs more test cases

13 days ago
1
0 replies
edchang1992
SELECT
    p.employee_id
FROM
    projects p
INNER JOIN
    employees e on e.id = p.employee_id
WHERE
    p.end_dt IS NOT NULL
GROUP BY
    e.id
HAVING
    COUNT(DISTINCT p.project_id) >= 3
ORDER BY
    e.salary ASC
LIMIT 5;
2 years ago
4
elifguler524
@edchang1992 I did not understand, since one employee can have more than one project, doesn’t the salary column get duplicated in this query?

7 months ago
1
JuanMon6213
@elifguler524

Not really. When you do the join, the salary does get duplicated. Nonetheless, when you do the groupby given the employee_id, you get the unique value of the salary of that employee.

6 months ago
1
0 replies
subharthisaha1999
Keep it simple - intuitive code

SELECT p.employee_id
FROM employees e
JOIN projects p
ON e.id = p.employee_id
WHERE p.End_dt IS NOT NULL
GROUP BY p.employee_id
HAVING COUNT(p.project_id) >= 3
ORDER BY salary ASC
LIMIT 5
(PS: if there are any errors you see reply to the comment!)

1 year ago
2
0 replies
mousamdeyhkn
Filtering Data from Employees table by putting condition from Projects table
SELECT id AS employee_id
FROM Employees
WHERE id in
    (SELECT employee_id
     FROM Projects
     WHERE End_dt IS NOT NULL
     GROUP BY employee_id
     HAVING count(project_id) >= 3)
ORDER BY salary ASC
LIMIT 5
Using Inner Join
select id as employee_id from employees e inner join projects p on e.id = p.employee_id where End_dt is not NULL group by id having count(project_id) >= 3 order by salary asc limit 5

1 year ago
2
0 replies
karthikreddy.abbz
An another approach, but I recommend using GROUP BY useful in case if wants to solve it by ROW_numebr


WITH emp_project as (
    SELECT 
        *,
        ROW_NUMBER() OVER(partition by pro.employee_id order by emp.salary  ASC) as projectCnt
    FROM employees emp 
    JOIN projects pro 
    ON emp.id = pro.employee_id 
    WHERE pro.End_dt is not NULL
)

SELECT 
    distinct id as employee_id
FROM emp_project 
WHERE projectCnt >=3 
8 months ago
1
0 replies
yasmina
SELECT 
    employee_id FROM employees
INNER JOIN projects
ON 
    projects.employee_id=employees.id
GROUP BY 
    id
HAVING 
    COUNT(End_dt)>=3 
ORDER BY 
    salary ASC
LIMIT 5
2 years ago
2
0 replies
mjgall
SELECT employee_id
FROM projects p
JOIN employees e ON p.employee_id = e.id
WHERE End_dt IS NOT NULL
GROUP BY 1
HAVING COUNT(project_id) > 2
ORDER BY e.salary
LIMIT 5;
9 months ago
1
0 replies
nopeeee
SELECT 
    emp.id as employee_id

FROM employees emp 
JOIN projects proj 
ON emp.id = proj.employee_id

GROUP BY 1
HAVING COUNT(end_dt) >= 3
ORDER BY salary

LIMIT 5
2 years ago
2
0 replies
alicex3x
with c as ( SELECT a.id, a.salary, b.project_id, b.start_dt, b.end_dt from employees a left join projects b on a.id = b.employee_id where b.end_dt is not null),

d as ( select distinct id, salary, count(distinct project_id) as projects from c group by 1,2 having count(distinct project_id) >=3 order by 2 asc limit 5)

select distinct id as employee_id from d order by salary asc

11 months ago
1
0 replies
SamDough
SELECT e.id employee_id
FROM projects p
INNER JOIN employees e ON p.employee_id = e.id
WHERE end_dt IS NOT NULL
GROUP BY 1
HAVING count(DISTINCT project_id)>=3
ORDER BY salary
LIMIT 5
11 months ago
1
0 replies
nyadag
First, listed out all employee ids and their #projects completed, and have put them in a Temp table

WITH CTE AS ( SELECT employee_id , COUNT(DISTINCT project_id) AS num_projects FROM projects WHERE end_dt IS NOT NULL GROUP BY employee_id )

Using a where statement filtered out all employee ids with highest number of projects completed, and with least salary, listed only 5 records from the result using LIMIT statement

SELECT id as employee_id FROM employees WHERE id IN ( SELECT employee_id FROM CTE WHERE num_projects >= 3 ORDER BY num_projects DESC ) ORDER BY salary ASC limit 5

1 year ago
1
0 replies
so_hyun.kim
WITH CTE_Employee AS ( SELECT employee_id, COUNT(DISTINCT project_id) AS number_projects FROM projects WHERE End_dt IS NOT NULL GROUP BY employee_id)

SELECT e.id FROM employees e INNER JOIN projects p ON e.id = p.employee_id WHERE e.id IN (SELECT employee_id FROM CTE_Employee WHERE number_projects >= 3) ORDER BY e.salary ASC LIMIT 5

1 year ago
1
0 replies
eggnog-soda-772
WITH completed_at_least_three_proj AS (
    SELECT
        employee_id
    FROM
        projects
    WHERE 
        End_dt IS NOT NULL
    GROUP BY 
        employee_id
    HAVING
        COUNT(DISTINCT project_id) >= 3
),

employee_salary AS (
    SELECT 
        employee_id,
        salary,
        RANK() OVER (ORDER BY salary ASC) AS salary_rank
    FROM 
        employees
    INNER JOIN 
        completed_at_least_three_proj
    ON 
        employee_id = id
)

SELECT
    employee_id
FROM 
    employee_salary
WHERE
    salary_rank <= 5

1 year ago
1
0 replies
veron-1
with employees_summary as (SELECT employees.id as employee_id, employees.salary, count(projects.project_id) as projects_num FROM employees 
join projects on employees.id=projects.employee_id
where projects.End_dt is not null
group by employees.id
having 	projects_num>2
order by employees.salary asc 
limit 5)

select employee_id from employees_summary
1 year ago
1
0 replies
ashley.yue117
WITH cte AS (
    SELECT
        employee_id
    FROM projects
    GROUP BY employee_id
    HAVING COUNT(End_dt) >= 3
)
SELECT 
    DISTINCT employee_id
FROM cte c 
    INNER JOIN employees e ON c.employee_id = e.id
ORDER BY salary DESC
LIMIT 5;
1 year ago
1
0 replies
nate-xmsg-2007
with cte as ( SELECT employee_id, count(*) as countp FROM projects where NOT End_dt = NULL group by employee_id having countp > 2 ) SELECT id as employee_id from employees as e where e.employee_id in cte.employee_id order by salary asc limit 5

1 year ago
1
0 replies
danila
SELECT DISTINCT(employee_id) FROM employees e
RIGHT JOIN projects p ON e.id = p.employee_id
WHERE p.employee_id in (SELECT employee_id as cnt FROM employees e
RIGHT JOIN projects p ON e.id = p.employee_id
WHERE p.End_dt IS NOT NULL
GROUP BY employee_id
HAVING COUNT(employee_id) >= 3 )
order by salary
1 year ago
1
0 replies
mickeyBee

SELECT 
    employee_id
FROM(SELECT 
       employee_id,
       MIN(salary) AS minimum_salary,
       COUNT(project_id) AS nr_of_projects
     FROM employees AS e
     JOIN projects AS p
        ON e.id = p.employee_id
     WHERE End_dt IS NOT NULL
     GROUP BY 1
     HAVING COUNT(project_id) >= 3
     ORDER BY minimum_salary ASC
     LIMIT 5) AS sub;
1 year ago
1
0 replies
hertan06
with at_least_3_projects as (
select p.employee_id, count(*) proj_count from projects p where p.End_dt is not null 
group by p.employee_id having count(*) >=3
)

select e.id employee_id from at_least_3_projects a, employees e 
where a.employee_id = e.id order by e.salary asc limit 5 
1 year ago
1
0 replies
andresjulianperezpinto
SELECT employees.id AS employee_id
FROM employees
LEFT JOIN projects ON employees.id = projects.employee_id
WHERE projects.Start_dt IS NOT NULL AND projects.End_dt IS NOT NULL
GROUP BY employees.id, employees.salary
HAVING COUNT(projects.project_id) >= 3
ORDER BY employees.salary ASC
LIMIT 5;
1 year ago
1
0 replies
basudab
id AS employee_id

FROM employees 
WHERE id IN (
    SELECT 
employee_id
 FROM projects  
 GROUP BY employee_id
 HAVING COUNT(DISTINCT CASE WHEN End_dt IS NOT NULL THEN project_id END) > 2

)
ORDER BY salary ASC;
1 year ago
1
0 replies
deepanshsingh8
Select p.employee_id
from projects as p join employees as e
on p.employee_id = e.id
where (p.End_dt is not Null)
group by p.employee_id
having count(p.project_id)>=3
order by e.salary asc
limit 5

1 year ago
1
0 replies
zeke-seafoam-3303
SELECT 
    e.id as employee_id
    FROM employees e 
    JOIN projects p 
        on e.id = p.employee_id 
group by e.id 
having count(end_dt) >= 3 
order by salary asc 
limit 5 
1 year ago
1
0 replies
salavooddeen11047@gmail.com
select employee_id from projects where End_dt is not null group by employee_id having count(project_id) >= 3

I got expected output by the above query, Is my approcah correct? any suggestions would be appreciated.

1 year ago
1
0 replies
pavansuri0105
with cte1 as
 (
 SELECT e.id,
 e.salary,
 sum(case when p.End_dt is not null then 1 else 0 end) as project_cnt
  FROM employees as e 
 inner join projects as p 
 on e.id=p.employee_id
 group by 1,2
 )
, cte2 as
(
 select
 id, 
 salary, 
 project_cnt,
 Dense_Rank() over(partition by id order by salary ASC) as rank_1
 from cte1
 having project_cnt>=3
)

select id as employee_id
from cte2
where rank_1 <=5
2 years ago
1
0 replies
asc647
with completed as (select 
employee_id
,count(distinct project_id) as completions
from projects
where end_dt is not null
group by 1)

select distinct
employee_id

from completed c
join employees e on c.employee_id = e.id and completions >= 3

order by salary 
limit 5


2 years ago
1
0 replies
manpreetsinghmessi
Use distinct in case multiple employees work on same project

 with cte1 as (SELECT e.id,count( p.project_id) as pcount FROM employees e
 inner join projects p 
 on e.id=p.employee_id
 where p.end_dt is not null
 group by e.id
 having pcount >=3 )
 select cte1.id as employee_id from cte1 
 inner join employees e 
 on e.id=cte1.id
 order by salary asc


2 years ago
1
0 replies
tanvi-1
with cte as(
select id,
project_id,
Rank() over (order by salary) as rnk
from employees e left join projects p 
on e.id = p.employee_id
where End_dt is not null
group by id
having count(project_id) >= 3)


select id as employee_id from 
cte 
where rnk <=5`
2 years ago
1
0 replies
group-glass-1929
SELECT employee_id FROM projects WHERE end_dt IS NOT NULL GROUP BY employee_id HAVING COUNT(DISTINCT project_id) >= 3 LIMIT 5

2 years ago
0
0 replies



*/
with emp as (SELECT employee_id, COUNT(project_id) as cnt FROM projects 
WHERE End_dt is NOT NULL
GROUP BY employee_id)
SELECT employee_id FROM employees
JOIN emp
ON employees.id = emp.employee_id
WHERE cnt>=3
ORDER BY employees.salary ASC
limit 5;