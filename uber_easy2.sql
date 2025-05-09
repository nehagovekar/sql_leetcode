/*
54. What percent of rides are refunded?
146
65%
Find the ride refund rate of all Uber trips, that is out of all rides how many are refunded?. Be careful how you count... there could be more than 1 reason a rider cancels. Round your answer to 2 decimals.

math
join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
ride_refund_rate
18.33
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
uber_refunds	
trip_id	bigint
refund_reason	varchar
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