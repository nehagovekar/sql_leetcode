/*
Average Post Hiatus (Part 1)
Facebook SQL Interview Question
Question
Solution
Discussion
Submissions
Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

p.s. If you've read the Ace the Data Science Interview and liked it, consider writing us a review?

posts Table:
Column Name	Type
user_id	integer
post_id	integer
post_content	text
post_date	timestamp
posts Example Input:
user_id	post_id	post_content	post_date
151652	599415	Need a hug	07/10/2021 12:00:00
661093	624356	Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10. Another day that's gonna fly by. I miss my girlfriend	07/29/2021 13:00:00
004239	784254	Happy 4th of July!	07/04/2021 11:00:00
661093	442560	Just going to cry myself to sleep after watching Marley and Me.	07/08/2021 14:00:00
151652	111766	I'm so done with covid - need travelling ASAP!	07/12/2021 19:00:00
Example Output:
user_id	days_between
151652	2
661093	21
The dataset you are querying against may have different input & output - this is just an example!
*/

with filtered_data as (SELECT user_id,count(post_id) as cnt, min(post_date) as first_date
FROM posts 
WHERE YEAR(post_date)=2021
GROUP BY user_id),
dates_data as(
SELECT fd.user_id, fd.first_date,
LAG(p.post_date) OVER ( PARTITION BY p.user_id ORDER BY p.post_date DESC) as lagged_date
FROM filtered_data fd
JOIN posts p
ON fd.user_id = p.user_id
WHERE fd.cnt>=2
)
SELECT user_id, datediff(max(lagged_date), first_date) as days_between FROM dates_data
GROUP BY user_id;
