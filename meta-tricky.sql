/*
47. What is the percentage of reported posts removed
146
65%
Find the percentage of posts that are removed after being reported? Round you answer to 2 decimals.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
removal_rate
25.93
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_reported_posts	
reported_by	bigint
post_id	bigint
posted_by	bigint
reported_reason	varchar
risk_rating	varchar
reported_at	date
is_reviewed	bigint
is_removed	bigint

*/
SELECT ROUND(COUNT(DISTINCT(CASE WHEN is_removed=1 THEN post_id ELSE null END))/COUNT(DISTINCT(post_id))*100,2) as removal_rate FROM fb_reported_posts;
