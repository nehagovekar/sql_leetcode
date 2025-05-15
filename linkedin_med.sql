/*
63. What is the average tenure per company in months?
146
65%
What is the average tenure per company in months? Output the company and average tenure, rounded to 1 decimal point and sorted by company ascending.

group by
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
company	avg_tenure
Amazon	16
Apple	9.7
BCG	13.5
Lyft	21
Mckinsey	15.8
Meta	15.2
Microsoft	14
Netflix	14.5
Stripe	13
Twillio	14
Uber	14
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_emp_history	
user_id	bigint
employment	varchar
start_date	date
end_date	date
Show Solution
1
2
3
⌄
SELECT employment as company,ROUND(AVG(datediff('month',start_date,end_date)),1) as avg_tenure FROM linkedin_emp_history
  GROUP BY employment
  ORDER BY employment ASC;
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (519ms)

Code SQL queries above and run them to see results in real time.
company	avg_tenure
Amazon	16
Apple	9.7
BCG	13.5
Lyft	21
Mckinsey	15.8
Meta	15.2
Microsoft	14
Netflix	14.5
Stripe	13
Twillio	14
Uber	14
Footer

*/
