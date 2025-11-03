/*
Snapchat sending v opening snaps
Write a query that calculates time spent opening vs sending snaps as percentages by age bucket 
*/

WITH open_send_split AS (
  SELECT
    SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open_time,
    SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send_time,
    user_id
  FROM activities
  GROUP BY
    user_id
)

SELECT 
  age_bucket,
  ROUND(AVG((send_time/(send_time + open_time))*100.0), 2) AS send_perc,
  ROUND(AVG((open_time/(send_time + open_time))*100.0), 2) AS open_perc
FROM open_send_split os
INNER JOIN age_breakdown ab
USING(user_id)
GROUP BY age_bucket
ORDER BY age_bucket