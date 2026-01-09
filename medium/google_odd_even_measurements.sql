/*
Google Odd and Even Measurements
Calculate the odd- and even-numbered measurements each day (defined as when in the day the measurements occurred)
*/
WITH measure_ranks AS (
  SELECT 
    measurement_id,
    measurement_value,
    measurement_time,
    ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time)
                      ORDER BY measurement_time) AS rankk
  FROM measurements
)
SELECT
  DATE(measurement_time) AS measurement_day,
  SUM(CASE
    WHEN rankk % 2 = 1 THEN measurement_value
    ELSE 0 END) AS odd_sum,
  SUM(CASE
    WHEN rankk % 2 = 0 THEN measurement_value
    ELSE 0 END) AS even_sum
FROM measure_ranks
GROUP BY 1
ORDER BY measurement_day