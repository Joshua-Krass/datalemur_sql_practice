/*
PayPal Final Account Balance
Find the final balance of accounts based on deposit/withdrawals
note: ordering accounts marks question as incorrect
*/

SELECT 
  account_id,
  SUM(CASE 
    WHEN transaction_type = 'Deposit' THEN amount
    WHEN transaction_type = 'Withdrawal' THEN amount * -1
    END) AS final_balance
FROM transactions
GROUP BY
  account_id
;