/*
76. Average rating and price per app
146
65%
Get the average rating and price per app. Round to 2 decimal places. Output the table in the alphabetical order of app name.

math
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
app_name	avg_rating	avg_price
:) Sudoku +	1	0.98
Bank of America - Mobile Banking	5	0.09
Bible	1.5	1.83
Cleartune - Chromatic Tuner	2	1.81
Crash Bandicoot Nitro Kart 3D		0
Facebook	2	0.43
Google ‚Äì Search made just for mobile	1	0.98
Hangman.	2	2.24
Lifesum ‚Äì Inspiring healthy lifestyle app	3	0.16
Mileage Log | Fahrtenbuch	4	0
Ms. PAC-MAN	2.5	1.57
PAC-MAN Premium	4	1.94
PCalc - The Best Calculator	2	0.23
PayPal - Send and request money safely	3	0
SCRABBLE Premium		1.01
Shanghai Mahjong	3	1.35
Shazam - Discover music, artists, videos & lyrics		0.7
Solitaire by MobilityWare	3.67	0.22
TripAdvisor Hotels Flights Restaurants	5	1.95
WeatherBug - Local Weather, Radar, Maps, Alerts	3	0.83
Yahoo Sports - Teams, Scores, News & Highlights		2.07
Yelp - Nearby Restaurants, Shopping & Services		0
iQuran		2.32
iTranslate - Language Translator & Dictionary		1.21
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
appstore_transactions	
transaction_id	bigint
user_id	bigint
app_name	varchar
transaction_dt	timestamp
payment_method	varchar
price	double
device	varchar
rating	double

*/

SELECT app_name, ROUND(avg(rating),2) as avg_rating , ROUND(avg(price),2) as avg_price
FROM appstore_transactions
GROUP BY app_name
ORDER BY app_name ASC;