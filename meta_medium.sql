/*
13. Whats the risk rating percentage?
146
65%
You are on the enterprise risk team at Meta and are asked to give you leader key percentage breakdowns by risk rating level. Find the percentage that each risk type makes up for reported population. Round answer to 2 decimals and sort by risk percent desc. Remember to only count a given post 1 time per risk rating.

math
group by
Hint #1
Can you count by risk level and all posts in a single query?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
risk_rating	risk_percentage
Low	81.48
Medium	48.15
High	7.41
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
5
6
7
8
⌄
SELECT risk_rating,
ROUND((COUNT(DISTINCT(post_id))/
  (SELECT COUNT(DISTINCT(post_id)) FROM fb_reported_posts)*100),2)
  AS risk_percentage
FROM fb_reported_posts
GROUP BY risk_rating
ORDER BY risk_percentage DESC;

Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (654ms)

Code SQL queries above and run them to see results in real time.

*/
SELECT risk_rating,
ROUND((COUNT(DISTINCT(post_id))/
  (SELECT COUNT(DISTINCT(post_id)) FROM fb_reported_posts)*100),2)
  AS risk_percentage
FROM fb_reported_posts
GROUP BY risk_rating
ORDER BY risk_percentage DESC;
