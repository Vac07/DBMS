# /-/--/--/-/--/--/-/-/-/-/--/-/-/--/-/--/-/-/-/-/-/--/-/-/--/--/-/-
#-------------------------- - TRIGGER - ----------------------------
CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    department_id INT
);


CREATE TABLE employee (
  employee_id INT,
  name VARCHAR(50),
  salary FLOAT,
  department_id INT
);


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);

DELIMITER $$
CREATE TRIGGER before_insert_into_employee
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
	if new.salary is null then
		set new.salary=15000.0;
    end if;
    
END ;;
$$
DELIMITER ;

INSERT INTO employee (employee_id, name, department_id)
VALUES (111,'Gajendra',90);

INSERT INTO employee (name, department_id)
VALUES ('Sujal',90);

SELECT * FROM employee;


#-------------------------------------------------------------------
alter table employee add column email VARCHAR(25);
ALTER 

DELIMITER $$
CREATE TRIGGER before_insert_into_employee_eg3
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
	if new.email not like '%@%'
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='INVALID EMAIL TYPE';
    end if;
    
END ;;
$$
DELIMITER ;

SHOW TABLES;

INSERT INTO employee (employee_id, name,email)
VALUES (123,'TEJAS','ajkl@f');
 -- >>  Error Code: 1644. INVALID EMAIL TYPE

#-------------------------------------------------------------------



INSERT INTO employee (employee_id,name, salary)
VALUES ('JPHM DOE',50000.0);

SELECT * FROM employee;


 

# -- create a trigger to log message after employee insertion
CREATE TABLE employee_log(
	log_if INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
	if new.email not like '%@%'
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='INVALID EMAIL TYPE';
    end if;
    
END ;;
$$
DELIMITER ;

#-------------------------------------------------------------------

# TRIGGER TO AUTO_ GENERATE EMAIL WHEN EMPLOYEE IS INSERTED

DELIMITER $$
CREATE TRIGGER trg_generated_email
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
	INSERT INTO employee_email(emp_id,email)
    VALUES (NEW.employee_id,
    CONCAT(LOWER(REPLACE(NEW.name,'','.')),
    '@company.com')
);
END $$
DELIMITER ;

drop trigger trg_generated_email;

drop table employee_email;
CREATE TABLE employee_email(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30),
    creted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employee(employee_id, name, salary, department_id) VALUES (2345,'Devdatta',3000,90);

select * from trg_generated_email;
select * from employee_email;

#-------------------------------------------------------------------
-- DELETE 
SELECT * FROM deleted_employees;
CREATE TABLE deleted_employees(
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    SALARY INT, 
    DEPARTMENT_ID INT, 
    DELETED_BY VARCHAR(100));
    
DELIMITER $$
CREATE TRIGGER deleted_employees
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees(
		employee_id,
        name,
        salary, 
        department_id,
        deleted_by
)
VALUES (
	OLD.employee_id,
    OLD.name,
    OLD.salary,
    OLD.department_id,
    USER()
);

END $$
DELIMITER ;

-- CAN NOT DELETE EMPLOYEE - HAS BEEN WITH COMPANY FOR MORE THAN 10 YEARS

DELIMITER $$
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
	IF DATEDIFF(NOW(),OLD.hire_date) > 3650 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ' CAN NOT DELETE EMPLOYEE - HAS BEEN WITH COMPANY FOR MORE THAN 10 YEARS';
	END IF;
        
END $$
DELIMITER ;

SELECT * FROM before_employee_delete; 
DROP TRIGGER before_employee_delete;

#-------------------------------------------------------------------

-- CREATE ADMIN INFORMATION TABLE
CREATE TABLE admin_notifications(
	notification_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255),
    notification_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER

DELIMITER $$
CREATE TRIGGER trg_notify_after_delete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
	INSERT INTO admin_notifications(message, notification_type)
    VALUES (
		 CONCAT('Employee',OLD.name,'(ID ',OLD.employee_id,')has been removed from the system'), EMPLOYEE_DELECTED);
        
END $$
DELIMITER ;

 -- 
 DELIMITER $$
 CREATE TRIGGER before_update_trg
 BEFORE UPDATE ON employee
 FOR EACH ROW
 BEGIN 
		-- PREVENT SALARY DECREASE
        IF NEW.salary<OLD.salary THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error : Salary cannot be decreased !';
        END IF;
        
        -- PREVENT SALARY INCREASED MORE THAN 20 %
        IF NEW.salary<(OLD.salary*1.20) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error : Salary increased cannot exceed 20% !';
        END IF;
END $$

DELIMITER ;   

UPDATE employee SET salary = 7000 where employee_id = 12;    

#-------------------------------------------------------------------

-- AFTER UPDATE

DELIMITER $$
 CREATE TRIGGER after_salary_update
 AFTER UPDATE ON employee
 FOR EACH ROW
 BEGIN 
		IF OLD.salary<>NEW.salary THEN
			INSERT INTO salary_history (emp_id, first_name, old_salary, new_salary, department_id)
			VALUES (OLD.employee_id, OLD.name, OLD.salary, NEW.salary, OLD.DEPARTMENT_ID);
		END IF;
END $$
DELIMITER ;

UPDATE employee SET salary = 7000 where employee_id = 12;

BEGIN;
update bank_demo,








