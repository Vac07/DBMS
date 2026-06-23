#----------------------------------------- 13 - 04 - 2026 ---------------------------------------------------
 
# write a query to display country id or number of employees working in each country that has more than 5 employees;
#-- emp -- dept_id -- department table -- ;ocations_id
-- location -- having country_id and name

SELECT country_id,COUNT(*) no_of  FROM  employees e
INNER JOIN departments d
ON  e.department_id = d.department_id
INNER JOIN  locations l
ON d.location_id=l.location_id
GROUP BY l.country_id
having no_of>5
order by no_of; # Error Code: 1054. Unknown column 'no_of' in 'having clause'
-- from -- join -- group by-- having -- select -- order by

use hr;
SELECT * FROM LOCATIONS;
SELECT * FROM employees;
SHOW TABLES;

-- WRITE A QUERY TO FIND DEPT WITH MORE THAN 5 EMPLOYEES AND AVG SALARY SALE  > 5000;
SELECT d.DEPARTMENT_ID, count(*) no_of from  employees s
inner join DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
GROUP BY  d.DEPARTMENT_ID 
having no_of > 5 AND AVG (e.salary)>5000
ORDER BY no_of; # Error Code: 1146. Table 'hr.department_id' doesn't exist



select * from departments;

-- give the count of employees an averge slary per departent where departmet are id finance and sales;


SELECT d.department_id, d.department_name, COUNT(e.employee_id) no_of, avg(salary)  
FROM  employees e
INNER JOIN departments d
on e.department_id= d.department_id
WHERE  department_name IN('IT','FINANCE','SALES')
GROUP BY d.department_id
ORDER BY no_of;


SELECT d.department_id, d.department_name, COUNT(*) no_of, avg(salary)  
FROM  employees e
INNER JOIN departments d
on e.department_id= d.department_id
WHERE  department_name IN('IT','FINANCE','SALES')
GROUP BY d.department_id
ORDER BY no_of;


-- find all the non executie wqho lead teram of 3 and more employees earning above 4000 where the average salary exceed 5000;

SELECT e1.employee_id,d.department_id, d.department_name,
concat(e.first_name,' ',e.last_name),count(*) no_of, avg(e.salary)
from employees e
inner join employees e1
ON e.employee_id=e1.manager_id
inner join departments d
on e1.department_id=d.department_id
WHERE d.department_name!='Executive' and e.salary>400
GROUP BY e1.manager_id,d.department_id
having no_of>=3 and avg(e.salary)>5000
order by no_of; 
# Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'hr.e1.EMPLOYEE_ID' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
/*
SELECT 
    mgr.employee_id AS manager_id,
    d.department_name,
    CONCAT(mgr.first_name, ' ', mgr.last_name) AS manager_name,
    COUNT(emp.employee_id) AS team_size, 
    AVG(emp.salary) AS avg_team_salary
FROM employees emp
INNER JOIN employees mgr ON emp.manager_id = mgr.employee_id
INNER JOIN departments d ON mgr.department_id = d.department_id
WHERE d.department_name != 'Executive' 
  AND emp.salary > 4000
GROUP BY 
    mgr.employee_id, 
    d.department_name, 
    mgr.first_name, 
    mgr.last_name
HAVING team_size >= 3 
   AND avg_team_salary > 5000
ORDER BY team_size;
*/
  
use hr;
show tables;
select * from locations; 


# Que -- as hr you want level breakdown of job roles across america region , each city in america should have dictinct job roles;
-- find total No. of employees and there avg salary for cities having more 2 emps and avg >=sal 5000
-- exclude emps salary <3000

select l.city, r.region_name, count(e.employee_id) no_of,count(distinct e.job_id),avg(salary) avg_sal
from employees e inner join departments d on e.department_id= d.department_id
inner join locations l
on d.location_id=l.location_id
inner join countries c
ON c.country_id=l.country_id
inner join regions r
ON r.region_id= c.region_id
where r.region_name ='Americas\r' AND e.salary > 3000
GROUP BY l.city,r.REGION_NAME
having no_of > 2 and avg_sal> 5000
order by no_of;

select * from regions;

# -------------------------------------- - SUBQUERY - ---------------------------------------------------------

-- from 
select count(*) from employees
where DEPARTMENT_ID=90;


SELECT first_name,(select department_name from departments
where DEPARTMENT_ID=90) AS no_of_emp_dept
FROM employees;



-- find the employees with the same job_id as employee_id 100

