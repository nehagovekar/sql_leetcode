/*
78. Users with no activity & countries with activity
146
65%
Return the count of users with no activity, and the number of countries with EXACTLY 3 records for any given user(s) in the activity table. You have to return both numbers side by side in a single query. Think you can solve it?

join
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
no_activity	active_countries
21	4
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_search_activity	
event_id	bigint
session_id	bigint
user_id	bigint
website_id	bigint
creation_dt	timestamp
advertisement	bigint
event_type	varchar
google_search_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp
*/