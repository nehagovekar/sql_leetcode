/*
31. Full view rate by sound?
146
65%
Find the full view rate for each sound. That is what is the percent of views are watched to completion for each sound? Round answer to 2 decimals and sort by view rate desc, sound asc

math
case
join
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
sound_name	full_view_rate
Sunroof	100
Oh No	75
Steven Univer	75
No Idea	66.67
The Insider	60
TWINNEM	50
First Class	25
My Name Is	25
Still Dont Know My Name	25
Rompe	20
As it Was	0
GOODMORNINGTOKYO!	0
Love You So	0
Monkeys Spinning Monkeys	0
Spongebob Tomfoolery Dante9k Remix	0
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
tiktok_fct_views	
viewer_id	bigint
creator_id	bigint
view_ts	timestamp
device_type	varchar
viewed_to_completion	bigint
sound_id	bigint
has_promotion	bigint
tiktok_dim_sounds	
sound_id	bigint
sound_name	varchar
sound_created_by	varchar
first_used_date	timestamp
day7reach	bigint

*/
SELECT tfs.sound_name as sound_name, ROUND(avg(tfv.viewed_to_completion)*100,2) as full_view_rate FROM 
  tiktok_dim_sounds tfs 
  JOIN tiktok_fct_views tfv
  ON tfs.sound_id= tfv.sound_id
  GROUP BY tfs.sound_name
  ORDER BY full_view_rate DESC, 1 ASC;