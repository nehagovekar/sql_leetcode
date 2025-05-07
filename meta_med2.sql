/*
med
49. AB Experiment Ratio Mismatch
146
65%
The data is in from your experiment. But, before you calculate the control metric, test metric and delta change you need to check the sample sizes are about equal. Calculate the total users in the control group and treatment group for each test. Order by test name asc

count
math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
test_name	treatment_count	control_count
Green Button v1	8	10
Green Button v2	13	6
Icons Rearranged	7	8
ML Ranking Algo Feed	3	5
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
