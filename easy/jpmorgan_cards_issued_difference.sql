/*
JPMorgan Cards Issued Difference
Find the difference between the highest and lowest card issuance months per card
*/

SELECT 
  card_name,
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY
  card_name
ORDER BY difference DESC;