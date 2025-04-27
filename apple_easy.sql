/*
21. Transactions with missing payment methods
146
65%
How many transactions have missing payment method?

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
num_missing
19
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

*/
SELECT COUNT(*) as num_missing
FROM appstore_transactions
WHERE payment_method IS NULL;