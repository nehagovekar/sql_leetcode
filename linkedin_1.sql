/*
8. How many distinct repeat posts?
146
65%
You're a DS on the integirty team at Linkedin and interested in detecting duplicative posts for review. A post is considered as a repeat if it was reposted within 30 days of prior post. Find all the unique posts which had repeats? Order results by post_id asc.

window
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
post_id
12
22
53
71
72
84
92
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_job_posts	
event_id	bigint
post_id	bigint
post_date	date
company_id	bigint
company	varchar

*/
with repeat_post AS
(SELECT post_id,post_date,
  LAG(post_date) OVER (PARTITION BY post_id ORDER BY post_date) as lag_date,
  FROM linkedin_job_posts)
SELECT DISTINCT(post_id) FROM repeat_post
  WHERE (post_date-lag_date)<30
  ORDER BY post_id asc;