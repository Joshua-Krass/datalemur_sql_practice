/*
Facebook Average Post Hiatus part 1
Find the number of days between a user's first and last post in 2021, assuming the user has at least 2 posts
*/

SELECT 
  user_id,
  MAX(post_date)::date - MIN(post_date)::date AS days_between
FROM posts
WHERE 1=1
  AND EXTRACT('year' FROM post_date) = 2021
GROUP BY 
  user_id
HAVING COUNT(*) > 1