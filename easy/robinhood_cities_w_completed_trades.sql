/*
Robinhod Cities with Completed Trades
Find the three cities with the highest number of completed orders
*/

SELECT 
  city,
  COUNT(*) AS total_orders
FROM trades
INNER JOIN users
USING(user_id)
WHERE status = 'Completed'
GROUP BY
  city
ORDER BY COUNT(*) DESC
LIMIT 3
;