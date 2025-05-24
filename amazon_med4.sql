/*
75. The average spend amount per user
146
65%
What is the avg spend per user? Spend = quantity * price + shipping_cost. Return all the users and amounts in the alphabetical order of email. Round to 2 decimal places. Note return users even if they do not have transactions or have average order value of $0.

math
group by
join
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
email	total_amount
AAnderson1@yahoo.com	0
AElliott4@gmail.com	98.55
ALutz2@hotmail.com	0
ANichols2@yahoo.com	0
ASchultz5@yahoo.com	0
BLee3@hotmail.com	21.17
BRamirez5@hotmail.com	0
CHernandez1@hotmail.com	0
CHernandez4@gmail.com	578.54
CHernandez8@hotmail.com	116.24
CJohnston9@hotmail.com	104.45
CPineda7@hotmail.com	0
DGardner4@gmail.com	0
DMartinez8@yahoo.com	0
DMcgee3@hotmail.com	0
DWilliams8@yahoo.com	0
EBishop6@yahoo.com	0
EKhan2@gmail.com	567.55
EShannon6@yahoo.com	0
EWallace1@yahoo.com	0
FSmith3@yahoo.com	163.52
JGraham9@gmail.com	0
JJordan4@yahoo.com	24.28
JMoody4@yahoo.com	162.69
JNelson4@hotmail.com	0
JPearson3@yahoo.com	103.35
JRamirez3@yahoo.com	0
JWalker3@hotmail.com	353.92
KPerez4@hotmail.com	28.69
KTurner4@gmail.com	0
LTaylor9@hotmail.com	70.85
MJohnson7@gmail.com	184.06
MJones0@yahoo.com	0
MRobinson8@yahoo.com	51.41
MRuiz8@hotmail.com	27.55
MWhite2@gmail.com	101.36
PCarroll4@yahoo.com	301.05
RCaldwell9@yahoo.com	395.47
SColeman9@gmail.com	0
SHarris1@hotmail.com	337.88
SLiu7@gmail.com	30.81
SMcdonald7@yahoo.com	156.07
SOrtega3@gmail.com	0
SPreston3@gmail.com	350.71
TJones8@hotmail.com	18.42
TLogan3@gmail.com	18.21
TSantana7@gmail.com	0
VLiu0@yahoo.com	139.22
VReynolds0@hotmail.com	1397.04
WSims6@hotmail.com	0
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
amazon_products	
product_id	bigint
product_name	varchar
category	varchar
price	double
rating	bigint
published_at	date
amazon_transactions	
transaction_id	bigint
user_id	bigint
product_id	bigint
transaction_dt	timestamp
payment_method	varchar
shipping_cost	double
quantity	bigint
amazon_users	
user_id	bigint
first_name	varchar
last_name	varchar
email	varchar
country	varchar
joined_dt	timestamp
prime_member	bigint
prime_joined_dt	timestamp
Show Solution
1
2
3
4
5
6
7
8
9
⌄
SELECT au.email, COALESCE(ROUND(AVG(at.quantity*ap.price + at.shipping_cost),2),0) AS total_amount
FROM amazon_products ap 
JOIN amazon_transactions at 
ON at.product_id = ap.product_id
RIGHT JOIN amazon_users au 
ON au.user_id = at.user_id
GROUP BY au.email
ORDER BY au.email;

Connected
(Cloud SQL Engine)
View Docs
Run Query
Submit
Pro Tips: Ctrl + Enter runs query & Ctrl + Space enables autocomplete.

Congratulations thats the correct answer!
Query Output: (638ms)

Code SQL queries above and run them to see results in real time.
email	total_amount
AAnderson1@yahoo.com	0
AElliott4@gmail.com	98.55
ALutz2@hotmail.com	0
ANichols2@yahoo.com	0
ASchultz5@yahoo.com	0
BLee3@hotmail.com	21.17
BRamirez5@hotmail.com	0
CHernandez1@hotmail.com	0
CHernandez4@gmail.com	578.54
CHernandez8@hotmail.com	116.24
CJohnston9@hotmail.com	104.45
CPineda7@hotmail.com	0
DGardner4@gmail.com	0
DMartinez8@yahoo.com	0
DMcgee3@hotmail.com	0
DWilliams8@yahoo.com	0
EBishop6@yahoo.com	0
EKhan2@gmail.com	567.55
EShannon6@yahoo.com	0
EWallace1@yahoo.com	0
FSmith3@yahoo.com	163.52
JGraham9@gmail.com	0
JJordan4@yahoo.com	24.28
JMoody4@yahoo.com	162.69
JNelson4@hotmail.com	0
JPearson3@yahoo.com	103.35
JRamirez3@yahoo.com	0
JWalker3@hotmail.com	353.92
KPerez4@hotmail.com	28.69
KTurner4@gmail.com	0
LTaylor9@hotmail.com	70.85
MJohnson7@gmail.com	184.06
MJones0@yahoo.com	0
MRobinson8@yahoo.com	51.41
MRuiz8@hotmail.com	27.55
MWhite2@gmail.com	101.36
PCarroll4@yahoo.com	301.05
RCaldwell9@yahoo.com	395.47
SColeman9@gmail.com	0
SHarris1@hotmail.com	337.88
SLiu7@gmail.com	30.81
SMcdonald7@yahoo.com	156.07
SOrtega3@gmail.com	0
SPreston3@gmail.com	350.71
TJones8@hotmail.com	18.42
TLogan3@gmail.com	18.21
TSantana7@gmail.com	0
VLiu0@yahoo.com	139.22
VReynolds0@hotmail.com	1397.04
WSims6@hotmail.com	0
Footer
*/