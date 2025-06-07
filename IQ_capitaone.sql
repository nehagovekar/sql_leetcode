/*
Average Commute Time
0:00:00

36
Question
Solution
My submissions
User submissions
This query calculates the average commute time (in minutes) for each commuter in New York and the average commute time (in minutes) across all commuters in New York.

SELECT
  a.commuter_id,
  a.avg_commuter_time,
  b.avg_time
FROM (
  SELECT
    commuter_id,
    city,
    FLOOR(AVG(TIMESTAMPDIFF(MINUTE, start_dt, end_dt))) AS avg_commuter_time
  FROM rides
  WHERE city = 'NY'
  GROUP BY commuter_id
) a
LEFT JOIN (
  SELECT
    FLOOR(AVG(TIMESTAMPDIFF(MINUTE, start_dt, end_dt))) AS avg_time,
    city
  FROM rides
  WHERE city = 'NY'
) b
ON a.city = b.city
The first subquery calculates the average commute time for each commuter in New York. It does this by using the TIMESTAMPDIFF function, which calculates the difference between two DATETIME values in minutes. The GROUP BY clause is used to group the results by commuter_id and the AVG function is used to calculate the average commute time for each group.

The second subquery calculates the average commute time across all commuters in New York. It does this using the same approach as the first subquery, but without the GROUP BY clause. It doesn’t need the GROUP BY clause because we’re looking at the average commute time across all users regardless of how many trips they’ve taken.

The main query performs a left join between the results of the first and second subqueries. This combines each row in the first subquery with the single row in the second subquery.
*/
WITH average_time as (
SELECT  FLOOR(AVG(TIMESTAMPDIFF(MINUTE, start_dt, end_dt))) AS avg_time FROM rides
WHERE city='NY')

SELECT r.commuter_id, FLOOR(AVG(TIMESTAMPDIFF(MINUTE, r.start_dt, r.end_dt))) AS avg_commuter_time, at.avg_time
FROM rides r
CROSS JOIN average_time at 
WHERE r.city='NY'
GROUP BY r.commuter_id;

