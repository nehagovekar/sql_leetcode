/*
84. The most popular payment method per user
146
65%
For each user with at least 3 transactions with a single payment method, what's the most popular payment method used? If payment methods have the same count, return the first payment method used. Output the email, payment_method, and count sorted by payment count desc and email asc.

window
group by
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	payment_method	payment_counts
CHernandez8@hotmail.com	credit	4
MRobinson8@yahoo.com	gift card	4
CJohnston9@hotmail.com	credit	3
EKhan2@gmail.com	credit	3
JPearson3@yahoo.com	credit	3
LTaylor9@hotmail.com	debit	3
MJohnson7@gmail.com	credit	3
VLiu0@yahoo.com	gift card	3
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
amazon_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	timestamp
prime_member	bigint
prime_joined_dt	timestamp
amazon_transactions	
transaction_id	bigint
user_id	bigint
product_id	bigint
transaction_dt	timestamp
payment_method	varchar
shipping_cost	double
quantity	bigint

*/