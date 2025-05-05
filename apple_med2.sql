/*
41. Highest revenue app per date
146
65%
Which app generated the highest revenue per date between March 1, 2022 and March 7, 2022? Order the output in the ascending order of transaction date and app name asc.

rank
group by
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
transaction_date	app_name
2022-03-01T00:00:00	SCRABBLE Premium
2022-03-04T00:00:00	Bible
2022-03-05T00:00:00	PAC-MAN Premium
2022-03-06T00:00:00	Bible
2022-03-07T00:00:00	:) Sudoku +
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