/*
UnitedHealth Patient Support Analysis Part 1
Find the number of policy holders who made at least 3 calls
*/

SELECT 
  COUNT(policy_holder_id) AS policy_holder_count
FROM (
  SELECT 
    policy_holder_id,
    COUNT(DISTINCT case_id) AS num_calls
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(DISTINCT case_id) >= 3
) calls
;