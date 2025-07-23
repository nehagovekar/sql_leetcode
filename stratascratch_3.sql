/*
Users By Average Session Time


Last Updated: July 2025

Medium
ID 10352

765

Calculate each user's average session time, where a session is defined as the time difference between a page_load and a page_exit. Assume each user has only one session per day. If there are multiple page_load or page_exit events on the same day, use only the latest page_load and the earliest page_exit, ensuring the page_load occurs before the page_exit. Output the user_id and their average session time.

Table
facebook_web_log
More about this question
Hints
Expected Output
All required columns and the first 5 rows of the solution are shown

user_id	avg_session_duration
0	1883.5
1	35

*/

With filtered_data as(SELECT user_id,
max(case when action='page_load' THEN (timestamp) END) as page_load,
min(CASE when action='page_exit' THEN (timestamp) END) as page_exit
FROM facebook_web_log
GROUP BY user_id, DATE(timestamp)),
Duration_Sec AS(
SELECT user_id, TIMESTAMPDIFF(SECOND, page_load,page_exit) AS seconds FROM filtered_data)

SELECT user_id,  AVG(seconds) AS avg_session_duration
FROM Duration_Sec
GROUP BY user_id
HAVING AVG(seconds) ;
