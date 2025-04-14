/*
5. How much have refunds cost us?
146
65%
Well no business likes giving money back via refunds...but the customer is always right... right? You are on the finace DS team at Uber and looking to quantify in dollars how much refunds have cost the business. Calculate the total refund amount Uber has paid back. Round answer to 2 decimals if needed. total_refunded = (surcharge * base fare) * trip miles.

group by
math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
total_refunded
28.2
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
select ROUND(SUM(uft.surcharge*uft.base_fare*uft.trip_miles),2) as total_refunded 
  from uber_refunds ur
  left join uber_fct_trips uft
  ON ur.Trip_id= uft.ride_id;
