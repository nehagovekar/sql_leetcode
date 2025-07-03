/*
Completed Shipments
0:05:27

28
Question
Solution
My submissions
User submissions
Let’s say that you’re a data scientist working on a distribution team at Amazon.

Create a report displaying which shipments were delivered to customers during their membership period.

If the transaction is shipped during the membership period, column is_member should have the value Y. If not, the column should have the value N.

Hint: You may assume that customer_id is unique and that shipments are made only to registered customers.

Example:

Input:

customers table

Column	Type
customer_id	INTEGER
membership_start_date	DATETIME
membership_end_date	DATETIME

*/
select shipment_id, ship_date,shipments.customer_id,
(CASE WHEN ship_date BETWEEN membership_start_date and membership_end_date THEN 'Y' ELSE 'N' END) 
AS is_member, quantity from customers
JOIN shipments
ON customers.customer_id=shipments.customer_id
