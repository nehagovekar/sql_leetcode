/*
4. What is the percentage of reviewed posts?
146
65%
You are on the community team at Meta and are given a table of reported posts. Find the percentage of posts that are reviewed after being reported to the company. Round you answer to 2 decimals.

math
Hint #1
How do you count when a condition is present?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
review_rate
18
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
fb_reported_posts	
reported_by	bigint
post_id	bigint
posted_by	bigint
reported_reason	varchar
risk_rating	varchar
reported_at	date
is_reviewed	bigint
is_removed	bigint
Show Solution
1
2
3
4
⌄
SELECT 
  ROUND(((SUM(CASE WHEN is_reviewed THEN 1 ELSE 0 END)/COUNT(*))*100),2) AS review_rate
FROM fb_reported_posts;
  
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (468ms)

Code SQL queries above and run them to see results in real time.
review_rate
18
Footer

*/
SELECT 
  ROUND(((SUM(CASE WHEN is_reviewed THEN 1 ELSE 0 END)/COUNT(*))*100),2) AS review_rate
FROM fb_reported_posts;
  