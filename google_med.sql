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
