/*
Facebook App Click-through Rate
Calculate the click-through rate (clicks / impressions) of each app in 2022
*/

SELECT 
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),2) AS ctr
FROM events
WHERE 1=1
  AND EXTRACT('year' FROM timestamp) = 2022
GROUP BY
  app_id
;