/*
79. How many posts have been posted just once?
146
65%
How many job posts on Linkedin have been posted just once? Return the total number of single posts.

group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
num_unique_post
20
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_job_posts	
event_id	bigint
post_id	bigint
post_date	date
company_id	bigint
company	varchar
*/

WITH posts AS(SELECT post_id, count(post_id) as cnt
FROM linkedin_job_posts
GROUP BY post_id)
SELECT COUNT(DISTINCT(post_id)) as num_unique_post from posts
WHERE cnt=1;