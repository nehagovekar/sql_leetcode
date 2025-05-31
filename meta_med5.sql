/*
85. What is the percentage of posts that received a like of comment?
146
65%
Find the percentage of posts that receive a like or comment raction type. Round your answer to 2 decimials.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
like_commnt_rate
56.41
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_posts_actions	
post_id	bigint
user_id	bigint
action_datetime	timestamp
reaction_type	varchar
*/

SELECT ROUND
  ((COUNT(DISTINCT CASE WHEN reaction_type in ('like', 'comment') THEN post_id ELSE NULL END)*100)/
 (COUNT(DISTINCT(post_id))),2)
AS like_commnt_rate
FROM fb_posts_actions;