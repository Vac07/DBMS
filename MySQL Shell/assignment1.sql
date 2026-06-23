create database Assignment;

use Assignment;

#---------------------------------------Assignment: Data Type 1 ---------------------------------------#
#---------------------------------------SECTION A: BEGINNER LEVEL--------------------------------------#

#Que. 1 . Create a table students_basic with the following columns:

create table students_basic (
	stud_id int,
	stud_name varchar(50),
	stud_age int
);

#Que. 2 Insert 5 records into students_basic.
insert into students_basic values
(111, 'Gajendra Rathod', 22),
(112, 'Rupendra Rajpurohit', 26),
(113, 'Gunjan patil', 23),
(114, 'Vivek Oberoy', 22),
(115, 'Sayali Sabale', 23);

# Que. 3 Select all records from the table.
select * from students_basic;

# Que. 4 Create a table products_basic with:

create table products_basic (
	product_id int,
	product_name varchar(100),
	price decimal(8,2)
);
# Que. 5 Insert 3 products and display them.
insert into products_basic values
(10001,'Note Book',150),
(10002,'Text Book',290),
(10003,'Pen',17.5);

select * from products_basic;

# Que. 6 Create a table employees_basic with:

create table employees_basic (
	emp_id int,
	emp_name varchar(50),
	joining_date date );

# Que. 7 Insert at least 4 employees and display only names and joining dates.
insert into employees_basic values
(501,'Ashutosh  Patil',"2024-10-25"),
(601,'Prathamesh Suryawanshi',"2025-01-17"),
(701,'Shubham Kambale',"2026-05-29");

select emp_name, joining_date from employees_basic;

# Que. 8 Create a table using CHAR and VARCHAR and insert values to observe differences.
create table observ_char_varchar (
	stud_id int,
    stud_name varchar(20),
    stud_clg char(10)
    );

insert into observ_char_varchar values
(111, 'Gajendra Rathod', 'Pachora, Dist:Jalgaon'),
(112, 'Rupendra Rajpurohit', 'Gat No. 237, Pune Bangalore Highway Touch, Dhangawadi Tal. Bhor, Pune, Maharashtra 412205'),
(113, 'Gunjan patil', 'Plot No. 46, near MSEB Sub Station, Sector-5, Kharghar, Panvel, Maharashtra 410210'); 

-- # Error Code: 1406. Data too long for column 'stud_clg' at row 1

select * from observ_char_varchar;
# Que. 9 Create table flags with a BOOLEAN column. Insert TRUE/FALSE values and display results.

create table flags(
	id int,
    status boolean
    );
		
insert into flags (id,status) values (1,true);
insert into flags (id,status) values (2,false);
insert into flags (id,status) values (3,true);
insert into flags (id,status) values (4,false);
insert into flags (id,status) values (5,true);

select * from flags;

# Que. 10 Create a table numbers_test using TINYINT, SMALLINT, and BIGINT. Insert sample values.

create table number_comparison(
	int_col INT,
    small_col SMALLINT,
    tiny_col TINYINT,
    big_col BIGINT
);
INSERT INTO number_comparison VALUES(100,100,100,100);



#---------------------------------------SECTION B : INTERMEDIATE LEVEL--------------------------------------#
#QUE. 11 Create a table students with:
		#-id (int primary key)
		#-name (varchar 100 not null)
		#-marks (float)
		#-grade (char 2)
        
CREATE TABLE student (
	stud_id INT PRIMARY KEY,
    stud_name VARCHAR(100) NOT NULL,
    stud_marks FLOAT,
    stud_grade CHAR(2)
);
        
# QUE. 12 Insert at least 6 records with varying marks.
INSERT INTO student VALUES
	(101,'Dhiraj',87.40,'B'),
    (102,'Gajendra',69.90,'C'),
    (103,'Sanket',80.50,'B'),
    (104,'Avishkar',65.30,'C'),
	(105,'Vivek',93.90,'A'),
    (106,'Karan',68.90,'C');
    
    SELECT * FROM student;

# QUE.13 Select students scoring more than 75 marks.
SELECT * FROM student where stud_marks > 75;  

# QUE. 14 Create a table orders with:
	#-order_id (int)
	#-order_date (datetime)
	#-amount (decimal 10,2)
    
CREATE TABLE orders (
	order_id INT, 
    order_date DATETIME,
    amount DECIMAL(10,2)
);
DROP TABLE orders;
# QUE.15 Insert records with different timestamps and query only date part.
INSERT INTO orders (order_id, order_date, amount) VALUES 
(1, '2023-10-01 10:30:00', 250.50),
(2, '2023-10-01 14:45:00', 120.00),
(3, '2023-10-02 09:15:22', 300.00),
(4, '2023-10-03 18:00:05', 450.75),
(5, '2023-10-04 11:20:00', 99.99);
											 

# QUE.16 Create a table users with ENUM for roles ("admin", "user", "guest"). Insert records.

CREATE TABLE users (
	user_id INT,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    roles ENUM('admin','users','guest')
);

INSERT INTO users VALUE
(111,'Gajendra','Rathod','admin'),
(112,'Yash','Rathod','users'),
(113,'Vivek','Savant','guest'),
(114,'Ashutosh','Patil','users'),
(115,'Devdatta','Thorat','guest');

SELECT * FROM users;

# QUE.17 Try inserting a value outside ENUM and observe behavior.data.
INSERT INTO users VALUE(116,'Devdatta','Thorat','guest');


