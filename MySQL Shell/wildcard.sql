SHOW DATABASES;
create schema Wildcard_Northwind;
select * from customers;
select * from products;
show tables;
use Wildcard_Northwind;
use northwind;



#Q1. From customers, find all customers whose company name starts with 'A'.
SELECT company FROM customers where company  LIKE '%A%';

#Q2. From products, find all products whose product_name contains the word 'sauce' anywhere. (case insensitive in MySQL)

SELECT  * from products where category like '%sauces%';

#Q3. From customers, find all customers whose last_name ends with 'n'.
select * from customers where last_name like '%n';


#Q4. From products, find all products whose product_name starts with 'Ch'.
select * from products where product_name like 'Ch%';
#Q5. From customers, find customers whose city contains 'on' anywhere in the name.
 select city from customers where city like '%on%';
 
 
#Q6. From orders, find all orders where ship_name starts with 'A' and ends with 's'.
select ship_name from orders where ship_name like 'A%s';

#Q7. From products, find all products whose product_code starts with 'N'. Display product_code and product_name.
select product_code,product_name from products where product_code like 'N%';

#Q8. From customers, find all customers whose email_address ends with '.com'.
select email_address from customers where email_address like '%.com';

select * from products;
#Q9. From products, find all products whose category contains 'beverages' OR product_name contains 'tea'. Use both conditions with OR.
select category,product_name from products where category like 'beverages' OR product_name like '%Tea%';

#Q10. From customers, find customers whose first_name is exactly 5 characters long. (Hint — use five underscores)
select first_name from customers where first_name like '_____';

#Q11. From orders, find orders where payment_type contains 'credit' — display order id, customer id, payment type.
SELECT id, customer_id, payment_type 
FROM orders 
WHERE payment_type LIKE '%credit%';

#Q12. From suppliers, find all suppliers whose company name contains either 'co' or 'Corp' anywhere. Use two LIKE conditions with OR.
select *
FROM  suppliers
WHERE  company like '%co%'
   OR  company like '%Corp%';


#Q13. From customers, find customers where country_region starts with 'U' — display name, city, country.alter
SELECT first_name, city, country  
FROM customers
WHERE country_region LIKE 'U%';

#Q14. From products, find products whose description is NOT NULL and contains the word 'organic'. (Hint — use IS NOT NULL AND LIKE together)
SELECT *
FROM products
WHERE description IS NOT NULL
  AND description LIKE '%organic%';
use northwind;
 
#Q15. From customers, find customers whose last_name has exactly 4 characters and ends with 'y'.
SELECT * 
FROM customers
WHERE last_name LIKE '___y';

#Q16. From orders, find all orders where notes contains a phone number pattern — meaning notes contain at least one digit sequence. (Hint — LIKE '%[0-9]%' or use REGEXP '[0-9]')
SELECT *
FROM employees
WHERE  notes REGEXP '%[0-9]%';

#Q17. From products, find all products where:
-- product_name starts with any letter from A to D AND
-- list_price > 20 AND
-- discontinued = 0
-- Display product name, list price, category. (Hint — use REGEXP '^[A-Da-d]' or multiple LIKE conditions)
SELECT product_name,list_price,category 
FROM products
WHERE product_name REGEXP '^[A-Da-d]' 
  AND list_price > 20
  AND discontinued = 0;
  

# Q18. From employees, find all employees whose FIRST_NAME starts with 'A'.
SELECT first_name
FROM employees
WHERE first_name like 'A%';

# Q19. From employees, find all employees whose LAST_NAME ends with 'n'.
SELECT last_name
FROM employees
WHERE last_name LIKE '%n';

# Q20. From jobs, find all jobs whose JOB_TITLE contains the word 'Manager'.
use hr;
SELECT * FROM jobs;
SELECT JOB_TITLE 
FROM jobs
WHERE JOB_TITLE LIKE '%Manager%';


# Q21. From employees, find employees whose EMAIL starts with 'S'.
SELECT email
FROM employees
WHERE email LIKE 's%';

# Q22. From departments, find all departments whose DEPARTMENT_NAME contains 'IT'.
SELECT department_name
FROM departments
WHERE department_name LIKE '%IT%';


# Q23. From employees, find employees whose PHONE_NUMBER starts with '515'.
SELECT phone_number
FROM employees
WHERE phone_number LIKE '515%';

# Q24. From locations, find all locations whose CITY starts with 'S'.
SELECT city 
FROM locations
WHERE city LIKE 'S%';

