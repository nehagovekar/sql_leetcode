/*
easy
14. The average time to activate prime
146
65%
What is the average time in days it takes for a user to enroll in prime after creating an account? Ignore users who never joined prime. Round to 2 decimal places.

datetime
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
avg_days_to_join
7.88
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
SELECT AVG(DATEDIFF('days',joined_dt,prime_joined_dt)) as avg_days_to_join FROM amazon_users;