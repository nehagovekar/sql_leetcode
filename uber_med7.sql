/*
81. Who are the riders who cancel the most?
146
65%
Find the rider who cancels the most rides. Consider ties and return results sorted by rider name ascending.

window
join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
rider	rides_canceled	rnk
Tamara Wilson	6	1
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
uber_cancels	
rider_id	bigint
cancelled_at	date
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
WITH CANCEL_COUNT AS (
SELECT rider_id, count(cancelled_at) as cnt,
RANK() OVER (ORDER BY count(cancelled_at) DESC) as rnk
FROM uber_cancels
GROUP BY rider_id)
SELECT CONCAT(udu.first_name,' ',udu.last_name) AS rider, cc.cnt as rides_canceled,  cc.rnk  FROM CANCEL_COUNT cc
JOIN uber_dim_users udu
ON cc.rider_id= udu.user_id
WHERE rnk=1;