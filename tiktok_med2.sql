/*
44. Who are the top viewers of content?
146
65%
You are a data scientist trying to identify segments of users. You are interested in determining who the top viewers are. Rank users based on number of clips they watch return the user(s) who are at the top 1 spot. Sort answer by username in asc order.

window
cte
subquery
group by
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_name	total_views
MGiles8	4
RGray6	4
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
tiktok_fct_views	
viewer_id	bigint
creator_id	bigint
view_ts	timestamp
device_type	varchar
viewed_to_completion	bigint
sound_id	bigint
has_promotion	bigint
tiktok_dim_users	
user_id	bigint
user_name	varchar
signup_ts	timestamp
country	varchar
suspicious_account	bigint
Show Solution
1
2
3
4
5
6
7
8
9
10
⌄
with ranking as (SELECT viewer_id, COUNT(view_ts) AS total_views,
  RANK() OVER ( ORDER BY COUNT(view_ts) desc) as rnk
 FROM tiktok_fct_views
  GROUP BY viewer_id)
SELECT tdu.user_name, r.total_views
FROM tiktok_dim_users tdu 
JOIN RANKING r 
ON tdu.user_id=r.viewer_id
WHERE rnk=1
ORDER BY tdu.user_name ASC;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (413ms)

Code SQL queries above and run them to see results in real time.
user_name	total_views
MGiles8	4
RGray6	4
Footer

*/