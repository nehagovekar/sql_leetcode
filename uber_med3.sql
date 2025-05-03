/*
40. Uber Memory Lane... Users top Trips
146
65%
Youre on the Uber community team and are asked to work on a cool new feature to recap each riders top trip on the platform. You need to come up with the top trip where the criteria is total trip_miles. Return the top trip for each rider and sort by full name asc mileage desc.

string
metric
rank
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_name	trip_miles	trip_rnk
Amber Sutton	4.29	1
Ann Garcia	5.37	1
Beth Jenkins	7.59	1
Cassandra Cook	17.68	1
Christopher Ho	13.42	1
Christopher Moore	4.21	1
Cory Jones	7.41	1
Edward Howard	10.84	1
Erin Kennedy	6.65	1
Heidi Johnson	17.75	1
Jennifer Hubbard	7.15	1
Jessica Garcia	6	1
Joel House	7.84	1
Kenneth Wright	7.38	1
Kevin Mathews	16.46	1
Lindsey Edwards	14.45	1
Lisa Martinez	5.41	1
Luis Lopez	4.66	1
Maria Lang	0.65	1
Nicholas Sanchez	1.63	1
Renee Nelson	3.32	1
Steve Nelson	12.5	1
Tamara Wilson	1.62	1
Tina Johnson	5.52	1
Tyrone Allen	10.88	1
Vanessa Barry	0.68	1
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

*/
WITH username AS
  (
  SELECT CONCAT(udm.first_name,' ', udm.last_name) AS user_name,
 trip_miles FROM
   uber_fct_trips uft 
  JOIN uber_dim_users udm 
  ON udm.user_id = uft.rider_id
  ),
   ranking as (
SELECT u.user_name,
  u.trip_miles,
  DENSE_RANK() OVER (PARTITION BY u.user_name ORDER BY u.trip_miles DESC) AS trip_rnk FROM username u
  )
SELECT * FROM ranking 
WHERE trip_rnk=1 
ORDER BY user_name ASC;

