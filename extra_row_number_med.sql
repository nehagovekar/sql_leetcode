/*
86. Im Seeing Double
146
65%
You have a dataset that contains changes to records over time. You realized its causing issues with joins because of duplicate keys. Your goal is to deduplicate the dataset so that each user only has 1 record based on the most recent change data. All other records are considered stale and can be omitted from your query. Return the user_id, primary_device, and email sorted by user_id asc.

window
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_id	primary_device	email
1	Mobile - Android	xfoley@example.net
2	Desktop	heatherwang@example.com
3	Mobile - IOS	ryanjeffrey@example.net
4	Mobile - Android	conradmichael@example.org
5	Mobile - IOS	luis31@example.com
6	Mobile - IOS	ereid@example.net
7	Desktop	laura60@example.org
8	Mobile - Android	joseph61@example.org
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
duplicated_data	
user_id	varchar
primary_device	varchar
email	varchar
last_updated_on	date

*/
WITH ranked AS(SELECT *,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY last_updated_on DESC) as rnk
  FROM duplicated_data)
SELECT user_id, primary_device, email
FROM ranked
WHERE rnk=1
ORDER BY user_id;
