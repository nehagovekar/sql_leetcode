/*
7. Trips start in manufacturing and end in business zones?
146
65%
Among users who signed up after 2021-01-01 and lives in UK, China or Australia, how many user trips started in manufacturing and ended in business zones? Return the count.

join
cte
subquery
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
trip_count
1
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
*/
WITH eligible_users AS (
    SELECT user_id
    FROM google_maps_users
    WHERE country IN ('UK', 'China', 'Australia')
      AND signup_dt > '2021-01-01'
),
start_trips AS (
    SELECT 
        user_id, 
        creation_dt AS start_time,
        event_id AS start_event_id
    FROM google_maps_trips gmt
    JOIN google_maps_locations gml 
        ON gmt.location_id = gml.location_id
    WHERE event_type = 'start trip'
      AND gml.zone = 'manufacturing'
),
end_trips AS (
    SELECT 
        user_id, 
        creation_dt AS end_time,
        event_id AS end_event_id
    FROM google_maps_trips gmt
    JOIN google_maps_locations gml 
        ON gmt.location_id = gml.location_id
    WHERE event_type = 'end trip'
      AND gml.zone = 'business'
),
matched_trips AS (
    SELECT 
        s.user_id
    FROM start_trips s
    JOIN end_trips e 
        ON s.user_id = e.user_id
        AND e.end_time > s.start_time
        AND e.end_time < s.start_time + INTERVAL '2 hour' -- assuming 1 trip ends within 2 hrs
)
SELECT COUNT(*) AS trip_count
FROM matched_trips mt
JOIN eligible_users eu
    ON mt.user_id = eu.user_id;
