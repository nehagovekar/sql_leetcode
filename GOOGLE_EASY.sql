/*
27. What is the global click through rate (CTR)?
146
65%
What is the global click through rate (CTR) of advertisement and non-advertisement link types? CTR = # of Clicked / # of Viewed in this scenario. Round conversion to the 2 decimal points and order by advertisement asc.

group by
case
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
advertisement	conversion_rate
0	0.41
1	0.5
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_search_activity	
event_id	bigint
session_id	bigint
user_id	bigint
website_id	bigint
creation_dt	timestamp
advertisement	bigint
event_type	varchar*/
SELECT advertisement,ROUND(SUM(CASE WHEN event_type='clicked' THEN 1 ELSE 0 END)/SUM(CASE WHEN event_type='viewed' THEN 1 ELSE 0 END),2) as conversion_rate from google_search_activity
GROUP BY advertisement;

  