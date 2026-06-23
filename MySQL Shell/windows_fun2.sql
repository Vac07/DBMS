# ----------------------- 14-04-2026  -----------------------
# ----------------------- hr -----------------------
# ----------------------- Windows function -----------------------

use hr;

# -------------------------------- -PARTITION  - ----------------------------------------------

SELECT employee_id, first_name, department_id, salary, sum(salary)
OVER (partition by department_id)  as_dept
FROM employees;
SELECT employee_id, first_name, department_id, salary, avg(salary)
OVER (partition by department_id)  as_dept
FROM employees;
SELECT employee_id, first_name, department_id, salary, min(salary)
OVER (partition by department_id)  as_dept
FROM employees;
SELECT employee_id, first_name, department_id, salary, max(salary)
OVER (partition by department_id)  as_dept
FROM employees;

# -------------------------------- -ORDER BY - ----------------------------------------------
SELECT employee_id, first_name, department_id, salary, min(salary)
OVER (order by salary)  as_dept
FROM employees;


# -------------------------------- -PARTITION & ORDER BY - ----------------------------------------------
SELECT employee_id, first_name, department_id, salary, min(salary)
OVER (partition by department_id order by salary)  as_dept
FROM employees;

# ---------------------------------------------------------------------------------------------------------

SELECT employee_id, first_name, department_id, salary, row_number() 
OVER (partition by department_id)  as_row
FROM employees
limit 5;

# ---------------------------------------------------------------------------------------------------------

SELECT employee_id, first_name, department_id, salary, row_number() 
OVER (partition by department_id order by salary desc )as_sal
FROM employees
where as_sal<=2;


# ---------------------------------------------------------------------------------------------------------
use hr;
WITH snd_hi as (
	SELECT employee_id, first_name, department_id, salary, row_number() 
	OVER (partition by department_id order by salary desc )  as_salary
   FROM employees
)
select * from snd_hi where as_salary<=2;

# WHERE YOU NEED TO FIND NEWLY OR DATED JOINED EMPLOYEE
-- EACH DEPT

WITH late_join AS (
SELECT employee_id, first_name, department_id, hire_date, 
row_number()
OVER(partition by department_id ORDER BY hire_date  desc) as_hire
from employees
)
select * from late_join WHERE as_hire=1;

select * from employees;


-- REMOVE EMPLOYEE+DEPARTMENT which contains DUPLICATES () READ

WITH late_join AS (
SELECT employee_id, first_name, department_id, hire_date, 
row_number()
OVER(partition by department_id ORDER BY hire_date  desc) as_hire
from employees
)
select * from late_join WHERE as_hire=1;




















