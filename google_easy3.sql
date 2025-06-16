/*
97. Which creators had more than one 5-minute monetized videos?
146
65%
Return the email address of creators who posted monetized videos with at least 5 minute duration more than once. Order in the ascending order of email.

group by
filter
having
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email
BLee3@hotmail.com
KRodriguez0@hotmail.com
MKim7@hotmail.com
WGuzman3@yahoo.com
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
select yu.email from youtube_videos yv
  JOIN youtube_users yu
  ON yv.user_id= yu.user_id
  WHERE duration_sec>=300
  GROUP BY yv.user_id, yu.email
  HAVING COUNT(yv.user_id)>1
  ORDER BY email
;