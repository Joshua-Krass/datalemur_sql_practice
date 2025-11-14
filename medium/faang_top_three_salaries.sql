/*
FAANG Top Three Salaries
Return the employees with the three highest salaries in each department. If multiple employees tie, return them both.
*/

SELECT
  department_name,
  name,
  salary
FROM (
  SELECT 
    d.department_name,
    e.name,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY d.department_id 
                      ORDER BY e.salary DESC) AS rn
  FROM employee e
  INNER JOIN department d 
  USING(department_id)
) high_earners
WHERE rn <= 3
ORDER BY 
  department_name,
  salary DESC,
  name