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
WITH filtered_data AS 
  (SELECT att.payment_method, (CASE WHEN risk_score>=0.80 THEN 1 ELSE 0 END) AS pred_label, true_label FROM appstore_transaction_risk atr 
  JOIN appstore_transactions att 
ON atr.transaction_id= att.transaction_id
WHERE att.payment_method IS NOT NULL),
 conf_mat AS
(
  SELECT payment_method,
  COUNT(CASE WHEN (pred_label=1 AND true_label=1) THEN 1 ELSE null END) AS TP,
  COUNT(CASE WHEN (pred_label=0 AND true_label=0) THEN 1 ELSE null END ) AS TN,
  COUNT(CASE WHEN (pred_label=1 AND true_label=0) THEN 1 ELSE null END ) AS FP,
  COUNT(CASE WHEN (pred_label=0 AND true_label=1) THEN 1 ELSE null END ) AS FN,
  FROM filtered_data
  GROUP BY payment_method

)
  SELECT payment_method, ROUND(COALESCE((TP/(TP+FP)),0),2) as precision_score, ROUND(COALESCE((TP/(TP+FN)),0),2) as recall_score
FROM conf_mat
  ORDER BY payment_method ASC;