/*
Since the number of exams is known, we can solve this using IF or CASE WHEN statements.

We will start by preparing our data to visualize what needs to be grouped. We used the IF statement to filter scores for specific exams.

SELECT student_name,
  IF(exam_id=1, score, NULL) AS exam_1,
  IF(exam_id=2, score, NULL) AS exam_2,
  IF(exam_id=3, score, NULL) AS exam_3,
  IF(exam_id=4, score, NULL) AS exam_4
FROM exam_scores
Since we need to display only one row for each student, we must apply grouping to previously obtained data, leading to a final solution.

SELECT student_name,
  SUM(IF(exam_id=1, score, NULL)) AS exam_1,
  SUM(IF(exam_id=2, score, NULL)) AS exam_2,
  SUM(IF(exam_id=3, score, NULL)) AS exam_3,
  SUM(IF(exam_id=4, score, NULL)) AS exam_4
FROM exam_scores
GROUP BY student_id;
Another solution using CASE WHEN statement has the similar logic as previous.

SELECT student_name,
  SUM(CASE WHEN exam_id=1 THEN score ELSE NULL END) AS exam_1,
  SUM(CASE WHEN exam_id=2 THEN score ELSE NULL END) AS exam_2,
  SUM(CASE WHEN exam_id=3 THEN score ELSE NULL END) AS exam_3,
  SUM(CASE WHEN exam_id=4 THEN score ELSE NULL END) AS exam_4
FROM exam_scores
GROUP BY student_id;
*/
SELECT student_name,
SUM(CASE WHEN exam_id=1 THEN score ELSE NULL END) as exam_1,
SUM(CASE WHEN exam_id=2 THEN score ELSE NULL END) as exam_2,
SUM(CASE WHEN exam_id=3 THEN score ELSE NULL END) as exam_3,
SUM(CASE WHEN exam_id=4 THEN score ELSE NULL END) as exam_4
FROM exam_scores
GROUP BY student_id
;

