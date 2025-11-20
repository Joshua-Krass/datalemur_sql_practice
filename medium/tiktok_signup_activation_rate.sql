/*
TikTok Signup Activation Rate
Find the activation rate (users who confirm their account) of all email users
*/

SELECT 
  ROUND(SUM(CASE 
    WHEN t.signup_action = 'Confirmed' THEN 1.0
    ELSE 0 END)/COUNT(DISTINCT e.email_id),2) AS confirm_rate 
FROM emails e 
LEFT JOIN texts t
USING(email_id);