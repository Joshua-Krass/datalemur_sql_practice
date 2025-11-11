/*
CVS Pharmacy Analytics Part 2
Display the manufacturer, count of drugs operating on a loss and total loss
*/

SELECT 
  manufacturer,
  COUNT(DISTINCT drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE 1=1
  AND total_sales - cogs < 0
GROUP BY
  manufacturer
ORDER BY total_loss DESC;