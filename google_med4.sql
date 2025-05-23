/*
71. What percentage of videos had no likes or comments?
146
65%
What percentage of videos had no likes or comments in each category? Output the video category and the percentages. Round to 2 decimal places. Order by the ascending order of category.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
category	no_reaction_rate
blog	1.26
news	0
science & technology	0
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


with filtered AS
  (SELECT category, video_title, count(youtube_reactions.video_id) as cnt from youtube_videos
  LEFT JOIN (SELECT video_id from youtube_reactions where reactions in ('like','comment')) as youtube_reactions
  ON youtube_videos.video_id= youtube_reactions.video_id
  GROUP BY category, video_title)
SELECT category, ROUND(AVG(cnt),2) AS no_reaction_rate
FROM filtered
GROUP BY category
ORDER BY category;


