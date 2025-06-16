/*
95. Multiple employment
146
65%
Among users of free and premium accounts in UK, France, and US, how many worked in more than one role? Be careful what you use for premium ;)

group by
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
num_users
8
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_emp_history	
user_id	bigint
employment	varchar
start_date	date
end_date	date
linkedin_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	date
account_type	varchar
*/
 WITH filtered_users AS(SELECT lu.user_id FROM linkedin_users lu 
  JOIN linkedin_emp_history leh 
  ON lu.user_id = leh.user_id
  WHERE country in ('UK', 'US','France') AND
  lu.account_type in ('premium career','premium business','free')
  GROUP BY lu.user_id
  HAVING COUNT(leh.employment)>1)

SELECT DISTINCT(COUNT(user_id)) AS num_users FROM filtered_users;