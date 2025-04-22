/*
12. Among videos with duration > 5 min, how many unique users watched per video?
146
65%
Among videos with duration > 5 min, how many unique users watched per video? Output the video_id and count. Order by number of distinct viewers desc and video id asc

group_by
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
video_id	number_of_distinct_users
1	5
3	4
7	3
9	3
11	2
12	2
4	1
15	1
19	1
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_reactions	
event_id	bigint
session_id	bigint
user_id	bigint
video_id	bigint
reaction_dt	timestamp
reactions	varchar
youtube_videos	
video_id	bigint
is_monetized	bigint
video_title	varchar
channel	varchar
user_id	bigint
category	varchar
published_at	timestamp
duration_sec	bigint

*/
-- Check which table you need when it seems easy
WITH selected_videos AS
(SELECT video_id, COUNT(DISTINCT(user_id))  as number_of_distinct_users
  FROM youtube_reactions
  WHERE video_id in (SELECT video_id from youtube_videos where duration_sec>300)
  GROUP BY 1
  ORDER BY 2 DESC, 1 ASC
  )
SELECT * FROM selected_videos;