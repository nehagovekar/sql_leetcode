/*
74. What is the full view rate?
146
65%
Find the full view rate of all viewers. That is what is the percent of views that are watched to completion? Round answer to 2 decimals.

math
case
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
full_view_rate
40
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
Show Solution
1
  SELECT COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/(COUNT(*) ) AS full_view_rate FROM tiktok_fct_views;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (512ms)

Code SQL queries above and run them to see results in real time.
full_view_rate
40
Footer
Subscribe to our newsletter
The latest news, articles, and resources, sent to your inbox weekly.

Email address
*/

  SELECT COUNT(CASE WHEN viewed_to_completion=1 THEN 1 ELSE NULL END)*100/(COUNT(*) ) AS full_view_rate FROM tiktok_fct_views;