/*
87. Who are the banned users?
146
65%
Find the usernames of all users who are permanently banned. Order by username asc

filter
join
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
username
EOrtega1
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_users_all	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_date	date
is_verified	boolean
banned_users	
user_id	bigint
banned_reason	varchar
banned_on	date
is_temporary	bigint

*/
SELECT username FROM fb_users_all
WHERE user_id= (SELECT user_id from banned_users where is_temporary=0);