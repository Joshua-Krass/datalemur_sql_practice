/*
CVS Pharmacy Analytics Part 3
Display the highest selling manufacturers in a dashboard-ready format
Note: did not know PostgreSQL used pipes for concatenation
*/

SELECT 
  manufacturer,
  '$' ||
    CAST(ROUND(SUM(CAST(total_sales/1000000 AS NUMERIC)),0) AS VARCHAR) ||
    ' million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY 
  SUM(total_sales) DESC,
  manufacturer;