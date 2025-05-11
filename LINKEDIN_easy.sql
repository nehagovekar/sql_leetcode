/*
57. Who worked in Stripe, Uber or Meta?
146
65%
Among all users other than the UK, how many worked in Stripe, Uber, or Meta? Be careful of users who might have worked in a few of these places should you double count?

join
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_count
9
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
SELECT COUNT(DISTINCT(linkedin_emp_history.user_id)) AS user_count
FROM linkedin_emp_history
JOIN linkedin_users ON linkedin_users.user_id = linkedin_emp_history.user_id
WHERE LOWER(linkedin_emp_history.employment) IN ('stripe','uber','meta')
AND linkedin_users.country != 'UK';
