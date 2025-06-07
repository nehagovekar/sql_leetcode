/*
107. Time To Completion
146
65%
Well survey respondents are slow to get answers in. You want to know just how long it takes them to complete a survey. You spent a lot of time designing the survey and think it should take at max 1 hour. Calculate the average time to completion for the survey in hours. Round you final answer to 2 decimals

date
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
time_to_completion
2.05
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
survey_results	
survey_id	bigint
question	varchar
user_id	bigint
response	varchar
answer_time	timestamp
*/
WITH survey_time AS
(SELECT survey_id,
  min(answer_time) as first,
  max(answer_time) as LAST
  FROM survey_results
  GROUP BY 1
  )
SELECT round(avg(DATEDIFF('min', first, LAST))/60,2) as time_to_completion FROM survey_time;