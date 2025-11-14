/*
Amazon Highest-grossing Items
Find the top two products in sales per category in 2022
*/

WITH prod_spends AS (
  SELECT 
    category,
    product,
    SUM(spend) AS total_spend
  FROM product_spend
  WHERE 1=1
    AND EXTRACT('year' FROM transaction_date) = 2022
  GROUP BY 
    category,
    product
)
SELECT
  category,
  product,
  total_spend
FROM (
  SELECT
    category,
    product,
    total_spend,
    RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rk
  FROM prod_spends
) ranks
WHERE rk <= 2