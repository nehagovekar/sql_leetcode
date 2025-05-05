/*
33. What is the top renting property?
146
65%
Find the top rented property(s) id from the following table. Top rented can be thought of as number of nights rented. Please consider ties and column names. Return results sorted in asc order.

window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
property_id
7
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
airbnb_fct_rentals	
user_id	bigint
property_id	bigint
num_of_nights	bigint
price_per_night	double
purchased_date	date

*/
WITH total_nights AS
(
  SELECT property_id, SUM(num_of_nights) as mn
  FROM airbnb_fct_rentals
  GROUP BY property_id
)
SELECT property_id FROM total_nights
WHERE mn = (SELECT max(mn) FROM total_nights)
ORDER BY property_id ASC;