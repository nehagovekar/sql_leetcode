/*
29. How many luxury properties?
146
65%
Find the total number of luxury properties that AirBnb.

group by
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
total_luxury_properties
9
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
SELECT COUNT(property_id) as total_luxury_properties FROM airbnb_dim_property
  where property_type='Luxury';