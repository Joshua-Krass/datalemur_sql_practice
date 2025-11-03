/*
LinkedIn duplicate job listings
Find the number of companies with a duplicate job posting
*/

SELECT
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT
    COUNT(*) AS num_postings,
    company_id,
    title,
    description
  FROM job_listings
  GROUP BY
    company_id,
    title,
    description
  HAVING COUNT(*) > 1
) dupes
;