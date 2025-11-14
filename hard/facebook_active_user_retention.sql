/*
Facebook Active User Retention
Find July 2022's monthly active users, as defined by a user who is active two months in a row
Note: this query cheeses the solution by hardcoding "7" as the month variable but that's closer to real ad-hoc querying
*/

WITH june_july_events AS (
  SELECT 
    EXTRACT('month' FROM event_date) AS month,
    user_id,
    COUNT(*) AS num_records
  FROM user_actions
  WHERE 1=1
    AND EXTRACT('year' FROM event_date) = 2022
    AND EXTRACT('month' FROM event_date) IN (6,7)
  GROUP BY
    1,2
)

SELECT
  7 AS month,
  COUNT(user_id) AS monthly_active_users
FROM (
  SELECT
    COUNT(*) AS maus,
    user_id
  FROM june_july_events
  GROUP BY user_id
  HAVING COUNT(*) = 2
) t
;