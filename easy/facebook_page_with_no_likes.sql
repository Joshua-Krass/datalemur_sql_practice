/*
Facebook Page with no Likes
Write a query that returns Facebook pages without any likes, sorted by page_id
*/

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl 
USING(page_id)
WHERE pl.page_id IS NULL
ORDER BY page_id;