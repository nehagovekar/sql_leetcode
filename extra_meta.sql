/*
2. What is the trend in each report reason?
146
65%
Find the number of posts reported each month by each reason in 2022, you can leave duplicates in since we are interested in volumes. Return answer sorted by reason asc and month asc. Be careful the months are in order! Good luck!

datetime
Hint #1
How do you get a custom date format in sql?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
mon_yr	reported_reason	posts_reported
2022-Mar	bullying	3
2022-Jun	bullying	2
2022-Aug	bullying	1
2022-Sep	bullying	1
2022-May	crime	1
2022-Jul	crime	2
2022-Nov	crime	1
2022-Mar	explicit_content	3
2022-Apr	explicit_content	2
2022-Jul	explicit_content	1
2022-Sep	explicit_content	1
2022-Dec	explicit_content	1
2022-Jan	fake_news	1
2022-Jun	fake_news	1
2022-Sep	fake_news	1
2022-Jan	spam	2
2022-Feb	spam	2
2022-Mar	spam	3
2022-Apr	spam	2
2022-May	spam	3
2022-Jun	spam	2
2022-Jul	spam	4
2022-Aug	spam	2
2022-Sep	spam	1
2022-Oct	spam	1
2022-Nov	spam	4
2022-Dec	spam	2
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
WITH report AS(SELECT
month(reported_at) as mon,
strftime('%Y-%b',reported_at) as mon_yr,
Reported_reason,
COUNT(reported_by) as posts_reported
FROM fb_reported_posts
WHERE strftime('%Y', reported_at)='2022'
GROUP BY
1,2,3)
SELECT mon_yr, Reported_reason,posts_reported
FROM report
ORDER BY Reported_reason ASC, mon ASC;
