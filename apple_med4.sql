/*
69. Average days between apple sign-ups
146
65%
What is the average days between apple account sign-ups? Round to 2 decimal places.

join
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
avg_days_between_signups
0.61
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
apple_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	date

*/
with day_between AS
(SELECT joined_dt,
  LAG(joined_dt) OVER (ORDER BY joined_dt) AS PREV_DATE
  from apple_users)
SELECT ROUND(AVG(DATEDIFF('DAY',PREV_DATE,joined_dt)),2) as avg_days_between_signups FROM day_between;