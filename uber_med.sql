/*
19. Who is the top driver(s) at Uber?
146
65%
Find the top driver at uber and how many rides they have given. Ignore ties, return exactly 1. Order by rides given and driver id asc

math
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
driver_id	rides_given	driver_rnk
4	9	1
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

*/
SELECT driver_id, COUNT(ride_id) as rides_given, 
  RANK() OVER (PARTITION BY driver_id) as driver_rnk FROM uber_fct_trips
  GROUP BY driver_id
  ORDER BY rides_given DESC

  LIMIT 1;
