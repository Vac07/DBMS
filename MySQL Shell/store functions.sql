# ----------------------------------------------------- - 15-04-2026 - ----------------------------------------------------
# ----------------------------------------------------- - DELIMINATOR -----------------------------------------------------
USE hr;
delimiter $$ 
create function tb_get_emp_details(emp_id int)
returns varchar(100)
deterministic
begin
	declare f_name VARCHAR(100);
    SELECT concat(first_name,' ',last_name) into f_name
    from employees where employee_id= emp_id;
    return f_name;
end;;
$$ 
delimiter ;    
    
# ----------------------------------------------------------------------------------------------------------
-- annual income 
-- 

delimiter $$ 
create function to_get_annual_in(emp_id int)
returns decimal(7,1)
deterministic
begin
	declare ann_inc 
    decimal(7,1);
    SELECT salary * 12 
    into ann_inc
    from employees 
    where employee_id= emp_id;
    return ann_inc;
end;;
$$ 
delimiter ;
select to_get_annual_in(100); 

# ----------------------------------------------------------------------------------------------------------
-- find no of employees - department_id

delimiter $$ 
create function to_get_emp_id(dept_id int)
returns int
deterministic
begin
	declare number_of_emp int;
    SELECT COUNT(*) 
    into number_of_emp
    from employees 
    where department_id= dept_id
    group by department_id;
    return number_of_emp;
end;;
$$ 
delimiter ;
select to_get_emp_id(100);

drop function to_get_emp_id;

# ----------------------------------------------------------------------------------------------------------
-- to pass the emp_id and increment in the salary, fetch salary

delimiter $$
create function to_get_emp_id_incr(emp_id int, incr decimal(8,2))
returns decimal (10,2)
deterministic
begin
	DECLARE incr_sal 
    DECIMAL (10,2);
    SELECT salary+(salary*incr)
    INTO incr_sal
    FROM employees
    WHERE employee_id=emp_id;
    return incr_sal;
end;;
$$
delimiter ;

select to_get_emp_id_incr(101,0.20);

# ----------------------------------------------------------------------------------------------------------

 -- pass the empl-id and increment in the salary , fetch salary 
delimiter $$

create function to_get_emp_id_expr(join_date date)
returns varchar(100)
deterministic
begin
    declare yr_ex int;

    set yr_ex = timestampdiff(year, join_date, curdate());

    if yr_ex >= 10 then
        return concat(yr_ex, ' senior emp');
    elseif yr_ex >= 5 then
        return concat(yr_ex, ' mid level exp');
    else
        return concat(yr_ex, ' new join');
    end if;

end$$

delimiter ;

select to_get_emp_id_expr('1987-09-9');

select 
    department_id,
    group_concat(to_get_emp_id_expr(hire_date) separator '-') as hire_band
from employees
group by department_id;

-- Error Code: 1418. This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in  its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)drop function to_get_emp_id_expr;

select hire_date into hire_dt from employees;

# ----------------------------------------------------------------------------------------------------------

-- get dept current budget

delimiter $$ 
CREATE FUNCTION to_get_dept_current_budget(dept_id INT)
RETURNS float
DETERMINISTIC
BEGIN
	SELECT dept_
    ;

END$$
delimiter :
# ----------------------------------------------------------------------------------------------------------
-- get department_name and employee name

SELECT e.employee_name, e.department_name 
FROM employees e
JOIN departments d
ON e.dept_id=d.department_id;
show databases;
use hr;
show tables;
show databases;

# ----------------------------------------------------------------------------------------------------------

-- function

delimite $$
CREATE FUNCTIONS read_all_emp()
DETERMINISTIC
BEGIN 
	SELECT * FROM employees;
END$$

delimiter;

call read_call_emp();

USE hr;
SHOW DATABASES;


