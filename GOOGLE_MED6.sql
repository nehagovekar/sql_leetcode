/*
93. Users who searched between 2 and 5 times
146
65%
Which users searched at least 2 times and at most 5 times? Output the emails of users sorted in asc order.

group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email
BLee3@hotmail.com
JDavis0@yahoo.com
RRamirez8@yahoo.com
SMcdonald3@gmail.com
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_maps_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp
google_maps_actions	
event_id	bigint
user_id	bigint
location_id	bigint
creation_dt	timestamp
event_type	varchar

*/
SELECT gmu.email FROM google_maps_users gmu 
  JOIN
  google_maps_actions gma
  ON gmu.user_id= gma.user_id
 WHERE event_type='search'
  GROUP BY  gmu.email
  HAVING count(event_type)>=2
  ORDER BY email asc;