SELECT job_id 
FROM employees 
WHERE employee_id='100';


SELECT CONCAT(FIRST_NAME,' ',LAST_NAME), JOB_ID, DEPARTMENT_ID
FROM employees
WHERE job_id = (SELECT job_id 
FROM employees 
WHERE employee_id='100');

SELECT * FROM employees ORDER BY salary;


-- find the employees, working in dept located in new york;

--  SELECT employee_id, first_name, department_id,  --outer
SELECT * FROM departments;
SELECT * FROM locations;

SELECT location_id 
FROM locations
WHERE STATE_PROVINCE='Texas';

SELECT department_id 
FROM departments 
WHERE location_id='1400';

SELECT employee_id, first_name, department_id 
FROM employees 
where department_id = '60';


SELECT employee_id, first_name, department_id 
FROM employees 
where department_id= (SELECT department_id 
FROM departments 
WHERE location_id=(SELECT location_id 
FROM locations
WHERE STATE_PROVINCE='Texas'));

-- USING JOIN 
SELECT employee_id, first_name, department_id 
FROM employees
WHERE department_id = (SELECT d.department_id FROM departments d
INNER JOIN locations l
ON d.location_id=l.location_id
WHERE STATE_PROVINCE='Texas');


-- FIND EMPLOYEE WORKING IN DEPARTMENT LOCATED AT SEATLE
/*SELECT location_id, country_id 
FROM loactions l
WHERE city = (SELECT d.location_id FROM locations l
INNER JOIN locations l
ON d.location_id=l.location_id
WHERE STATE_PROVINCE='Seatle');
*/
select * from locations;

SELECT e.employee_id, e.first_name, department_id 
FROM employees
WHERE department_id = (SELECT d.department_id FROM departments d
INNER JOIN locations l
ON d.location_id=l.location_id
WHERE STATE_PROVINCE='Seatle');

SELECT d.department_id 
FROM departments
WHERE department_id = (SELECT d.department_id FROM departments d
INNER JOIN locations l
ON d.location_id=l.location_id
WHERE STATE_PROVINCE='Seatle');


-- find employees who have past job records
show tables;
select * from job_history;
select * from employees;

-- 
SELECT department_id, avg(salary) avg_sal
FROM employees
GROUP BY department_id;


SELECT department_id, avg(salary) avg_sal
FROM employees
GROUP BY department_id;

SELECT AVG(SALARY) 


-- ------------
with to_check_manager as(select department_id,location_id,manager_id from departments)

select ();



-- find the higheest salary in each department
with abc as (
select max(salary), department_id
from employees
group by department_id)
select distinct e.department_id,first_name, salary
from employees e, abc a
where e.department_id=a.department_id;


-- find the employees who are earning more than their manager
-- cte -  manager/salary
-- emp salary > manager salary

WITH man_sal as (
SELECT salary, employee_id  mng_id, first_name, salary, manager_id 
FROM employees
)

SELECT e.first_name,e.salary,concat(m.first_name) as manager_name, m.salary
FROM employees s 
JOIN mang_sal m
ON m.mng_idea
      WHERE employee_id = manager_id and employee_salary
);
 
 
 # ----------------------- .txt ----------------------------
 use hr;
select * from locations;
-- write a query to display country_id and number of emp working in each 
-- country that has more than 5 employees

-- empl -- dept_id -- department table -- location_id - 
-- location -- have country id and name 

select country_id, count(*) no_of from employees e 
inner join departments d 
on e.department_id=d.department_id
inner join locations l 
on d.location_id=l.location_id
group by l.country_id
having no_of>5
order by no_of; 

-- from --join -- group by --having-- select -- order by 

-- wrtq to find dept with more than 5 empp and avg sala >5000.

select d.department_id,d.department_name, count(*) no_of 
from employees e 
inner join departments d 
on e.department_id=d.department_id
group by d.department_id
having no_of>5 and avg(e.salary)>5000
order by no_of; 

select d.department_id, count(*) no_of 
from employees e 
inner join employees d 
on e.department_id=d.department_id
group by d.department_id
having no_of>5 and avg(e.salary)>5000
order by no_of; 

select department_id from employees where department_id=90;

-- no_of emp and avg salary/dept where department are IT, Finnamce , sales;
select d.department_id,d.department_name, count(*) no_of ,avg(salary)
from employees e 
inner join departments d 
on e.department_id=d.department_id
where department_name in('IT','Finance','Sales')
group by d.department_id
order by no_of; 

-- from -- where - join -- group -- count-- select -- order by 

