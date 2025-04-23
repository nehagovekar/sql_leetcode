/*
15. Duration of monetized & non-monetized videos among certain users?
146
65%
What is the average video duration in minutes of monetized videos and non-monetized videos among users in UK, Australia, and US? Output the monetization type and average duration in minutes. Round duration to the 2 decimal points.

join
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
is_monetized	avg_video_duration
0	5.28
1	5.75
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
youtube_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp

*/
SELECT yv.is_monetized, ROUND(AVG(yv.duration_sec/60),2) AS avg_video_duration
FROM youtube_videos yv 
JOIN youtube_users yu
ON yv.user_id=yu.user_id
WHERE yu.country IN ('UK', 'Australia', 'US')
GROUP BY is_monetized;