/*
89. Are there more full viewers?
146
65%
Find if there more viewers who are under or over the full view rate of the entire population.

math
case
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
over_count	under_count
19	15
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
⌄
WITH full_view_completion AS
  (SELECT COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/COUNT(*) as full_view_rate FROM tiktok_fct_views),
viewer_rate AS(
SELECT viewer_id, COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/COUNT(*) as viewer_rate, fvc.full_view_rate FROM tiktok_fct_views
CROSS JOIN full_view_completion fvc
GROUP BY viewer_id, fvc.full_view_rate)
SELECT COUNT(CASE WHEN viewer_rate>full_view_rate THEN 1 ELSE NULL END) as over_count,
COUNT(CASE WHEN viewer_rate<full_view_rate THEN 1 ELSE NULL END) as under_count
FROM viewer_rate;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (597ms)

Code SQL queries above and run them to see results in real time.
over_count	under_count
19	15
Footer

*/
WITH full_view_completion AS
  (SELECT COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/COUNT(*) as full_view_rate FROM tiktok_fct_views),
viewer_rate AS(
SELECT viewer_id, COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/COUNT(*) as viewer_rate, fvc.full_view_rate FROM tiktok_fct_views
CROSS JOIN full_view_completion fvc
GROUP BY viewer_id, fvc.full_view_rate)
SELECT COUNT(CASE WHEN viewer_rate>full_view_rate THEN 1 ELSE NULL END) as over_count,
COUNT(CASE WHEN viewer_rate<full_view_rate THEN 1 ELSE NULL END) as under_count
FROM viewer_rate;