# Q25. From employees, find employees whose FIRST_NAME has exactly 4 characters. (Hint — four underscores)
SELECT first_name
FROM employees
WHERE first_name LIKE '____';

# Q26. From jobs, find all jobs whose JOB_ID starts with 'IT' or starts with 'FI'. Use two LIKE conditions.
SELECT job_id
FROM jobs
WHERE job_id LIKE 'IT%'
   OR job_id LIKE 'FI%';



# Q27. From employees, find employees whose LAST_NAME contains 'an' anywhere.
SELECT last_name
FROM employees
WHERE last_name LIKE '%an%';

# Q28. From locations, find all locations where STREET_ADDRESS contains a number at the start. (Hint — LIKE '[0-9]%' or REGEXP '^[0-9]')
SELECT STREET_ADDRESS 
FROM locations
WHERE street_address REGEXP '^[0-9]';

# Q29. From employees, find employees whose JOB_ID ends with 'MGR' or 'MAN'. (managers and senior roles)
SELECT JOB_ID
FROM employees 
WHERE JOB_ID LIKE '%MGR'
   OR JOB_ID LIKE '%MAN';

# Q30. From countries, find all countries whose COUNTRY_NAME contains 'ia' anywhere — display country name and region id.
SELECT country_name, region_id 
FROM countries
WHERE country_name LIKE '%ia%';


# Q31. From employees, find employees where FIRST_NAME starts with 'A' AND LAST_NAME starts with 'K' — display full name, department, salary.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM employees
WHERE  FIRST_NAME LIKE 'A%'
  AND  LAST_NAME LIKE '%K';
  
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM employees
WHERE FIRST_NAME LIKE 'A%'
  AND LAST_NAME LIKE 'K%';
  

# Q32. From employees, find employees whose FIRST_NAME is exactly 5 characters and the 3rd character is 'l'. (Hint — _ _ l _ _)
use hr;
SELECT first_name
FROM employees
WHERE first_name LIKE '__l__';

# Q33. From jobs, find jobs where JOB_TITLE contains either 'Representative' or 'Assistant' — display job title, min salary, max salary.
SELECT job_title,min_salary,max_salary
FROM jobs 
WHERE job_title LIKE '%Representative%'
   OR job_title LIKE '%Assistant%';

# Q34. From employees, find employees whose EMAIL contains their LAST_NAME — meaning the email starts with the first letter of the last name. (Hint — use LIKE with CONCAT and SUBSTR)
SELECT * 
from employees where email LIKE concat(substr(last_name,1,1),'%');

# Q35. From locations, find locations where STATE_PROVINCE is NOT NULL, NOT empty, and contains at least one space in it. (Hint — LIKE '% %')
SELECT * FROM locations 
WHERE state_province IS NOT NULL 
  AND state_province <> '' 
  AND state_province LIKE '% %';

# Q36. From employees, find all employees whose phone number follows the pattern '515..__' — meaning starts with 515, then dot, then any 3 digits, then dot, then any digits. Use LIKE with underscores to match the pattern.
SELECT * FROM employees 
WHERE phone_number LIKE '515.___._%';

# Q37. From employees, find how many employees exist per department whose FIRST_NAME starts with any vowel (A, E, I, O, U). Use multiple LIKE with OR.
 SELECT department_id, COUNT(*) as vowel_count
FROM employees 
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'E%' 
   OR first_name LIKE 'I%' 
   OR first_name LIKE 'O%' 
   OR first_name LIKE 'U%'
GROUP BY department_id;



# Q38. From products, count how many products per category have names containing 'e' anywhere. Show only categories with more than 2 such products.
use northwind;
SELECT * FROM products;

SELECT id, COUNT(*)  
FROM products
WHERE product_name LIKE '%e%'
GROUP BY id
HAVING COUNT(*) > 2;

# Q39. From employees, find departments where more than 2 employees have a JOB_ID ending with 'CLERK'. Show department id and count.
 SELECT department_id, COUNT(*) as clerk_count
FROM employees 
WHERE job_id LIKE '%CLERK' 
GROUP BY department_id 
HAVING COUNT(*) > 2;

# Q40. From customers, count how many customers per country_region have an email ending with '.com'. Show only countries with at least 2 such customers.
SELECT country_region, COUNT(*) as com_customers
FROM customers 
WHERE email LIKE '%.com' 
GROUP BY country_region 
HAVING COUNT(*) >= 2;
