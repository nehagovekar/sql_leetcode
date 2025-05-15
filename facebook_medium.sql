/*
med
62. Whats the content generation for Jan on Facebook?
146
65%
You're on the content team at Meta and are asked to prepare a prettyifed report for leadership breaking down the counts of each post type for the month of January 2022.

case
datetime
group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
mon_yr	posts	ads	video	photos	polls
2022-Jan	0	1	0	2	0
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_posts	
post_id	bigint
user_id	bigint
creation_date	timestamp
post_type	varchar

*/


SELECT
  strftime('%Y-%b', creation_date) as mon_yr,
  COUNT(CASE WHEN post_type='post' THEN 1 ELSE NULL END) as posts,
  COUNT(CASE WHEN post_type='ad' THEN 1 ELSE NULL END) as ads,
  COUNT(CASE WHEN post_type='video' THEN 1 ELSE NULL END) as video,
  COUNT(CASE WHEN post_type='photo' THEN 1 ELSE NULL END) as photos,
  COUNT(CASE WHEN post_type='poll' THEN 1 ELSE NULL END) as polls
FROM fb_posts
WHERE creation_date>='2022-01-01' AND creation_date<'2022-02-01'
GROUP BY strftime('%Y-%b', creation_date);
