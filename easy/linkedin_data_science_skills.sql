/*
LinkedIn Data Science Skills
Show candidates who are qualified in Python, Tableau, and PostgreSQL ordered by candidate_id
*/

SELECT
  candidate_id
FROM (
  SELECT * 
  FROM candidates
  WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
) qualified
GROUP BY
  candidate_id
HAVING COUNT(*) = 3
ORDER BY candidate_id ASC;