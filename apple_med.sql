/*
38. Impute missing rating per app
146
65%
Create a new column called rating_imputed that imputes missing rating for ALL apps. The imputed value should be the average of rating per app, rounded to 2 decimal places. If there are no ratings for a given app return a value of 0. Be careful to output ALL Apps. Return the user_id, app_name, and rating_imputed sorted by app_name ascending

window
case
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
user_id	app_name	rating_imputed
11	:) Sudoku +	1
10	Bank of America - Mobile Banking	5
7	Bank of America - Mobile Banking	5
8	Bank of America - Mobile Banking	5
9	Bible	2
21	Bible	1.5
8	Bible	1
8	Cleartune - Chromatic Tuner	2
3	Cleartune - Chromatic Tuner	2
10	Crash Bandicoot Nitro Kart 3D	0
24	Facebook	2
26	Google ‚Äì Search made just for mobile	1
16	Google ‚Äì Search made just for mobile	1
11	Google ‚Äì Search made just for mobile	1
29	Google ‚Äì Search made just for mobile	1
15	Hangman.	2
2	Lifesum ‚Äì Inspiring healthy lifestyle app	2
20	Lifesum ‚Äì Inspiring healthy lifestyle app	4
7	Mileage Log | Fahrtenbuch	4
26	Ms. PAC-MAN	4
22	Ms. PAC-MAN	1
12	Ms. PAC-MAN	2.5
7	PAC-MAN Premium	5
21	PAC-MAN Premium	4
2	PAC-MAN Premium	3
27	PCalc - The Best Calculator	2
19	PayPal - Send and request money safely	3
25	SCRABBLE Premium	0
21	SCRABBLE Premium	0
23	SCRABBLE Premium	0
14	SCRABBLE Premium	0
2	Shanghai Mahjong	1
14	Shanghai Mahjong	5
3	Shazam - Discover music, artists, videos & lyrics	0
21	Solitaire by MobilityWare	2
7	Solitaire by MobilityWare	4
9	Solitaire by MobilityWare	5
5	TripAdvisor Hotels Flights Restaurants	5
14	TripAdvisor Hotels Flights Restaurants	5
14	WeatherBug - Local Weather, Radar, Maps, Alerts	1
9	WeatherBug - Local Weather, Radar, Maps, Alerts	3
18	WeatherBug - Local Weather, Radar, Maps, Alerts	3
18	WeatherBug - Local Weather, Radar, Maps, Alerts	5
11	Yahoo Sports - Teams, Scores, News & Highlights	0
26	Yelp - Nearby Restaurants, Shopping & Services	0
18	Yelp - Nearby Restaurants, Shopping & Services	0
29	iQuran	0
3	iTranslate - Language Translator & Dictionary	0
13	iTranslate - Language Translator & Dictionary	0
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
WITH imputed_rating AS
(
  SELECT  app_name,
  COALESCE(ROUND(AVG(rating),2),0.00) as rating_imputed
  FROM appstore_transactions
  GROUP BY app_name
)
select at.user_id, ir.app_name, COALESCE(at.rating,ir.rating_imputed) as rating_imputed
  from
  appstore_transactions at 
  JOIN 
  imputed_rating ir 
  ON at.app_name = ir.app_name
  ORDER BY ir.app_name asc;