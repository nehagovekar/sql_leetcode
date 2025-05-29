/*
82. Get the like and comment counts per video per day.
146
65%
Get the like and comment counts per video per day. Output the date, video_title, and count in the ascending order of the date. It's okay if some of the dates are missing.

group by
filter
cte
subquery
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
event_date	video_title	action_count
2022-04-18T00:00:00	Some thoughts on the shooting at Youtube	1
2022-04-27T00:00:00	It's Here!!! CASEY NEISTAT MERCH	1
2022-06-01T00:00:00	How to make Pumpkin Pie Mistakes	1
2022-06-14T00:00:00	there's something we've been hiding from you.	1
2022-06-14T00:00:00	ALL TIME GREATEST AIRPLANE SEAT - Emirates First Class Suite	1
2022-06-14T00:00:00	IS THIS THE CAMERA OF THE FUTURE?	1
2022-06-22T00:00:00	Interviewing the Head of YouTube Business	1
2022-07-08T00:00:00	WE WANT TO TALK ABOUT OUR MARRIAGE	1
2022-07-21T00:00:00	Christmas Cupcake Tower GONE WRONG with Joey Graceffa!	1
2022-08-05T00:00:00	there's something we've been hiding from you.	1
2022-08-05T00:00:00	Interviewing the Head of YouTube Business	1
2022-08-17T00:00:00	about Logan Paul	1
2022-09-28T00:00:00	WE WANT TO TALK ABOUT OUR MARRIAGE	1
2022-09-28T00:00:00	Original 2007 iPhone Unboxing!!!	1
2022-10-05T00:00:00	How to make Pumpkin Pie Mistakes	1
2022-10-05T00:00:00	IS THIS THE CAMERA OF THE FUTURE?	1
2022-10-12T00:00:00	ABANDONED MALL TURNED INTO WINTER WONDERLAND	1
2022-10-12T00:00:00	SELF FLYING ROBOT DRONE OF THE FUTURE; The Skydio R1	1
2022-10-26T00:00:00	It's Here!!! CASEY NEISTAT MERCH	1
2022-10-26T00:00:00	THE STRANGEST BOOTH AT CES 2018!!!!	1
2022-11-11T00:00:00	THE STRANGEST BOOTH AT CES 2018!!!!	1
2022-11-11T00:00:00	It's Here!!! CASEY NEISTAT MERCH	1
2022-11-19T00:00:00	IS THIS THE CAMERA OF THE FUTURE?	1
2022-11-19T00:00:00	ABANDONED MALL TURNED INTO WINTER WONDERLAND	1
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
youtube_reactions	
event_id	bigint
session_id	bigint
user_id	bigint
video_id	bigint
reaction_dt	timestamp
reactions	varchar
youtube_videos	
video_id	bigint
is_monetized	bigint
video_title	varchar
channel	varchar
user_id	bigint
category	varchar
published_at	timestamp
duration_sec	bigint
*/
SELECT DATETRUNC('day',yr.reaction_dt) as event_date, yv.video_title, COUNT(*) as action_count 
FROM youtube_reactions yr 
JOIN youtube_videos yv 
ON yr.video_id=yv.video_id
WHERE yr.reactions in ('like', 'comment')
GROUP BY event_date, yv.video_title, yr.reactions
ORDER BY event_date ASC;
