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
/*
Write a SQL query to identify the state that has gained the most citizens in the last 30 days, 
ordered by state_id. Output columns: state_id, citizen_growth
*/
SELECT n.state_id, COUNT(cnh.move_in_date) as citizen_growth FROM citizen_neighborhood_history cnh
JOIN neighborhood n 
ON cnh.neighborhood_id = n.neighborhood_id
WHERE move_in_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY n.state_id
ORDER BY n.state_id;

/*
Write a SQL query to list all citizens who have not lived in any neighborhood for at least a week. Output column: citizen_id
*/
WITH citizen_gap AS(
    SELECT citizen_id,
    move_out_date,
    LEAD(move_in_date) OVER (PARTITION BY citizen_id ORDER BY move_in_date) as next_move_in_date
    FROM citizen_neighborhood_history
),
citi_gap AS(
    SELECT citizen_id FROM citizen_gap
WHERE move_out_date is not null and (next_move_in_date-move_out_date>= INTERVAL'7 days' 
OR next_move_in_date is null)
),
homeless_citizens AS
(
    SELECT citizen_id FROM citizen_neighborhood_history
    GROUP BY citizen_id
    HAVING COUNT(move_in_date)=0
    and MAX(move_out_date)<NOW()-INTERVAL'7 days'
)
SELECT citizen_id from citi_gap
UNION 
SELECT citizen_id FROM homeless_citizens;
