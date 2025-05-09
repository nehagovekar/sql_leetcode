/*
hard
53. Which user worked less than a year before switching?
146
65%
You're on the industry understanding function at Linkedin. You are interested in identifying users who worked less than 1 year in their first job and then worked more than 1 year in their second job? Return the emails of users sorted in asc order.

group by
datetime
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email
AMarshall6@yahoo.com
FSmith0@gmail.com
LDuke9@yahoo.com
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
linkedin_emp_history	
user_id	bigint
employment	varchar
start_date	date
end_date	date
linkedin_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	date
account_type	varchar
Show Solution
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
⌄
with no_days as(SELECT user_id, DATEDIFF('days',start_date,end_date) as em_days,
    RANK() OVER (PARTITION BY user_id ORDER BY start_date ASC) as rnk
  FROM linkedin_emp_history),
Filter_Users AS
(
  SELECT user_id 
  FROM no_days
  WHERE rnk =1 and em_days<365 
  )
SELECT linkedin_users.email FROM linkedin_users
    JOIN no_days
  ON linkedin_users.user_id=no_days.user_id
WHERE no_days.user_id in (SELECT user_id from filter_users)
  and no_days.rnk=2 and no_days.em_days>365
  ORDER BY linkedin_users.email;
account_type
country
email
first_name
joined_dt
last_name
user_id
Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (403ms)

Code SQL queries above and run them to see results in real time.
email
AMarshall6@yahoo.com
FSmith0@gmail.com
LDuke9@yahoo.com
Footer

*/