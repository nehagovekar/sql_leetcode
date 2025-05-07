/*
51. Website that received the most visits?
146
65%
Which website received the most visits as reflected by the clicks between 2022-01-01 and 2022-06-01? Output a single website url and click count sorted by click count desc.

join
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
url	click_count
www.leehartman.com	2
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

*/
with most_clicked as(SELECT website_id, COUNT(CASE WHEN event_type='clicked' THEN 1 ELSE NULL END) as click_count FROM google_search_activity
  where creation_dt between '2022-01-01' and '2022-06-01' 
  GROUP BY website_id
  ORDER BY click_count DESC
  LIMIT 1)
SELECT gsa.url, mc.click_count
FROM google_search_websites gsa 
JOIN most_clicked mc 
ON gsa.website_id=mc.website_id;