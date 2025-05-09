/*
50. Apple user with no App Store activity
146
65%
Which users who joined between Jan 1, 2022 and Jan 8, 2022 never made a single purchase on App Store between ? Output the email and joined date of users sorted by email ascending

join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	joined_dt
AAnderson4@yahoo.com	2022-01-07T00:00:00
CHernandez3@gmail.com	2022-01-05T00:00:00
RBailey6@gmail.com	2022-01-08T00:00:00
RCox2@gmail.com	2022-01-01T00:00:00
SRodriguez9@gmail.com	2022-01-05T00:00:00
VGardner5@hotmail.com	2022-01-05T00:00:00
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
appstore_transactions	
transaction_id	bigint
user_id	bigint
app_name	varchar
transaction_dt	timestamp
payment_method	varchar
price	double
device	varchar
rating	double
apple_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	date
*/
SELECT (au.email), au.joined_dt FROM 
  apple_users au 
WHERE au.joined_dt between '2022-01-01' and '2022-01-08' 
  and au.user_id not in (select user_id from appstore_transactions)
ORDER BY au.email ASC;