# QUE.18 Create a table binary_test using BLOB and TEXT. Insert sample 
CREATE TABLE binary_test (
	blob_image BLOB,
    text TEXT
);
 SHOW VARIABLES LIKE 'secure_file_prev';
 
INSERT INTO binary_test VALUES 
 (load_file('"/Users/gajendra06/Downloads/compressed.jpg"'), 
"John Doe (male) or Jane Doe (female) are multiple-use placeholder names that are used in the British, Canadian, and American legal systems, when the true name of a person is unknown or is being intentionally concealed.[1][2][3] In the context of law enforcement in the United States, such names are often used to refer to a corpse whose identity is unknown or cannot be confirmed. These names are also often used to refer to a hypothetical 'everyman' in other contexts, like John Q. Public or 'Joe Public'. There are many variants to the above names, including John (or Richard)/Jane Roe, John/Jane Smith, Joe/Jane Bloggs, and Johnie/Janie Doe or just Baby Doe for children. The gender-neutral A. N. Other is also a placeholder name, mainly used in the United Kingdom.

In criminal investigation
In other English-speaking countries, unique placeholder names, numbers or codenames have become more often used in the context of police investigations. This has included the United Kingdom, where usage of 'John Doe' originated during the Middle Ages. However, the legal term John Doe injunction or John Doe order[4] has survived in English law and other legal systems influenced by it. Other names, such as 'Joe Bloggs' or 'John Smith', have sometimes been informally used as placeholders for an every-man in the UK, Australia, and New Zealand; however, such names are seldom used in legal and/or police circles in the same sense as John Doe.

Well-known legal cases named after placeholders include:

The landmark 1973 US Supreme Court decisions regarding abortion: Roe v. Wade ('Roe' being a pseudonym) and Doe v. Bolton (1973); and
The civil cases Doe dem. John Hurrell Luscombe v Yates, Hawker, and Mudge (1822) 5 B. & Ald. 544 (England),[5] McKeogh v. John Doe (Ireland; 2012)[3] and Uber Technologies, Inc. v. Doe I (California, 2015).[6]
In the investigative context, John Doe and Jane Doe are also used as designations for unidentified dead bodies.[7]");


# QUE.19 Create a table salary_test using DECIMAL and FLOAT. Insert same values and compare.

CREATE TABLE salary_test ( 
	emp_id INT,
    bonus DECIMAL(10,2),
    salary FLOAT(10,2)    
);
INSERT INTO salary_test VALUES
(2001,10000000000.00,2534562000.34); -- # Error Code: 1264. Out of range value for column 'bonus' at row 1


# QUE.20 Write a query to select records where amount is between 1000 and 5000.
select * from salary_test where salary >= 100000 and salary <= 150000;

#--------------------------------------- SECTION C: ADVANCED LEVEL --------------------------------------#

# QUE. 21. Create a table complex_types with: 
-- ● id (int) 
-- ● json_data (JSON) 
create table complex_types(
    id int,
    json_data json
);

# QUE. 22. Insert structured JSON data and query specific keys. 
insert into complex_types values(1,'{"name":"Sujal","skill":"Python"}');
select json_data ->> '$.name' as name, json_data ->> '$.skill' as subject from complex_types;

# QUE. 23. Create a table date_test with DATE, TIME, DATETIME, TIMESTAMP. Insert values and compare outputs. 
create table date_test(
    d date,
    t time,
    dt datetime,
    ts timestamp 
);
insert into date_test values('2026-02-25','10:10:10','2026-03-30 11:11:11',now());
select * from date_test;

# QUE. 24. Create a table auto_test with AUTO_INCREMENT primary key. Insert records without specifying id. 
create table auto_test(
    id int auto_increment primary key,
    name varchar(10)
);
insert into auto_test(name) values ('Sujal'),('Sanket');
select * from auto_test;

# QUE. 25. Create a table precision_test and test overflow in DECIMAL. 
create table precision_test(
    d decimal(5,2)
);
insert into precision_test values(999.99);
insert into precision_test values(9999.99);        # (overflow) Error Code: 1264. Out of range value for column 'd' at row 1

# QUE. 26. Create a table string_test and test max length for VARCHAR.
create table string_test(
    str varchar(5)
); 
insert into string_test values('Gajen');
insert into string_test values('RathodG');        # Error Code: 1406. Data too long for column 'str' at row 1

# QUE. 27. Create a table null_test with NOT NULL constraint. Try inserting NULL values.
create table null_test(
    id int not null
);
insert into null_test values(1);
insert into null_test values(null);        # Error Code: 1048. Column 'id' cannot be null

# QUE. 28.Create a table default_test with DEFAULT values and test insert behavior.
create table default_test(
    name varchar(10),
    course varchar(10) default 'BDA'
);
insert into default_test(name) values('Vijay');
insert into default_test(name) values('Sanjay');
select * from default_test;

# QUE. 29. Create a table mixed_types combining INT, FLOAT, VARCHAR, DATE, and BOOLEAN. Insert and query based on multiple conditions.
create table mixed_types(
    prod_id int,
    prod_name varchar(10),
    prod_price float,
    prod_pur_date date,
    prod_ava boolean
);
insert into mixed_types values(101,'Laptop',500.00,'2026-04-06',true);
select * from mixed_types;

# QUE. 30. Create a table where incorrect datatype insertion is attempted (e.g., string in INT). Observe and document behavior.
create table incorrect(
    id int,
    name varchar(10)
);
insert into incorrect values(1,'Gajendra');
insert into incorrect values(2,2);
insert into incorrect values('ABC',3);        # Error Code: 1366. Incorrect integer value: 'ABC' for column 'id' at row 1
select * from incorrect;













