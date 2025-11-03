/*
FAANG Well Paid Employees
Find employees who earn more than their direct manager
*/

SELECT 
  e1.employee_id,
  e1.name AS employee_name
FROM employee e1
INNER JOIN employee e2
ON e1.manager_id = e2.employee_id
WHERE e2.salary < e1.salary
;