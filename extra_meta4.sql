/*
25. Who is the top poster?
146
65%
Find the top poster(s) on Facebook and count how many of each post type they had. Please consider ties and return all users if tie exists. Order answer by creator asc and post type asc.

filter
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
creator	post_type	total_posts
2	ad	1
2	poll	1
2	post	1
2	video	2
8	ad	1
8	poll	2
8	post	2
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_posts	
post_id	bigint
user_id	bigint
creation_date	timestamp
post_type	varchar
*/
with post_per_user AS(SELECT user_id, COUNT(post_id) as post_count FROM fb_posts
  GROUP BY user_id
  ORDER BY post_count DESC),
ranking AS
(SELECT user_id as creator,
RANK() OVER (ORDER BY post_count DESC) as rnk
FROM post_per_user
)
SELECT r.creator, f.post_type, COUNT(f.post_type) as total_posts FROM ranking r
JOIN fb_posts f 
ON  r.creator=f.user_id
  WHERE rnk=1
  GROUP BY 1,2
  ORDER BY r.creator asc, f.post_type asc;

  with user_info as (SELECT user_id,COUNT(post_type) AS cnt
  FROM fb_posts
  GROUP BY user_id
  ORDER BY user_id),
ranking as 
  (
  SELECT user_id,
  DENSE_RANK() OVER (order BY cnt  DESC) as rnk
  FROM user_info
  )
SELECT user_id as creator, post_type, COUNT(post_type) as total_posts FROM fb_posts
  WHERE user_id in (SELECT user_id from ranking WHERE rnk=1)
  GROUP BY creator, post_type
  ORDER BY creator ASC, post_type ASC
  ;
