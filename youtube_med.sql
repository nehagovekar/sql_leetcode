/*
94. Average number of days between new video uploads?
146
65%
What is the average number of in-between days of videos published per each creator? Output the creator username and average days. Impute missing average days with 0. Round to 2 decimal places. Order in the alphabetical order of username.

window
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
username	avg_days_between_two_videos
ALee6	0
BLee3	6.18
JDavis3	0
KRodriguez0	9.33
KSchwartz2	23
MKim7	7.64
MWalsh8	29
RBrown1	0
SMcdonald3	10
WGuzman3	6.56
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
WITH day_diff AS
(
  SELECT user_id, published_at,
  LAG(published_at) OVER (PARTITION BY user_id ORDER BY published_at) as lagging
FROM youtube_videos
  ORDER BY user_id, published_at
  )

SELECT yu.username, COALESCE(ROUND(AVG(DATEDIFF('days',dd.lagging,  dd.published_at)),2),0) AS avg_days_between_two_videos
  FROM day_diff dd
  JOIN youtube_users yu
  ON dd.user_id = yu.user_id
  GROUP BY yu.username
  ORDER BY yu.username ASC;