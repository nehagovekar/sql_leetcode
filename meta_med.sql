/*
35. AB Experiment Evaluation
146
65%
The day is here and data is finally in from your AB experiment. Calculate the avg control metric, test metric, and delta change for each experiment. Be careful of internal test accounts or wrongly assigned groups muddying the results. Round intermediary and final calcs to 2 decimals and order by test name asc.

math
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
test_name	control_metric	test_metric	delta_chg
Green Button v1	0.91	0.66	-0.25
Green Button v2	1.26	2.23	0.97
Icons Rearranged	2.39	1.1	-1.29
ML Ranking Algo Feed	1.79	0.56	-1.23
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
ab_exp_results	
exp_res_id	bigint
test_name	varchar
treatment_group	varchar
metric_value	double
is_internal_acc	bigint
double_exposure	bigint
*/
SELECT test_name,
ROUND(AVG(CASE WHEN treatment_group='Control' then (metric_value) else 0 END),2) as control_metric,
 ROUND(AVG(CASE WHEN treatment_group='Test' then (metric_value) else 0 END),2) as test_metric,
 ROUND((test_metric-control_metric),2) as delta_chg
  FROM ab_exp_results
  WHERE is_internal_acc=0
  and double_exposure=0
  GROUP BY test_name 
  ORDER BY test_name ASC;