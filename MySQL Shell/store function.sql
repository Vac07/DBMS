show databases;
use hr;
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

delimiter $$
CREATE FUNCTIONS read_all_emp()
DETERMINISTIC
BEGIN 
	SELECT * FROM employees;
END$$

delimiter ;

call read_call_emp();

USE hr;
SHOW DATABASES;


# ----------------------------------------------------------------------------------------------------------

delimiter $$
CREATE PROCEDURE get_all_uding_iddetails(in emp_id int)
BEGIN 
	SELECT * FROM employees WHERE EMPLOYEE_ID = emp_id;
END
$$
Delimiter ;

call get_all_uding_iddetails(100);

# ----------------------------------------------------------------------------------------------------------
-- find the employees who are working in perticular department 
delimiter $$
CREATE PROCEDURE particular_department(in emp_id int, in n_salary float (10,2))
BEGIN 
	UPDATE employee_jn set salary=n_salary WHERE department_id = emp_id;
END
$$
Delimiter ;
drop procedure particular_department;

call particular_department(1202,6000);

# ----------------------------------------------------------------------------------------------------------


use FEB26;
CREATE TABLE students(
	st_id INT,
    s_n VARCHAR(50),
    m INT
);

delimiter $$
CREATE PROCEDURE insert_int_student(in st_id int, in s_n VARCHAR(50), IN m int)
BEGIN
	INSERT INTO students VALUES(st_id, s_n,m);
END
$$
delimiter ;
CALL insert_int_student(11,'Gajendra',70);

select * from students;

# ----------------------------------------------------------------------------------------------------------
use hr;
delimiter $$
CREATE PROCEDURE emp_details_using_dept_name(in emp_id int,out full_name VARCHAR(50),OUT sal float(10,2), OUT dept_name VARCHAR(50))
BEGIN
	SELECT concat(first_name,' ',last_name), salary, department_name into full_name, sal, dept_name
    FROM employees e 
    JOIN departments d
    ON e.dept_id = d.DEPARTMENT_ID
    WHERE employee_id= emp_id;
END
$$
delimiter ;
CALL emp_details_using_dept_name(20,@full_name,@sal,@dept_name);
drop procedure emp_details_using_dept_name;
# ----------------------------------------------------------------------------------------------------------

delimiter $$
CREATE PROCEDURE emp_dep_inout(inout emp_id int,out dept_id VARCHAR(50),OUT sal float(10,2), OUT dept_name VARCHAR(50))
BEGIN
	SELECT concat(first_name,' ',last_name), salary_department_name into full_name, sal, dept_name
    FROM employees e 
    JOIN departments d
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
    WHERE employee_id= emp_id
END
$$
delimiter ;
CALL emp_details_using_dept_name(20,@full_name,@sal,@dept_name);




