/*
28. Garbage in Garbage Out... Data Prep 1
146
65%
Your manager wants a cleaned up report with only Low, Med, High as growth types broken down by total count. Help him clean up the data with just those values and when you return your answer make sure its sorted by total desc.

case
group by
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
growth_typecleaned	total
Low	31
High	13
Med	6
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
messy_data	
post_id	bigint
growth_type	varchar
is_live	double
creation_region	varchar
etl_date	date
*/
SELECT 
  (CASE WHEN growth_type='Loww' then 'Low'
   WHEN growth_type='low' then 'Low' 
   WHEN growth_type='Hgh' then 'High'
  ELSE growth_type END) as growth_typecleaned,
  COUNT(*) total
  FROM messy_data
  GROUP BY 1
  ORDER BY 2 DESC;
