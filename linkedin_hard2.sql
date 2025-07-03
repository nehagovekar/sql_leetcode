/*
99. How many posts with at least two repeats?
146
65%
A job post is considered as a repeat if it was reposted within 30 days. Which posts had a repeat? Return answer sorted by post id asc.

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

WITH lag_date AS 
(
  SELECT post_id,
  post_date,
  LAG(post_date) OVER (PARTITION BY post_id ORDER BY post_date) as lag_date
  FROM linkedin_job_posts
  GROUP BY post_id, post_date
  ORDER BY post_id

)
SELECT DISTINCT(post_id)  FROM lag_date
GROUP BY post_id, lag_date, post_date
HAVING DATEDIFF('days',lag_date,post_date)<=30
ORDER BY post_id ASC;