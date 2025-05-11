/*
60. Top three companies with the longest average tenure
146
65%
Your boss is trying to put together some numbers for a leadership presentation. They ask which 3 employers have the longest average tenure in months? Your boss doesn't care about ties and ONLY wants exactly 3 rows returned rounded to 2 decimals and sorted by tenure desc. Are you up to the task?

group by
datetime
Hint #1
How do you get the difference in dates in months? Use timestampdiff(month, <start date>, <end date>).

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
employment	avg_tenure
Lyft	21
Amazon	16
Mckinsey	15.8
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_emp_history	
user_id	bigint
employment	varchar
start_date	date
end_date	date

*/
SELECT employment, AVG(DATEDIFF('month',start_date, end_date)) as avg_tenure
FROM  linkedin_emp_history
GROUP BY employment
ORDER BY avg_tenure DESC
LIMIT 3;