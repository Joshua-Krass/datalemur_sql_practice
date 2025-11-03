/*
FAANG second highest salary
Write a query that returns the second highest salary across all employees
	Note: I use a combination of DENSE_RANK() and DISTINCT to account for potential ties on either highest or second highest salary
*/
WITH salary_ranks AS (
  SELECT
    employee_id,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
  FROM employee
)

SELECT DISTINCT
  salary AS second_highest_salary
FROM salary_ranks
WHERE salary_rank = 2;