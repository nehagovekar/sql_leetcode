/*
Histogram of Tweets
Twitter SQL Interview Question
Question
Solution
Discussion
Submissions
Accepted

Congrats 🎉 - Share this problem, and your solution, on LinkedIn or Twitter!

In your post, don’t forget to tag Nick Singh, so that he can comment on and share your post with his audience of 150k+ followers on LinkedIn and 25k+ followers on Twitter (which will give your post and profile more visibility)!

Output

tweet_bucket	users_num
1	2
2	1
Expected

tweet_bucket	users_num
1	2
2	1
*/
WITH tweet_count AS(
SELECT user_id, COUNT(tweet_id) as tweet_count
FROM tweets
WHERE year(tweet_date)='2022'
GROUP BY user_id)

SELECT DISTINCT(tweet_count) as tweet_bucket, COUNT(user_id) as users_num
FROM tweet_count
GROUP BY tweet_count;