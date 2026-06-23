-- # ---------------------------------------- - INSERT ASSIGNMENT - ----------------------------------------

-- 1. Write a SQL statement to insert a record with your own value into the table countries against each column.
-- Here in the following is the structure of the table countries.
-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | COUNTRY_ID   | varchar(2)    | YES  |     | NULL    |       |
-- | COUNTRY_NAME | varchar(40)   | YES  |     | NULL    |       |
-- | REGION_ID    | decimal(10,0) | YES  |     | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+	
USE FEB26;
create table countries (
COUNTRY_ID VARCHAR(2),
COUNTRY_NAME VARCHAR(20),
REGION_ID DECIMAL(10,0)
);
insert into countries values(01,'Afghanisthan',10101010);
insert into countries value(02,'America',111111111.0),
							(03,'South Africa',198430224.2),
                            (04,'Ukrain',124522245.4),
                            (05,'India',23412453),
                            (06,'Shri lanka',98974323);
SELECT * FROM COUNTRIES;

-- 2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
-- Here in the following is the structure of the table countries.
-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | COUNTRY_ID   | varchar(2)    | YES  |     | NULL    |       |
-- | COUNTRY_NAME | varchar(40)   | YES  |     | NULL    |       |
-- | REGION_ID    | decimal(10,0) | YES  |     | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+	
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME) VALUES (07,'IRELAND');


-- 3. Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
-- Here in the following is the structure of the table countries.
-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | COUNTRY_ID   | varchar(2)    | YES  |     | NULL    |       |
-- | COUNTRY_NAME | varchar(40)   | YES  |     | NULL    |       |
-- | REGION_ID    | decimal(10,0) | YES  |     | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+	
CREATE TABLE COUNTRY_NEW(
COUNTRY_ID VARCHAR(2),
COUNTRY_NAME VARCHAR(40),
REGION_ID DECIMAL(10,0)
);

SELECT * FROM COUNTRY_NEW; 


-- 4. Write a SQL statement to insert NULL values against the region_id column for a row of countries table.
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME) VALUES('UK','UNITED KINGDOM');
 

-- 5. Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO countries(country_id, country_name) values('SA','SOUTH AFRICA'),
							('NZ','NEW ZEALAND'),
                            ('RS','RUSSIA');
SELECT * FROM  COUNTRIES;


-- 6. Write a SQL statement insert rows from country_new table to countries table.
-- Here are the rows for the country_new table. Assume that the country's table is empty.
-- +------------+--------------+-----------+
-- | COUNTRY_ID | COUNTRY_NAME | REGION_ID |
-- +------------+--------------+-----------+
-- | C0001      | India        |      1001 |
-- | C0002      | USA          |      1007 |
-- | C0003      | UK           |      1003 |
-- +------------+--------------+-----------+

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM country_new;

INSERT INTO country_new (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES 
('C1', 'India', 1001),
('C2', 'USA', 1007),
('C3', 'UK', 1003);



-- 7. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.


-- 8. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.


-- 9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.


-- 10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.


-- 11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.


-- 12. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.


-- 13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have existed into the table departments.


-- 14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.

