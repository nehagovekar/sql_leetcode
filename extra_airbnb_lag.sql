/*9. Whats the Days Between Stays?
146
65%
Find the average number of days between stays for all renters at Airbnb. Only consider users who had a next stay. Return the avg number of days rounded to 2 decimals.

group_by
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
days_between_stays
26.2
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
airbnb_dim_users	
user_id	bigint
first_name	varchar
last_name	varchar
has_rented	bigint
joined_on_date	date
airbnb_fct_rentals	
user_id	bigint
property_id	bigint
num_of_nights	bigint
price_per_night	double
purchased_date	date

*/
WITH selected_users AS
(SELECT adu.user_id,  afr.purchased_date,
  LEAD(afr.purchased_date) OVER (PARTITION BY adu.user_id ORDER BY afr.purchased_date) as after_date
  FROM airbnb_dim_users adu
  JOIN airbnb_fct_rentals afr 
  ON adu.user_id= afr.user_id
  WHERE adu.has_rented=1)
select ROUND(AVG(DATEDIFF('days',purchased_date,after_date )),2) as days_between_stays from selected_users
  where after_date is not null;