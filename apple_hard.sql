/*
46. Precision and recall per payment type
146
65%
For each payment type used, calculate the precision and recall at the prdicted risk score 0.80 and above. Only consider transactions with risk scores and no missing payment methods. Round to answers to 2 decimal places and return 0 if no score. Final answer should be sorted by by payment method ascending.

cte
subquery
join
window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
payment_method	precision_score	recall_score
apple pay	0	0
credit	0	0
debit	0.67	1
gift card	0.6	0.6
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
appstore_transaction_risk	
transaction_id	bigint
risk_score	double
true_label	bigint
appstore_transactions	
transaction_id	bigint
user_id	bigint
app_name	varchar
transaction_dt	timestamp
payment_method	varchar
price	double
device	varchar
rating	double*/
