/*
36. Uber Airport Dropoff Market Analysis!
146
65%
You work on the growth team here at Uber you are interested in investing more money into your dropoff rider driver programs. You were promised additional funding if you can show the airport dropoff rate is greater than 20 percent of all rides. Find ther percentage of rides that dropoff at Airport locations and give it to your boss. Round answer to 2 decimals.

math
case
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
airport_dropoff_rate
46.67
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
SELECT ROUND(COUNT(CASE WHEN destination_type='Airport' then 1 else null END)/COUNT(*)*100,2) AS airport_dropoff_rate from uber_fct_trips;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (431ms)

Code SQL queries above and run them to see results in real time.
airport_dropoff_rate
46.67
Footer

*/