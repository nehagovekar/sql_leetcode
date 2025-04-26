/*
16. Largest properties at AirBnB?
146
65%
Find the top 5 largest properties at AirBnB (3000+ sqft). Ignore ties, return exactly 5 order by property id asc.

filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
property_id
2
3
4
15
25
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
airbnb_dim_property	
property_id	bigint
owner_id	bigint
property_type	varchar
property_quality	varchar
no_bedrooms	bigint
no_bathrooms	double
total_sqft	varchar
nightly_price_range	varchar
parking_spots	bigint
location_town	varchar
location_country	varchar
first_listed_on	date

*/
SELECT property_id FROM airbnb_dim_property
 where total_sqft='3000+'
  ORDER BY property_id ASC
  LIMIT 5;