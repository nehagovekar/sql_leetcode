/*
67. High wait times.. Ugh?
146
65%
As a data scientist on the RX team (rider experience) you are charged with ensuring services are running optimally and riders and drivers are being matched in a timely fashion. You operate off a key metric called high_wait_time_prcnt. This metric should be under 10 percent of rides at all times. Calculate the ratio of trips that are take longer than 3 mins to match riders and drivers. Round answer to 2 decimals.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
high_wait_time_prcnt
10
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
SELECT COUNT(CASE WHEN service_match_time='3+min' THEN 1 ELSE NULL END)*100/COUNT(*) as high_wait_time_prcnt FROM uber_fct_trips;