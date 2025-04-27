/*
easy
20. Joined prime within 5 days
146
65%
In each country, what is the percentage of users who enrolled on prime within 5 days (inclusive) after joining Amazon? Round to 2 decimal places and order the output by country asc.

datetime
group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
country	percentage
Australia	25
Brazil	7.69
China	14.29
France	20
UK	14.29
US	7.14
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
amazon_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	timestamp
prime_member	bigint
prime_joined_dt	timestamp

*/
SELECT country, ROUND(AVG(joined_within_5_days)*100,2) as percentage
FROM
(SELECT country, (CASE WHEN 
  datediff('days',joined_dt,prime_joined_dt)<=5 THEN 1 ELSE 0 END)as joined_within_5_days,
prime_joined_dt, joined_dt FROM amazon_users) prime_users 
GROUP BY country
ORDER BY country ASC;