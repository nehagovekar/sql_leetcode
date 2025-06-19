/*
User Experience Percentage
0:00:00

45
Question
Solution
My submissions
User submissions
Given a table called user_experiences, write a query to determine the percentage of users that held the title of "Data Analyst" immediately before holding the title "Data Scientist".

Immediate is defined as the user holding no other titles between the "Data Analyst" and "Data Scientist" roles.

Example:

Input:

user_experiences table

Column	Type
id	INTEGER
position_name	VARCHAR
start_date	DATETIME
end_date	DATETIME
user_id	INTEGER
Output:

Column	Type
percentage	FLOAT
*/
WITH multiple_experiences AS
(
    SELECT user_id, position_name,
    LAG(position_name) OVER (PARTITION BY user_id) AS prev_exp
    FROM user_experiences
),
filtered_users AS(
SELECT * FROM multiple_experiences
WHERE prev_exp='Data Analyst' and position_name='Data Scientist')
SELECT (SELECT COUNT(DISTINCT(user_id)) FROM filtered_users)/(SELECT COUNT(DISTINCT(user_id)) FROM user_experiences)
AS percentage;