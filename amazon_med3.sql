/*
68. Amazon user email and transaction datetimes
146
65%
Find the email and first purchase date of all users who purchased a product from the clothing or jewelry category. Return the output sorted by first purchase date ascending and email ascending.

join
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	first_purchase_date
JJordan4@yahoo.com	2022-02-01T00:00:00
JPearson3@yahoo.com	2022-02-01T00:00:00
MJohnson7@gmail.com	2022-02-01T00:00:00
MRuiz8@hotmail.com	2022-02-01T00:00:00
MWhite2@gmail.com	2022-02-01T00:00:00
SHarris1@hotmail.com	2022-02-01T00:00:00
VLiu0@yahoo.com	2022-02-01T00:00:00
CHernandez8@hotmail.com	2022-02-02T00:00:00
FSmith3@yahoo.com	2022-02-02T00:00:00
JMoody4@yahoo.com	2022-02-02T00:00:00
LTaylor9@hotmail.com	2022-02-02T00:00:00
MRobinson8@yahoo.com	2022-02-02T00:00:00
VReynolds0@hotmail.com	2022-02-02T00:00:00
CJohnston9@hotmail.com	2022-02-03T00:00:00
KPerez4@hotmail.com	2022-02-03T00:00:00
RCaldwell9@yahoo.com	2022-02-03T00:00:00
EKhan2@gmail.com	2022-02-04T00:00:00
AElliott4@gmail.com	2022-02-05T00:00:00
JWalker3@hotmail.com	2022-02-05T00:00:00
SMcdonald7@yahoo.com	2022-02-05T00:00:00
CHernandez4@gmail.com	2022-02-06T00:00:00
PCarroll4@yahoo.com	2022-02-06T00:00:00
SPreston3@gmail.com	2022-02-06T00:00:00
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
WITH filtered_category AS
(SELECT at.user_id, ap.category, at.transaction_dt, au.email,
  RANK() OVER (PARTITION BY at.user_id ORDER BY at.transaction_dt ASC) as rnk 
  FROM amazon_products ap
  JOIN amazon_transactions at 
  ON ap.product_id= at.product_id
  JOIN amazon_users au 
  on au.user_id=at.user_id
  WHERE category in ('clothing','jewelry'))
SELECT email, date_trunc('day',transaction_dt)  as first_purchase_date from filtered_category
  where rnk =1
  ORDER BY first_purchase_date ASC, email ASC;