/*
61. The most expensive product per category
146
65%
For each product category, which product is the most expensive? Output the category, product name and price in the alphabetical order of category. Only return one product per category.

rank
filter
Hint #1
Company Similarity:

This problem simulates interviews conducted at the following companies.

Expected Output:

Your answer should match this structure exactly. Keep in mind SQL sorting, grouping, & rounding when answering.
category	product_name	price
book	Practical Statistics	16.99
clothing	Pantagonia Insulated Jacket	109.5
electronics	2021 Macbook 15 inch	1599.95
game	PlayStation 5	400
jewelry	14K Gold Ring	289.95
Source Tables:

Visualize the table definitions prior to formalizing your solution. Click the icon to see into the table's data.
amazon_products	
product_id	bigint
product_name	varchar
category	varchar
price	double
rating	bigint
published_at	date

*/
WITH ranking as(SELECT category, product_name, price,
  RANK() OVER (PARTITION BY category ORDER BY price DESC) as rnk
FROM amazon_products
GROUP BY  category,product_name, price)
SELECT category, product_name, price
FROM ranking
WHERE rnk=1
ORDER BY category ASC, product_name ASC, price ASC;