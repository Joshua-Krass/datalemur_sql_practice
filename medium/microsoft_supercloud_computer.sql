/*
Microsoft Supercloud Computer
Return customers who have all 3 product categories
*/

SELECT
  customer_id
FROM (
  SELECT
    COUNT(DISTINCT product_category) AS num_categories,
    customer_id
  FROM customer_contracts
  INNER JOIN products
  USING(product_id)
  GROUP BY
    customer_id
  HAVING COUNT(DISTINCT product_category) = 3
) t