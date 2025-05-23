/*
73. Which user worked in more than two distinct companies
146
65%
Which user worked in more than two distinct companies? Note that some users may have returned to the same job. Output the email address of these users in the ascending order.

group by
distinct
join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email
CGarner8@gmail.com
JPearson6@yahoo.com
LDuke9@yahoo.com
RGray0@yahoo.com
VLiu4@gmail.com
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