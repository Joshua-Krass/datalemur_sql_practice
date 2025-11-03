/*
Uber user's third transaction
Write a query to pull each user's third transaction, if applicable
*/
WITH trans_num AS (
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS transaction_num
  FROM transactions
)
SELECT 
  user_id,
  spend,
  transaction_date
FROM trans_num
WHERE transaction_num = 3;