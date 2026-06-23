DELIMITER $$

CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN

    RETURN a + b;

END $$

DELIMITER ;

SELECT add_numbers(10, 5);

use FEB26;

# ----------------------------------------------------
DELIMITER $$
CREATE FUNCTION add_var(a varchar(10), b varchar(10))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    RETURN a + b;

END 
$$

DELIMITER ;

SELECT add_var('10', '5');

# --------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION concat_var(a varchar(10), b varchar(10))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    RETURN concat(a, b);

END 
$$

DELIMITER ;
SELECT concat_var(1,3);

# --------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION SUB_INTEGER(a INT,b INT)
RETURNS INT
DETERMINISTIC
BEGIN 
		RETURN (a-b);
END
$$
DELIMITER ;
SELECT SUB_INTEGER(190,90);       

# --------------------------------------------------------------------------




-- Q. 2 Calculate bonus for employees from hr table
USE HR;
-- bonus should be 20% of salary
-- print total salary also
DELIMITER $$
CREATE FUNCTION CALC_BONUS(EMP_ID int)
RETURNS INT
DETERMINISTIC
BEGIN
		RETURN salary*0.20;
END
$$
DELIMITER ;
SELECT CALC_BONUS(10000);



# --------  MIN SALARY
DELIMITER $$
CREATE FUNCTION MINIMUM_SALARY(DEPT_ID int)
RETURNS INT
DETERMINISTIC
BEGIN
		DECLARE SALARY INT;
        SELECT MIN(SALARY) INTO SALARY FROM EMPLOYEES
        WHERE DEPARTMENT_ID= DEPT_ID;
        RETURN SALARY;
END
$$
DELIMITER ;
SELECT MINIMUM_SALARY(50);

SELECT * FROM EMPLOYEES;






	-- DECLARE bonus_emp int;
	-- SELECT salary * 0.20 into bonus_emp
--     FROM employees;


-- SELECT DEPARTMENT_ID,  CALC_BONUS(2000)FROM EMPLOYEES;
DROP FUNCTION CALC_BONUS;






