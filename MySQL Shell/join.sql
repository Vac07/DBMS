# --------------------------------- - JOIN - -----------------------------------------------
USE hr;
CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);
    
select * from Department_jn;
select * from Employee_jn;

select e.emp_id,e.e_ename,e.department_id,d.department_name from employee_jn e
INNER JOIN
department_jn d ON d.dept_id=e.department_id;    
    
    
use northwind;
select * from customers;
select * from orders;

select c.first_name,c.city,
o.shipped_date,o.order_date
from 
orders o inner join customers c
on c.id=o.customer_id;





    
    