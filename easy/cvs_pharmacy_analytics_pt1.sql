/*
CVS Pharmacy Analytics Part 1
Display the 3 most profitable drugs
*/

SELECT 
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;