-- find all the non executive mang who lead teams of 3 or more emp earning above 4,000
-- where the avg salary exceed 5000 

select e1.manager_id,d.department_id,d.department_name,
concat(e.first_name,' ',e.last_name), count(*) no_of ,avg(e.salary)
from employees e 
inner join employees e1 
on e.employee_id=e1.manager_id
inner join departments d 
on e1.department_id=d.department_id
where d.department_name != 'Executive' and e.salary>4000
group by e1.manager_id,d.department_id
having no_of>=3 and avg(e.salary)>5000
order by no_of; 


select * from departments;
select * from employees;
select e1.manager_id,
concat(e.first_name,' ',e.last_name)
from employees e 
inner join employees e1 
on e.employee_id=e1.manager_id
inner join departments d 
on e1.department_id=d.department_id
where d.department_name != 'Executive' and e.salary>4000;

select e.first_name,r.region_name
from employees e
join regions r;

create table join_un(A int, B int);
insert into join_un values(1,0),(1,1),(0,1),(0,0);

create table join_un1(X int, Y int);
insert into join_un1 values(1,0),(1,1),(0,1),(0,0),(1,1),(1,null);

select * from join_un;
select * from join_un1;

select u.A,u1.X
from join_un u
inner join join_un1 u1
on u.a=u1.x;

-----------------------------------------------------------

create table join_un(A int, B int);
insert into join_un values(1,0),(1,1),(0,1),(0,0);

create table join_un1(X int, Y int);
insert into join_un1 values(1,0),(1,1),(0,1),(0,0),(1,1),(1,null);

select * from join_un;
select * from join_un1;

select u.A,u1.X
from join_un u
inner join join_un1 u1
on u.a=u1.x;

-----------------------------------------------------------

-- as hr -- city level breakdown - job roles -- America region
-- each city in amreica  should have  distinct job roles
-- total nof or emp and avg sal 
-- for city having more than 2 emp and avg sal 5000 + 
-- exculde emp salary less than 3000 

select l.city, r.region_name, count(e.employee_id) no_of,
count(distinct e.job_id),avg(salary) avg_sal
from employees e inner join departments d 
on e.department_id =d.department_id
inner join locations l
on d.location_id= l.location_id
inner join countries c
on c.COUNTRY_ID=l.COUNTRY_ID
inner join regions r
on r.REGION_ID=c.REGION_ID
where r.region_name='Americas\r' and e.SALARY > 3000
group by l.city,r.REGION_NAME
having no_of >2 and avg_sal > 5000
order by no_of;

select * from regions;

-----------------------------------------------------------

-- from 

select department_name from  
(select department_name from departments 
where department_id=100) as dept_table ;

# Error Code: 1248. Every derived table must have its own alias
select department_name from departments 
where department_id=100;

select count(*) from employees
where DEPARTMENT_ID=90;

select first_name ,(select department_name from departments
where DEPARTMENT_ID=90) as no_of_emp_dept
from employees;

-- find employee with same job id as employee id 100
select job_id, salary from employees where employee_id =106;

select job_id, salary from employees where salary =4800;

select concat(first_name,' ',last_name), job_id,department_id 
from employees where (JOB_ID,salary)=
(select job_id,salary from employees where employee_id =106);


select * from employees order by salary;


-- find the employee working in dept located in New york

-- select employee_id, first_name,department_id-- outer 
select * from departments;
select * from locations;

select location_id from locations where STATE_PROVINCE ='Texas';

select department_id from departments where location_id =1400;

select employee_id, first_name,department_id from employees where department_id =60;

select employee_id, first_name,department_id from employees 
where department_id =
(select department_id from departments 
where location_id=
(select location_id from locations where STATE_PROVINCE ='Texas'));

select employee_id, first_name,department_id from employees 
where department_id =
(select d.DEPARTMENT_ID from departments d
inner join  locations l
on d.location_id=l.LOCATION_ID
where STATE_PROVINCE='Texas');

-- find employee working in departmnet located at seatle


select e.employee_id, e.first_name,department_id from employees e
where department_id in
(select d.DEPARTMENT_ID from departments d
inner join  locations l
on d.location_id=l.LOCATION_ID
where city='Seattle');

#Error Code: 1242. Subquery returns more than 1 row

select d.DEPARTMENT_ID from departments d
inner join  locations l
on d.location_id=l.LOCATION_ID
where city='Seattle';


-- find employees who have past job records 
show tables;
select * from job_history;

