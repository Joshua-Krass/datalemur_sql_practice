/*
IBM db2 Product Analytics
Build a histogram of number of employees by query execution count in 2023 Q3
note: this easy problem was way more difficult than almost every other easy problem so far, but maybe I overcomplicated the process.
*/

WITH q3_queries AS (
  SELECT DISTINCT
    query_id,
    employee_id
  FROM queries
  WHERE 1=1
    AND EXTRACT('year' FROM query_starttime) = 2023
    AND EXTRACT('quarter' FROM query_starttime) = 3
)
SELECT
  num_queries AS unique_queries,
  COUNT(full_name) AS employee_count
FROM (
  SELECT 
    SUM(CASE WHEN q.query_id IS NOT NULL THEN 1 ELSE 0 END) AS num_queries,
    e.full_name
  FROM employees e
  LEFT JOIN q3_queries q
  USING(employee_id)
  GROUP BY
    e.full_name
) query_buckets
GROUP BY num_queries
ORDER BY num_queries
;