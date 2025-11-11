/*
Alibaba Compressed Mean
Calculate the mean item order amount
Note: ROUND function requires numeric in numerator for POSGRESQL
*/

SELECT 
  ROUND(
    CAST(
      SUM(item_count*order_occurrences)/SUM(order_occurrences) 
    AS NUMERIC),
  1) AS mean
FROM items_per_order;