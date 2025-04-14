/*
6. What is the abandon view rate?
146
65%
Find the full abandon view rate of all viewers. That is, what is the percent of viewers who abandon before watching the whole video? Round your answer to 2 decimals.

math
Hint #1
Can you break abandon rate into its numerator and denominator?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
abandon_view_rate
60
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
2
3
4
5
6
⌄
SELECT 
  (COUNT(CASE WHEN viewed_to_completion=0 THEN 1 ELSE NULL END))*100/COUNT(*)  AS abandon_view_rate
  FROM tiktok_fct_views
  


Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (738ms)

Code SQL queries above and run them to see results in real time.
abandon_view_rate
60
Footer

*/
SELECT 
  (COUNT(CASE WHEN viewed_to_completion=0 THEN 1 ELSE NULL END))*100/COUNT(*)  AS abandon_view_rate
  FROM tiktok_fct_views
  

