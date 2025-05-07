/*
52. Impute missing payment method
146
65%
Overwrite the payment method column with a value of "unknown" if no payment method exists. Order result by user_id asc and transcation_dt desc.

window
case
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
transaction_id	user_id	app_name	transaction_dt	payment_method	price	device	rating
16	2	Shanghai Mahjong	2022-03-17T20:53:16	credit	2.7	iPhone	1
6	2	PAC-MAN Premium	2022-03-17T00:32:04	debit	2.52	iPad	3
23	2	Lifesum ‚Äì Inspiring healthy lifestyle app	2022-03-05T07:38:31	unknown	0	Mac	2
3	3	iTranslate - Language Translator & Dictionary	2022-03-18T16:12:15	gift card	2.42	iPhone	
29	3	Shazam - Discover music, artists, videos & lyrics	2022-03-17T09:09:24	gift card	0.7	iPhone	
45	3	Cleartune - Chromatic Tuner	2022-03-06T16:56:25	credit	0.75	Mac	
26	5	TripAdvisor Hotels Flights Restaurants	2022-03-21T21:19:36	gift card	1.21	iPad	
41	7	Solitaire by MobilityWare	2022-03-26T22:17:16	debit	0.67	iPhone	4
39	7	Bank of America - Mobile Banking	2022-03-14T02:10:51	unknown	0	iPhone	
19	7	Mileage Log | Fahrtenbuch	2022-03-10T04:09:53	unknown	0	iPad	4
12	7	PAC-MAN Premium	2022-03-05T03:18:47	gift card	0.54	Mac	5
11	8	Bank of America - Mobile Banking	2022-03-28T00:35:52	gift card	0.28	iPhone	
8	8	Cleartune - Chromatic Tuner	2022-03-27T03:23:20	gift card	2.87	iPhone	2
15	8	Bible	2022-03-05T18:46:22	unknown	0	iPhone	1
35	9	WeatherBug - Local Weather, Radar, Maps, Alerts	2022-03-14T03:50:16	unknown	0	iPhone	
2	9	Solitaire by MobilityWare	2022-03-13T22:06:53	unknown	0	iPad	5
43	9	Bible	2022-03-06T23:05:52	gift card	2.5	Mac	2
46	10	Bank of America - Mobile Banking	2022-03-27T09:34:33	unknown	0	iPhone	5
40	10	Crash Bandicoot Nitro Kart 3D	2022-03-11T03:47:54	unknown	0	iPad	
5	11	Google ‚Äì Search made just for mobile	2022-03-23T23:16:52	gift card	1.04	Mac	1
30	11	Yahoo Sports - Teams, Scores, News & Highlights	2022-03-13T22:07:20	debit	2.07	Mac	
38	11	:) Sudoku +	2022-03-07T03:31:26	credit	0.98	Mac	1
49	12	Ms. PAC-MAN	2022-03-26T02:57:34	credit	2.05	iPhone	
14	13	iTranslate - Language Translator & Dictionary	2022-03-17T20:29:31	unknown	0	Mac	
34	14	WeatherBug - Local Weather, Radar, Maps, Alerts	2022-03-22T11:47:45	gift card	0.87	iPhone	1
9	14	Shanghai Mahjong	2022-03-16T09:46:23	unknown	0	Mac	5
4	14	TripAdvisor Hotels Flights Restaurants	2022-03-12T18:30:33	credit	2.68	iPad	5
7	14	SCRABBLE Premium	2022-03-05T03:15:04	unknown	0	iPad	
18	15	Hangman.	2022-03-11T19:05:47	apple pay	2.24	Mac	2
48	16	Google ‚Äì Search made just for mobile	2022-03-21T17:23:40	apple pay	2.86	iPhone	
42	18	WeatherBug - Local Weather, Radar, Maps, Alerts	2022-03-29T02:40:18	credit	2.44	iPad	
44	18	WeatherBug - Local Weather, Radar, Maps, Alerts	2022-03-20T23:44:30	unknown	0	Mac	5
25	18	Yelp - Nearby Restaurants, Shopping & Services	2022-03-17T05:26:24	unknown	0	iPad	
17	19	PayPal - Send and request money safely	2022-03-16T12:03:23	unknown	0	iPhone	3
36	20	Lifesum ‚Äì Inspiring healthy lifestyle app	2022-03-29T05:07:40	apple pay	0.31	iPad	4
1	21	Solitaire by MobilityWare	2022-03-25T03:40:19	unknown	0	iPhone	2
28	21	SCRABBLE Premium	2022-03-12T00:43:54	gift card	1.32	Mac	
33	21	PAC-MAN Premium	2022-03-10T18:15:59	gift card	2.76	iPad	
24	21	Bible	2022-03-04T02:34:16	gift card	2.98	iPhone	
22	22	Ms. PAC-MAN	2022-03-21T19:39:59	credit	1.14	Mac	1
10	23	SCRABBLE Premium	2022-03-11T21:26:12	unknown	0	iPhone	
37	24	Facebook	2022-03-23T07:55:47	credit	0.43	iPhone	2
27	25	SCRABBLE Premium	2022-03-01T06:40:15	credit	2.71	iPhone	
21	26	Google ‚Äì Search made just for mobile	2022-03-16T23:13:07	unknown	0	Mac	
32	26	Yelp - Nearby Restaurants, Shopping & Services	2022-03-06T03:15:37	unknown	0	iPhone	
20	26	Ms. PAC-MAN	2022-03-04T08:05:10	debit	1.53	iPad	4
31	27	PCalc - The Best Calculator	2022-03-22T02:07:48	credit	0.23	iPad	2
47	29	Google ‚Äì Search made just for mobile	2022-03-25T02:00:14	unknown	0	iPhone	
13	29	iQuran	2022-03-08T10:37:40	debit	2.32	iPhone	
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