select employee_id , first_name, department_id
from employees where employee_id in(
select e.employee_id from job_history j
join employees e
on e.employee_id=j.employee_id
);

select employee_id, first_name from employees
where salary = any(select salary from employees);

select employee_id, first_name from employees
where salary > any(select salary from employees);

select employee_id, first_name from employees
where salary < any(select salary from employees);

select employee_id, first_name,salary from employees
where salary = any(select max(salary) from employees);

select employee_id, first_name, salary from employees
where salary > any(select max(salary) from employees);

select employee_id, first_name, salary from employees
where salary < any(select max(salary) from employees);

-----------------------------------------------------------

create database movie_db;
use movie_db;
show tables;

-----------------------------------------------------------

-- find regions where all countries have at least one location 
use hr;
select r.region_id , r.region_name
from regions r
where 0< 
all(select count(l.location_id) from countries c
left join locations l on c.country_id =l.country_id
);

select count(l.location_id) from countries c
left join locations l on c.country_id =l.country_id;

-- employee eraning more thsn all employees in finance dept 

select department_id from departments where department_name ='Finance';


select first_name, salary,department_id from employees where salary
>all(select salary from employees where department_id
=(select department_id from departments where department_name ='Finance'
));


select department_id, department_name from departments d
where exists 
(select 1 from employees e where e.department_id=d.department_id);

select department_id ,avg(salary) avg_sal
from employees
group by department_id 
having avg(salary) > (select avg(salary) from employees );  
 
 
select department_id ,avg(salary) avg_sal
from employees
group by department_id; 

select avg(salary) from employees;
 

-----------------------------------------------------------

select first_name, salary,department_id from employees where salary
>all(select salary from employees where department_id
=(select department_id from departments where department_name ='Finance'
));


with to_check_dept as(
select department_id from departments 
where department_name ='Finance'
)
select first_name,salary 
from employees e ,to_check_dept t
where e.department_id=t.department_id;

use hr;

with to_check_manager as(
select department_id,location_id,manager_id from departments 
)
select distinct e.MANAGER_ID ,first_name,salary
from employees e ,to_check_manager t
where e.manager_id=t.manager_id;

-----------------------------------------------------------

with emp_grt_total_avg_sal as
(
	select avg(salary) avg_sal from employees
)
select first_name, salary,department_id
from employees , emp_grt_total_avg_sal s where salary > s.avg_sal;

-- dept >5 emp

with more_5_emp as 
(
	select count(employee_id) no_of, DEPARTMENT_ID from employees 
    group by department_id
) select distinct m.department_id, m.no_of
from departments, more_5_emp m 
where m.no_of >5;

-- find the higest salary in each deapt 

with abc as (
select max(salary) mx,department_id from employees 
group by department_id)
select  e.department_id,first_name, salary
from employees e join abc a
on e.department_id=a.department_id
and e.salary=a.mx;

with sal_band as (
	select first_name, salary,
    case 
		when salary <10000 then 'Low Salary'
        when salary >=10000 and salary < 15000 then 'mid range Salary'
        when salary >=15000 and salary < 30000 then 'high range Salary'
	else 'other'
	end as salary_band
    from employees
)
select count(*), salary_band
from sal_band
group by salary_band;


-- find the employees who are earning more than their manager 
-- cte - manager /salary 
-- emp salar>manager salary

with mang_sal as (
	select EMPLOYEE_ID mng_id,first_name, salary,manager_id from employees
)
select e.first_name, e.salary , concat(m.first_name) as manger_name,m.salary manger_salary
from employees e 
join mang_sal m
on m.mng_id=e.MANAGER_ID
where e.salary>m.salary;

-- find employee who earn more than vag sala 
-- and have been in the company more than the avh tenure 
with avg_sal as
(select first_name ,employee_id, avg(salary) as sal_avg from employees),

yrs_exp as (
	 select EMPLOYEE_ID, year(hire_date) h_date, hire_date,salary from employees 
)
select first_name, sal_avg , h_date from 
avg_sal  s join  yrs_exp y
on s.EMPLOYEE_ID=y.EMPLOYEE_ID
where y.salary >s. sal_avg and 
timestampdiff(year,y.hire_date,curdate()) >20;

-----------------------------------------------------------


select timestampdiff(year,hire_date,curdate()) as exp  from employees;



select avg(now()- hire_date) from employees;
-- floor((now()- hire_date)/timestampdiff(year,hire_date,curdate()))


-----------------------------------------------------------


















