/*
24. Days Before First Ride
146
65%
You work on user behavior team at Uber you are interested in improving the time to first ride metric. But before you improve it you need to know what is the average value. Calculate the avg number of days until a users first ride. Round answer to 2 decimals.

window
datetime
math
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
days_before_first_trip
-77.15
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
uber_fct_trips	
ride_id	bigint
rider_id	bigint
driver_id	bigint
pickup_loc	varchar
dropoff_loc	varchar
city	varchar
ride_type	varchar
vehicle_type	varchar
destination_type	varchar
num_of_passengers	bigint
surcharge	double
base_fare	double
trip_miles	double
trip_request_at	timestamp
service_match_time	varchar
uber_dim_users	
user_id	bigint
first_name	varchar
last_name	varchar
user_type	varchar
preferred_vehicle	varchar
preferred_uber_service	varchar
email	varchar
country	varchar
signup_date	date
is_verified	boolean
requires_accomodations	bigint
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
⌄
--SELECT user_id, signup_date FROM uber_dim_users;
WITH USER_INFO AS
  (select udu.user_id, udu.signup_date,  min(uft.trip_request_at) as first_trip,
          DATEDIFF('day', MIN(uft.trip_request_at), CAST(udu.signup_date AS TIMESTAMP)) AS days_diff
  from
  uber_dim_users udu 
  JOIN
  uber_fct_trips uft 
  ON udu.user_id= uft.rider_id
  GROUP BY udu.user_id, udu.signup_date)
SELECT ROUND(AVG(days_diff),2) as days_before_first_trip
FROM USER_INFO;

Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (429ms)

Code SQL queries above and run them to see results in real time.
days_before_first_trip
-77.15
Footer

*/
--SELECT user_id, signup_date FROM uber_dim_users;
WITH USER_INFO AS
  (select udu.user_id, udu.signup_date,  min(uft.trip_request_at) as first_trip,
          DATEDIFF('day', MIN(uft.trip_request_at), CAST(udu.signup_date AS TIMESTAMP)) AS days_diff
  from
  uber_dim_users udu 
  JOIN
  uber_fct_trips uft 
  ON udu.user_id= uft.rider_id
  GROUP BY udu.user_id, udu.signup_date)
SELECT ROUND(AVG(days_diff),2) as days_before_first_trip
FROM USER_INFO;
