/*
Microsoft Teams Power Users
Find the two users who sent the most messages in August 2022
*/
SELECT 
  sender_id,
  COUNT(*) AS message_count
FROM messages
WHERE 1=1
  AND EXTRACT('year' FROM sent_date) = 2022
  AND EXTRACT('month' FROM sent_date) = 8
GROUP BY 
  sender_id
ORDER BY COUNT(*) DESC
LIMIT 2;