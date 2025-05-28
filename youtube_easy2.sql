/*
66. Youtube like and comments per day.
146
65%
Get the like and comment counts per day. Output the date, reaction type, and count sorted by date asc and reaction type asc. It's okay if some of the dates are missing.

group by
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
reaction_date	reaction_type	total_likes	total_comments
2022-04-18T00:00:00	like	1	0
2022-04-27T00:00:00	comment	0	1
2022-06-01T00:00:00	like	1	0
2022-06-14T00:00:00	comment	0	3
2022-06-22T00:00:00	like	1	0
2022-07-08T00:00:00	like	1	0
2022-07-21T00:00:00	comment	0	1
2022-08-05T00:00:00	comment	0	1
2022-08-05T00:00:00	like	1	0
2022-08-17T00:00:00	comment	0	1
2022-09-28T00:00:00	comment	0	1
2022-09-28T00:00:00	like	1	0
2022-10-05T00:00:00	like	2	0
2022-10-12T00:00:00	comment	0	1
2022-10-12T00:00:00	like	1	0
2022-10-26T00:00:00	comment	0	1
2022-10-26T00:00:00	like	1	0
2022-11-11T00:00:00	comment	0	2
2022-11-19T00:00:00	comment	0	1
2022-11-19T00:00:00	like	1	0
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_reactions	
event_id	bigint
session_id	bigint
user_id	bigint
video_id	bigint
reaction_dt	timestamp
reactions	varchar

*/

SELECT DATE_trunc('day',reaction_dt) as reaction_date, reactions as reaction_type,
COUNT(CASE WHEN reactions='like' THEN 1 ELSE NULL END) AS total_likes,
COUNT(CASE WHEN reactions='comment' THEN 1 ELSE NULL END) AS total_comments
FROM youtube_reactions
WHERE reactions in ('like','comment')
GROUP BY reaction_date,reactions
ORDER BY reaction_date ASC, reaction_type ASC;
