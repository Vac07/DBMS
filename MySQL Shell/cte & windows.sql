#--------------------------------------------- - TCL - -----------------------------------------------------

-- Create database
CREATE DATABASE IF NOT EXISTS bank_demo;
USE bank_demo;

-- Drop tables if they exist (for clean start)
DROP TABLE IF EXISTS transaction_log;
DROP TABLE IF EXISTS accounts;

-- Create accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transaction log table
CREATE TABLE transaction_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Alice Johnson', 5000.00),
(2, 'Bob Smith', 3000.00),
(3, 'Charlie Brown', 7000.00),
(4, 'Diana Prince', 2000.00),
(5, 'Eve Wilson', 4500.00);

-- View initial data
SELECT * FROM accounts;

select * from employees;
select * from departments;
DESC employees;
insert into employees VALUES (2,207,'Gajendra','Rathod','gajendrarathod','987.965.2869',2026-03-20,'MK_MAN','working in IT',20000,0.00,124,50,'ACTIVE');
use hr;
INSERT INTO employees(EMPLOYEE_ID,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID,SALARY) VALUES (207,'RATHOD','gajendarathod','2026-03-12','MK_MAN',25000);
select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;

-- where salary <40000;

-- join in Hr DB with  employees table and department table

select emp.employee_id,emp.first_name, dept.department_id
from employees emp
JOIN departments dept ON emp.department_id=dept.DEPARTMENT_ID
group by dept.department_id
ORDER BY employee_id asc;
 
-- order by
SELECT 
    emp.employee_id, 
    emp.first_name, 
    dept.department_id
FROM employees emp
JOIN departments dept 
    ON emp.department_id = dept.department_id
ORDER BY dept.department_id ASC, emp.employee_id ASC;


-- where

SELECT emp.employee_id,
	emp.first_name,
    emp.last_name,
    dept.department_id
FROM employees emp
JOIN departments dept 
	ON emp.department_id = dept.department_id
WHERE dept.department_id=50
ORDER BY emp.department_id ASC;

-- FUNCTION 
# aanual salary

DELIMITER $$
CREATE FUNCTION annual_salary(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	RETURN (salary * 12);
END 
$$
DELIMITER ;

SELECT employee_id, first_name, salary,annual_salary(salary) as YEARLY_SALARY
FROM employees;
select employee_id, first_name,salary from employees; 
select * from employees;
select annual_salary(56350);

-- store procedure
-- get employee of a specific department
DELIMITER $$
CREATE PROCEDURE specific_department(IN dept_name VARCHAR(30))
BEGIN
	SELECT * FROM EMPLOYEES emp
    WHERE emp.department_id = dept_name;
END $$
DELIMITER ;

CALL specific_department('100');

-- CTE & WINDOWS
-- find the employees with salary > average salary

WITH avg_salary_cte AS(
	SELECT AVG(salary) AS avg_sal 
    FROM employees
)
SELECT e.*
FROM employees e, avg_salary_cte a
WHERE e.salary > a.avg_salary;


select employee_id, salary from employees
limit 4;
