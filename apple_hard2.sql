/*
 88. Apple user with gift card, but no credit card
146
65%
Which users ever used gift cards, but never used credit? Output email and the count of gift card use in the alphabetical order of email

filter
join
group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	gift_card_count
AMatthews2@yahoo.com	3
MLeon4@gmail.com	1
PPatterson2@yahoo.com	1
RRivers3@hotmail.com	2
TFlores8@hotmail.com	1
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
WITH payment_counts AS (
  SELECT 
    user_id,
    SUM(CASE WHEN payment_method = 'gift card' THEN 1 else 0  END) AS gift_card_count,
    SUM(CASE WHEN payment_method = 'credit' THEN 1 else 0 END) AS credit_card_count
  FROM appstore_transactions
  GROUP BY user_id
)
SELECT 
  au.email, 
  pc.gift_card_count
FROM payment_counts pc
JOIN apple_users au 
  ON pc.user_id = au.user_id
WHERE pc.gift_card_count > 0 
  AND pc.credit_card_count = 0
ORDER BY au.email ASC;
