/*
3. Top Message Sender and Receiver
146
65%
Find top user(s) who have sent and received the most messages. Allow for ties and return answer ordered by total_messages desc

group by
union
filter
window
Hint #1
Can you think of how a union and flipping columns might help your answer?

Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
sender_id	msgs
1	35
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
twillio_sms_msgs	
message_id	bigint
sender_id	bigint
receiver_id	bigint
message_content_hashed	varchar
connection_quality	varchar
sent_at_date	timestamp

*/
WITH max_sent AS (
  SELECT sender_id,
  COUNT(sender_id) as msgs
  FROM twillio_sms_msgs
  GROUP BY sender_id
),
max_rec AS (
  SELECT receiver_id,
  COUNT(receiver_id) as msgs
  FROM twillio_sms_msgs
  GROUP BY receiver_id
),
together AS (
  SELECT sender_id AS user_id, msgs FROM max_sent
  UNION ALL
  SELECT receiver_id, msgs FROM max_rec
)
SELECT user_id AS sender_id, SUM(msgs) as msgs
FROM together
GROUP BY user_id
ORDER BY msgs DESC
LIMIT 1;