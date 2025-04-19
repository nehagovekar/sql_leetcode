/*
26. What is the reason most posts are reported? Pt 2
146
65%
Find the #1 reason why posts are reported and return its percentage of posts rounded to 2 decimals. Sort by percent desc and reason asc. Return ONLY 1 Row.

math
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
reported_reason	report_rate
spam	56
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
WITH highest_Reason as
  (SELECT reported_reason, ROUND((COUNT((reported_reason))/
  (SELECT COUNT((post_id)) FROM fb_reported_posts)*100),2) as report_rate FROM fb_reported_posts
  group by 1
  ORDER BY report_rate DESC, 1 ASC
  LIMIT 1
)
SELECT * from highest_Reason;


