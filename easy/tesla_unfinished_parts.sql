/*
Tesla unfinished parts
Write a query to display unfinished parts in the assembly
*/

SELECT 
  part,
  assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;