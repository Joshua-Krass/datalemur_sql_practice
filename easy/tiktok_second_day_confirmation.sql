/*
TikTok Second Day Confirmation
Find users who confirm their account one day after signing up
*/

SELECT 
  e.user_id
FROM emails e
INNER JOIN texts t 
USING(email_id)
WHERE 1=1
  AND t.signup_action = 'Confirmed'
  AND t.action_date::date - e.signup_date::date = 1 
;