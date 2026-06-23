-- update
show tables;
select * from employees;

-- ex1
update employees set email='steven@gmail.com'
where employee_id = 10;

-- ex2
update employees set email='neena@gmail.com', hire_date=curdate() # updating the current date()
where employee_id = 101;

select * from employees;
-- ex3
 update employees set salary = salary+25000;
 SET  SQL_SAFE_UPDATES=0; -- MAKE A changes
 SET  SQL_SAFE_UPDATES=1; 

-- ex4
UPDATE employees SET salary=salary+(salary*.15)
WHERE TIMESTAMPDIFF(YEAR,CURDATE(),hire_date)<=20;

SELECT TIMESTAMPDIFF(YEAR,hire_date,CURDATE()) FROM employees;
SELECT* FROM employees WHERE TIMESTAMPDIFF(YEAR,CURDATE(),hire_date)<=20;

-- ex5
UPDATE employees SET job_desc='working in IT',hire_date=CURDATE()
WHERE department_id in (90,100,40,70);

-- exp6

select * from employees;
UPDATE employees SET avl='nonactive'
WHERE COMMISSION_PCT=0.00 AND avl='ACTIVE'; # Error Code: 1265. Data truncated for column 'avl' at row 1


-- self ex
CREATE TABLE TEMP SELECT * FROM employees;

select * from TEMP;

CREATE TABLE SALARY SELECT SALARY FROM employees; # ONLY COPY A 
select * from SALARY;

CREATE TABLE emp_update SELECT * FROM employees;
select * from emp_update;

-- ex7

SELECT * FROM emp_update;
UPDATE emp_update SET EMAIL = '';

ALTER TABLE emp_update ;
UPDATE emp_update SET EMAIL = NULL;


UPDATE emp_update set email = concat(FIRST_NAME,LAST_NAME,EMPLOYEE_ID,'@','gmail.com')
WHERE EMAIL=' ';


# Set to NULL: UPDATE table_name SET column_name = NULL;

# Set to Empty: UPDATE table_name SET column_name = '';













