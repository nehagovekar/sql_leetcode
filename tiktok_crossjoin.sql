/*
med
42. How do you compare!? Whats the view rate?
146
65%
Find the full view rate of the entire population, then calculate the view rate for each user. Determine which users are over or under the population view rate for further analysis. Full view rate is the percent of views that are watched to completion. Round answer to 2 decimals and sort by view rate desc, user asc

math
case
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
viewer	usr_full_view_rate	full_view_rate	full_view_type
2	100	40	Over
3	100	40	Over
6	100	40	Over
9	100	40	Over
13	100	40	Over
16	100	40	Over
19	100	40	Over
20	100	40	Over
22	100	40	Over
29	100	40	Over
35	100	40	Over
42	100	40	Over
45	100	40	Over
49	100	40	Over
4	50	40	Over
5	50	40	Over
15	50	40	Over
17	50	40	Over
31	50	40	Over
43	25	40	Under
7	0	40	Under
8	0	40	Under
11	0	40	Under
12	0	40	Under
14	0	40	Under
21	0	40	Under
25	0	40	Under
27	0	40	Under
30	0	40	Under
33	0	40	Under
37	0	40	Under
39	0	40	Under
44	0	40	Under
46	0	40	Under
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
tiktok_fct_views	
viewer_id	bigint
creator_id	bigint
view_ts	timestamp
device_type	varchar
viewed_to_completion	bigint
sound_id	bigint
has_promotion	bigint
tiktok_dim_users	
user_id	bigint
user_name	varchar
signup_ts	timestamp
country	varchar
suspicious_account	bigint

*/
WITH overall_rate
  AS(
  SELECT SUM(CASE WHEN viewed_to_completion=1 THEN 1 ELSE 0 END)/COUNT(*)*100 as full_view_rate  FROM tiktok_fct_views),
   user_population_rate AS
  (
  SELECT viewer_id, SUM(CASE WHEN viewed_to_completion=1 THEN 1 ELSE 0 END)/COUNT(*)*100  as viewer_rate
  FROM tiktok_fct_views
  GROUP BY viewer_id
  )
  SELECT upr.viewer_id as viewer,upr.viewer_rate as usr_full_view_rate, orr.full_view_rate, (CASE WHEN upr.viewer_rate> orr.full_view_rate THEN 'Over' ELSE 'Under' END) as full_view_type   
   
 FROM user_population_rate upr
  CROSS JOIN overall_rate orr
  ORDER BY viewer_rate DESC, upr.viewer_id ASC;