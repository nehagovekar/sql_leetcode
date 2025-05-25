/*
You work on rider experience team and are interested in increasing the frequency of ride by users. You need to figure out what is the avg number of days between rides for users so you can try and improve this using promos and experiments. Calculate the avg number of days between rides for a user and round answer to 2 decimals.

window
math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
days_between_rides
-36
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
⌄
WITH ride_days AS
(
  SELECT rider_id,
  datetrunc('day',trip_request_at) as current_trip,
  LEAD(datetrunc('day',trip_request_at)) OVER (PARTITION BY rider_id ORDER BY trip_request_at) as next_ride
  FROM uber_fct_trips
  
)

SELECT ROUND(AVG(DATEDIFF('day',next_ride, current_trip)),2) as days_between_rides FROM ride_days
WHERE next_ride is not null;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (564ms)

Code SQL queries above and run them to see results in real time.

*/
WITH ride_days AS
(
  SELECT rider_id,
  datetrunc('day',trip_request_at) as current_trip,
  LEAD(datetrunc('day',trip_request_at)) OVER (PARTITION BY rider_id ORDER BY trip_request_at) as next_ride
  FROM uber_fct_trips
  
)

SELECT ROUND(AVG(DATEDIFF('day',next_ride, current_trip)),2) as days_between_rides FROM ride_days
WHERE next_ride is not null;