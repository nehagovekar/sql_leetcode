/*
106. Survey Completion Rate
146
65%
You work for a product company and are interested in learning more about your customers. You create a survey to gauge product market fit and consumer perception. The results are in and you need to do some quality checks before concluding. Determine the answer rate for each question. If any question is less than 50% we cannot use the data.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
question	completon_rt
1. Would you recommend this product to your friend?	100
2. Have you made a purchase of this product again within the past 30 days?	100
3. What price do you believe is fair for this product?	90
4. Do you consider this brand premium compared to others in market?	80
5. If this product did not exist where would you search for a replacement?	100
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
survey_results	
survey_id	bigint
question	varchar
user_id	bigint
response	varchar
answer_time	timestamp

*/

SELECT question, COUNT(response)*100/(COUNT(*)) AS completon_rt  FROM survey_results
  GROUP BY question
  ORDER BY question ASC;