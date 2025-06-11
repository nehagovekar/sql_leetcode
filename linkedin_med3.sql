/*
91. Which users returned to a job they once had?
146
65%
Which users returned to a job they once had previously? Output the user's email and name of employer sorted by employer asc and email asc.

join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	employer
PCarroll7@gmail.com	Meta
FSmith0@gmail.com	Netflix
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

*/
WITH check_returning_ids AS
  (SELECT user_id,employment, COUNT(employment) as cnt FROM linkedin_emp_history
GROUP BY user_id, employment)
SELECT lu.email, cri.employment as employer from linkedin_users lu 
JOIN check_returning_ids cri 
ON lu.user_id= cri.user_id
WHERE cnt>1
ORDER BY employer ASC, lu.email ASC;