/*
med
30. Which zip codes are popular destinations?
146
65%
Which three zip codes are the most popular destination as indicated by 'end trip' in the trip table? Just return three rows and order by total trips desc and zip code asc.

group by
join
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
zip_code	count_of_trips
52508	3
70271	3
15360	2
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
⌄
with locations as (select location_id, count(location_id) as cnt from google_maps_trips where event_type='end trip'
  GROUP BY location_id
  ORDER BY cnt DESC
  limit 5)
SELECT gml.zip_code, gmt.cnt as count_of_trips
FROM google_maps_locations gml 
JOIN locations gmt 
ON gml.location_id= gmt.location_id
  ORDER BY 2 DESC,1 ASC
  LIMIT 3;
 
 
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (512ms)

Code SQL queries above and run them to see results in real time.
zip_code	count_of_trips
52508	3
70271	3
15360	2
Footer

*/
