/*
72. Days since a users first session?
146
65%
Calculate the number of days since a users first session. Assume today is 2022-05-26. Return answers sorted by days desc and user_id asc.

datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_id	first_session	days_since_first_session
3	2020-08-12T00:00:00	-652
4	2020-05-31T00:00:00	-725
2	2020-05-30T00:00:00	-726
5	2020-05-05T00:00:00	-751
8	2020-03-27T00:00:00	-790
7	2020-03-10T00:00:00	-807
6	2020-02-18T00:00:00	-828
1	2020-02-07T00:00:00	-839
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
ig_user_sessions	
user_id	bigint
session_ts	timestamp
session_type	varchar
*/
SELECT user_id, 
  date_trunc('day', min(session_ts)) as first_session,
  datediff('day',CAST('2022-05-26' as date), min(session_ts)) as days_since_first_session
  FROM ig_user_sessions
  group by user_id
  ORDER BY days_since_first_session desc, user_id asc;


