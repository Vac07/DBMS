## ---------------------04/04/2026-----------------------------
create table to_check_virtual2
(
	f_name varchar(20),
    l_name varchar(20),
    dob date,
    doj date,
			full_name varchar(80) generated always as 
            (concat(f_name,' ',l_name)) virtual,
            age int generated always as
            (datediff(doj,dob)/365) virtual,
    salary int,
    bonus int,
    increment decimal(4,2),
    new_salary int generated always as (salary+((salary+bonus)+increment)) virtual
);

insert into to_check_virtual2(f_name,L_name, dob, doj,salary,bonus,increment) 
values('Gajendra','Rathod','2003-06-18','2026-02-26',25000,2000,.15);

select * from to_check_virtual2;



##-------------------------Skills set TO CHECK JSON --------------------------------------


create table to_check_json
(
	f_name varchar(20),
    l_name varchar(20),
    dob date,
    doj date,
			full_name varchar(80) generated always as 
            (concat(f_name,' ',l_name)) virtual,
            age int generated always as
            (datediff(doj,dob)/365) virtual,
    salary int,
    bonus int,
    increment decimal(4,2),
    new_salary int generated always as (salary+((salary+bonus)+increment)) virtual,
    skill_set json
);

insert into to_check_json(f_name,L_name, skill_set) 
values('Gajendra','Rathod','{"skill":["Python, Java"],"Certificates":["AWS Cloud","Python HackkerRank"],"edu":"CDAC"}');

select * from to_check_json;

select full_name,
	skill_set ->>'$.skill[0]' as skills,
    skill_set ->>'$.edu' as education from to_check_json;
    

    
