/*
55. Where are they going?
146
65%
Welcome to the destinations team at Uber. Your team focuses on understanding where riders are getting dropped off in order to partner with local desitnations to ensure safer and more efficient experiences. In order to narrow in on projects you are asked to calculate the percentage of trips for each destination type. Return answer sorted by percent desc and rounded to 2 decimals.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
destination_type	destination_prcnt
Airport	46.67
Bar_Restaraunt	16.67
Venue	11.67
Event	10
Residence	8.33
Other	6.67
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
⌄
SELECT destination_type, ROUND(COUNT(*)/(SELECT COUNT(*) FROM uber_fct_trips)*100,2) as destination_prcnt FROM uber_fct_trips
GROUP BY destination_type
ORDER BY destination_prcnt DESC;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (426ms)

Code SQL queries above and run them to see results in real time.
destination_type	destination_prcnt
Airport	46.67
Bar_Restaraunt	16.67
Venue	11.67
Event	10
Residence	8.33
Other	6.67
Footer

*/
