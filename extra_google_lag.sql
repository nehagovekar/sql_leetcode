/*
1. Average trip duration per zip code?
146
65%
Among users who signed_up after January 1, 2021, what is the average time in minutes between start trip and end trip for each final destination of zip code? Order by zip code asc and round to 2 decimal places.

group by
join
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
zip_code	avg_trip_time
15360	143
18170	61
29522	29
32277	135
47746	103
50921	54
52508	113
62413	47
64662	106
70271	144
78393	111
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_maps_locations	
location_id	bigint
landmark_name	varchar
zip_code	bigint
zone	varchar
google_maps_trips	
event_id	bigint
user_id	bigint
location_id	bigint
creation_dt	timestamp
event_type	varchar
google_maps_users	
user_id	bigint
username	varchar
first_name	varchar
last_name	varchar
email	varchar
country	varchar
signup_dt	timestamp
Show Solution
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
⌄
WITH selected_users AS
(
  SELECT user_id, signup_dt FROM google_maps_users
  WHERE signup_dt > date '2021-01-01'
),
start_end_trip AS
(SELECT su.user_id, gmt.creation_dt, gmt.event_type, gml.zip_code,
  LAG(gmt.creation_dt) OVER (PARTITION BY su.user_id ORDER BY gmt.creation_dt) AS prev_date,
  LAG(gmt.event_type) OVER (PARTITION BY su.user_id ORDER BY gmt.creation_dt) AS prev_event
  FROM selected_users su 
  JOIN google_maps_trips gmt ON gmt.user_id=su.user_id
  JOIN google_maps_locations gml ON gmt.location_id=gml.location_id
  )

SELECT zip_code, ROUND(AVG(datediff('minute',prev_date, creation_dt)),2) AS avg_trip_time FROM 
   start_end_trip 
  WHERE event_type='end trip' and prev_event='start trip' 
  GROUP BY zip_code
  ORDER BY zip_code;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (722ms)

Code SQL queries above and run them to see results in real time.
zip_code	avg_trip_time
15360	143
18170	61
29522	29
32277	135
47746	103
50921	54
52508	113
62413	47
64662	106
70271	144
78393	111
Footer

*/
