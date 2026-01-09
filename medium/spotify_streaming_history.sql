/*
Spotify Streaming History
Return the number of song plays per user/song combo thru August 4
*/

SELECT 
  COALESCE(sh.user_id,sw.user_id) AS user_id,
  COALESCE(sh.song_id,sw.song_id) AS song_id,
  SUM(COALESCE(sh.song_plays,0)) + 
    SUM(CASE WHEN sw.listen_time IS NOT NULL THEN 1 ELSE 0 END) AS song_plays
FROM songs_history sh
FULL OUTER JOIN songs_weekly sw
  ON sh.user_id = sw.user_id
  AND sh.song_id = sw.song_id
WHERE 1=1
AND (EXTRACT('day' FROM listen_time) <= 4 OR listen_time IS NULL)
GROUP BY 
  1,2
ORDER BY 3 DESC
;