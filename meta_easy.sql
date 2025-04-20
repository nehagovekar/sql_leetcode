/*
32. Total Ad Impressions?
146
65%
Find the total number of impressions each ad received. Sort answer by impressions desc and ad asc.

group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
ad_name	ad_impressions
Nike Shoe Release	13
Spotify Prem	11
Charty Inc Trial	10
Disney+ Bundle	10
Cosmetics Holiday Sale	6
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
ads_actions	
ad_exp_id	bigint
ad_name	varchar
cpc_rate	varchar
clicked_ad	bigint

*/
SELECT ad_name, count(ad_name) as ad_impressions FROM ads_actions
  group by ad_name
  ORDER BY ad_impressions DESC, ad_name ASC;