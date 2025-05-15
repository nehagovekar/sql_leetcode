/*
65. What is the number of poor quality property?
146
65%
Find the total number of poor quality properties that AirBnb has. Please return a single number.

filter
group by
Hint #1
What does poor quality mean? Try counting total rentals by property type.

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
total_properties
0
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
select COUNT(*) as total_properties from airbnb_dim_property
  WHERE property_type='poor';