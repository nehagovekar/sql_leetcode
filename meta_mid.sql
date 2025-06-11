/*
90. What is the reason most posts are reported?
146
65%
Find the percentage of posts that are reported by each reason. Round you answer to 2 decimals and sort by percent desc reason asc.

metric
Hint #1
How do you count everything and then count by reason?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
reported_reason	report_rate
spam	56
explicit_content	16
bullying	14
crime	8
fake_news	6
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
SELECT reported_reason, count(reported_by)*100/(SELECT COUNT(*) FROM fb_reported_posts) as report_rate FROM fb_reported_posts
  GROUP BY reported_reason
  ORDER BY report_rate DESC;