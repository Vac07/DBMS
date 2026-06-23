#------SET--------

create table Set_example(
item_name varchar(10),
item_option set('spicy','medium spicy','No capsicum','no onion'));

insert into Set_example values('Veg','Spicy');
# set allow to choose zero or more values  

insert into Set_example (item_name,item_option) values('Veg','No capsicum');
insert into Set_example (item_name,item_option) values('Veg','No capsicum,medium
spicy');
select * from set_example;

#------SET-2-------- (Multiple choice option)
create table candidate_set(
	c_id int,
    c_name varchar(25),
    educ char(15),
    exp int,
    skills set('Python','Java','SQL','R','Linux','AWS'));
    
    insert into candidate_set values(1, 'ABCDE', 'CS', 3, "Java,Python");
    
    select * from Candidate_set;
    
    
    
create table Fresher_set(
	c_id int,
    c_name varchar(25),
    educ char(15),
    exp int,
    skills set('Python','Java','SQL','R','Linux','AWS'),
    job_roles set('ML Engg','Data Anl','Data Engg','Data Sci','BDA','Cloud Engg'));
    
    insert into Fresher_set values(1, 'ABCDE', 'CS', 3, "Java,Python","ML Engg,Data Anl");
    
    select * from Fresher_set;


#----------- enum ------------- (radio button)

create table Employee_enum(
	c_id int,
    c_name varchar(25),
    educ char(15),
    exp int,
    skills set('Python','Java','SQL','R','Linux','AWS'),
    job_roles set('ML Engg','Data Anl','Data Engg','Data Sci','BDA','Cloud Engg'),
	gender enum('M','F','O','NP'));
    
    insert into Employee_enum (c_id,c_name,educ,exp,skills,job_roles,gender) values(2,'ABCDE', 'CS', 3, "Java,Python","ML Engg,Data Anl",'F');
    insert into Employee_enum (c_id,c_name,educ,exp,skills,job_roles,gender) values(3, 'ABCDE', 'CS', 3, "Java,Python","ML Engg,Data Anl",'M');
    
     select * from Employee_enum;
     
     select * from distinct c_id from Employee_enum;
     
     ###############################------NUMERIC------##################################
     create table employee_num(
     emp_id int,
     emp_name varchar(20),
     salary float,
     bonus decimal
     );
     
     select * from employee_num;
     
     
     
     # in the int data type we can store a negative value 
     # but in the float we can't use the negative value
     
     insert into employee_num value(5,'Sonu',20000,5000);
     select * from employee_num;
     
     select salary, salary/0 from employee_num;
     
     
	 select * from employee_num;
     select salary, salary/0 from employee_num; # showing the salary is null
     
     
############################# Date and Time ################################
create table emp_date(
emp_id int,
emp_name varchar(20),
dob date,
doj datetime,
login_time timestamp,
logout_time timestamp,
exp_yrs year
);

select * from emp_date;

insert into emp_date values(111,'Sanket','2003-06-18','2025-05-20 08;05:00',now(),now(),2026);
select * from emp_date;
select now();
select curdate();
select curtime();
select utc_timestamp();

select year(dob), month(dob),date(dob), day(dob),dayname(dob) from emp_date;
 
 select hour(doj), minute(doj),second(doj) from emp_date;
 
 #--------Diff


select datediff(curdate(),dob) as age from emp_date;

select datediff(curdate(),dob)/365 as age from emp_date;
select length(datediff(curdate(),dob)) as age from emp_date;

#----------------- Time Stamp --------------------=-
select timestampdiff(day,dob,now()) from emp_date;
select timestampdiff(year,dob,now()) from emp_date;
select timestampdiff(month,dob,now()) from emp_date;
select timestampdiff(week,dob,now()) from emp_date;

#####################################################
 # -------------- Virtual --------------------------
 
create table to_check_virtual
(
	f_name varchar(30),
    l_name varchar(30),
    full_name varchar(100) generated always as 
    (concat(f_name,' ',l_name)) virtual
);

select * from to_check_virtual;

insert into to_check_virtual(f_name,l_name) values('Gajendra','Rathod');

select * from to_check_virtual;
     
 
create table to_check_virtual_age
(
	f_name varchar(30),
    l_name varchar(30),
    full_name varchar(100) generated always as 
    (concat(f_name,' ',l_name)) virtual,
    dob date,
    doj date,
    age int generated always as
    (datediff(dob,doj)) virtual
);



     
     