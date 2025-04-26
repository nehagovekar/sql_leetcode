/*
18. Websites with users, but no conversions?
146
65%
Which websites had users who clicked, but never had any users who converted? Output the url of the websites sorted in the alphabetical order.

join
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
url
www.davisflynnandwatson.com
www.leehartman.com
www.wallaceplc.gov
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
WITH clicked_users AS
(
  SELECT DISTINCT(website_id), event_type from google_search_activity
  WHERE event_type='clicked'
),
  clicked_converted_users AS
  (
  SELECT website_id, event_type
  FROM google_search_activity gsa
  WHERE website_id in ( select cu.website_id from clicked_users cu)
  and gsa.event_type='converted'
  ),
   websites AS(
SELECT cu.website_id FROM clicked_users cu
where cu.website_id NOT IN (SELECT ccu.website_id FROM clicked_converted_users ccu)
  )
SELECT url from google_search_websites
where website_id in (SELECT website_id FROM websites)
  ORDER BY url;