/*
New Products


Last Updated: July 2025

Medium
ID 10318

242

Calculate the net change in the number of products launched by companies in 2020 compared to 2019. Your output should include the company names and the net difference.
(Net difference = Number of products launched in 2020 - The number launched in 2019.)

Table
car_launches
More about this question
Hints
Expected Output
All required columns and the first 5 rows of the solution are shown

company_name	total_launch
Toyota	-1
Honda	-3
Chevrolet	2
Ford	-1
Jeep	1

*/

WITH 2019_launch AS
(
SELECT company_name, COUNT(product_name) as 2019_c
FROM car_launches
WHERE year='2019'
GROUP BY company_name),
2020_launch AS (
SELECT company_name, COUNT(product_name) as 2020_c
FROM car_launches
WHERE year='2020'
GROUP BY company_name
)
SELECT 2019_launch.company_name, (2020_c - 2019_c) as total_launch FROM 2019_launch
JOIN 2020_launch
ON 2019_launch.company_name= 2020_launch.company_name;
