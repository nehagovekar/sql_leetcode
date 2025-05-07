/*
easy
48. Find the click-through-rate (CTR) per each website type
146
65%
You are on the Digital Marketing team at Google. You are asked to find what is the click-through-rate, (CTR), per each website type? CTR = # of Clicked / # of Viewed. Be sure to use the 'event_type' column for this one and not the 'conversion' column, our data engineer said theres some bugs in this one. Round to 2 decimal places. Output answer sorted by type asc.

group by
case
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
type	conversion_rate
blog	0.67
business	0
forum	0.6
government	0.33
nonprofit	0
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_search_activity	
event_id	bigint
session_id	bigint
user_id	bigint
website_id	bigint
creation_dt	timestamp
advertisement	bigint
event_type	varchar
google_search_websites	
website_id	bigint
url	varchar
type	varchar
Show Solution
1
2
3
4
5
⌄
SELECT gsw.type, ROUND(COUNT(CASE WHEN event_type='clicked' THEN 1 ELSE NULL END)/COUNT(CASE WHEN event_type='viewed' THEN 1 ELSE NULL END),2) as conversion_rate FROM google_search_activity gsa 
  JOIN google_search_websites gsw 
  USING (website_id)
GROUP BY gsw.type
ORDER BY gsw.type;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (510ms)

Code SQL queries above and run them to see results in real time.
type	conversion_rate
blog	0.67
business	0
forum	0.6
government	0.33
nonprofit	0
Footer

*/