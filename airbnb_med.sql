/*
59. Whos the most frequent renter?
146
65%
Find the most frequent renter at AirBnB. Allow for ties, return all tied for first if ties exist.

window
string
join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
renter_name	total_rentals
Michael Shah	10
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
airbnb_fct_rentals	
user_id	bigint
property_id	bigint
num_of_nights	bigint
price_per_night	double
purchased_date	date
airbnb_dim_users	
user_id	bigint
first_name	varchar
last_name	varchar
has_rented	bigint
joined_on_date	date
*/
WITH with_count as (SELECT user_id, COUNT(num_of_nights) as cnt
--  DENSE_RANK() OVER (PARTITION BY user_id ORDER BY airbnb_fct_rentals DESC) as rnk 
  FROM airbnb_fct_rentals
  GROUP BY user_id
 ),
 ranking AS (
  SELECT wc.user_id, wc.cnt, CONCAT(adu.first_name,' ', adu.last_name) as renter_name,
  DENSE_RANK() OVER (ORDER BY cnt DESC) as rnk 
  FROM with_count wc
  JOIN airbnb_dim_users adu 
  ON wc.user_id = adu.user_id
)
SELECT renter_name, cnt AS total_rentals FROM ranking
  WHERE rnk =1;