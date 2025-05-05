/*
med
45. Amazon prime users with clothing and jewelry products
146
65%
Among prime users who purchased products in the clothing or jewelry categories, output the email address in the ascending order of their prime sign_up date and email.

join
filter
distinct
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	prime_joined_dt
RCaldwell9@yahoo.com	2022-01-07T00:00:00
KPerez4@hotmail.com	2022-01-09T00:00:00
FSmith3@yahoo.com	2022-01-12T00:00:00
VReynolds0@hotmail.com	2022-01-13T00:00:00
MWhite2@gmail.com	2022-01-14T00:00:00
AElliott4@gmail.com	2022-01-15T00:00:00
JJordan4@yahoo.com	2022-01-16T00:00:00
MRobinson8@yahoo.com	2022-01-17T00:00:00
JWalker3@hotmail.com	2022-01-21T00:00:00
MRuiz8@hotmail.com	2022-01-22T00:00:00
SMcdonald7@yahoo.com	2022-01-22T00:00:00
EKhan2@gmail.com	2022-01-23T00:00:00
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
amazon_products	
product_id	bigint
product_name	varchar
category	varchar
price	double
rating	bigint
published_at	date
amazon_transactions	
transaction_id	bigint
user_id	bigint
product_id	bigint
transaction_dt	timestamp
payment_method	varchar
shipping_cost	double
quantity	bigint
*/
