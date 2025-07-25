/*
98. Creators who published & liked at least two videos?
146
65%
Which creators published at least two videos and liked at least two videos? Output results sorted userid ascending.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_id
4
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_videos	
video_id	bigint
is_monetized	bigint
video_title	varchar
channel	varchar
user_id	bigint
category	varchar
published_at	timestamp
duration_sec	bigint
youtube_reactions	
event_id	bigint
session_id	bigint
user_id	bigint
video_id	bigint
reaction_dt	timestamp
reactions	varchar
*/
WITH like_users AS(
  SELECT user_id, COUNT(CASE WHEN reactions='like' THEN 1 ELSE NULL END) AS cnt FROM youtube_reactions
  WHERE user_id in (SELECT user_id 
  FROM youtube_videos
  GROUP BY user_id
  HAVING COUNT(published_at)>=2)
  GROUP BY user_id
)
SELECT user_id from like_users
  WHERE cnt>=2;