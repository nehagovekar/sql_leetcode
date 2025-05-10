/*
56. Percent of users who react since signing up?
146
65%
What % of the users liked or commented a video within 360 days after signing up? Round to 2 decimal points.

join
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
reaction_rate
6
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp
youtube_reactions	
event_id	bigint
session_id	bigint
user_id	bigint
video_id	bigint
reaction_dt	timestamp
reactions	varchar
*/
with data_filtered AS (SELECT youtube_users.user_id, reactions,
COALESCE(DATE_DIFF('days',youtube_users.signup_dt,youtube_reactions.reaction_dt),0) as days_difference
FROM youtube_users
JOIN youtube_reactions
ON youtube_users.user_id= youtube_reactions.user_id
WHERE reactions in ('like','comment'))
  
--SELECT COUNT(CASE WHEN days_difference<360 THEN 1 ELSE NULL END) FROM data_filtered;
SELECT ROUND((COUNT(*)/COUNT(CASE WHEN days_difference<360 THEN 1 ELSE NULL END)),2) as reaction_rate FROM data_filtered;