/*
Amazon Average Review Ratings
Write a query that gives the average star rating by product by month
*/

SELECT 
  EXTRACT('month' FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY 
  EXTRACT('month' FROM submit_date),
  product_id
ORDER BY 
  mth,
  product
;