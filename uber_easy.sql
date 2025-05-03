/*
34. Count and most recent event datetime by action type?
146
65%
Among all the events after April 1, 2022, what is the total count as well as the most recent datetime of each event type? Order the output in the alphabetical order of event_type.

group by
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
event_type	ride_counts	event_datetime
click	8	2022-12-23T00:00:00
navigate	20	2022-12-25T00:00:00
search	8	2022-11-16T00:00:00
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
google_maps_actions	
event_id	bigint
user_id	bigint
location_id	bigint
creation_dt	timestamp
event_type	varchar

*/