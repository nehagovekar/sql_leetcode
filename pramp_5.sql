/*
Neighborhoods
You are given the following tables:

citizen table
Column	Type
citizen_id	INTEGER
date_of_birth	TIMESTAMP
neighborhood table
Column	Type
neighborhood_id	INTEGER
state_id	INTEGER
country_id	INTEGER
center_lat	FLOAT
center_long	FLOAT
citizen_neighborhood_history table
Column	Type
citizen_id	INTEGER
neighborhood_id	INTEGER
move_in_date	TIMESTAMP
move_out_date	TIMESTAMP
Answer the following questions.

Write a SQL query that lists the top 3 neighborhoods with the youngest average ages of citizens. Output columns: neighborhood_id, average_age
*/
SELECT citizen_id, 
ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date_of_birth)),0) AS average_age
FROM citizen
GROUP BY citizen_id
ORDER BY average_age ASC
LIMIT 3;