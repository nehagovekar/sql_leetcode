/*
37. What is distribution on actions per post??
146
65%
Calculate the distribution of actions on posts. Order by actions asc.

math
Hint #1
How do you create a distribution? You count some counts right? Give it a try!

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
post_actions	no_instances
1	23
2	7
3	4
4	4
5	1
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_posts_actions	
post_id	bigint
user_id	bigint
action_datetime	timestamp
reaction_type	varchar

*/
WITH count_post as(
SELECT post_id, COUNT(*) as post_act  FROM fb_posts_actions group by 1)
SELECT post_act as post_actions, COUNT(post_id) as no_instances FROM count_post
GROUP BY 1
ORDER BY 1 ASC;