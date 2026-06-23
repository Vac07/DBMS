# ----------------------------------------------------- - VIEW - ----------------------------------------------------
CREATE VIEW emp_name_dept1 as 
SELECT DISTINCT department_id,employee_id,
CONCAT(first_name,' ',last_name) as full_name,
salary 
FROM employees; -- tricky

select * from emp_name_dept1;
select * from employees;

UPDATE employees set first_name='ABC' WHERE employee_id=100;

-- VIEW
-- LAB
-- windows, CTE, function, procedures 
-- . function, procedures - 10marks
-- . CTE, WIndows - 10 marks

