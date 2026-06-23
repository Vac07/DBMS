# -----------BLOB TEXT-----------------
create table student_blob(
    s_id int,
    f_name varchar(35) default 'for varchar',
    l_name char(20) default 'for char',
    about text,
    p_photo blob
);

insert into student_blob(s_id,about,p_photo) values (101,'I am so and so,studying in cdac kharghar','/Uploads/logo.jpeg');
select * from student_blob;

create table new_blob(
    s_id int,
    f_name varchar(35) default 'for varchar',
    l_name char(20) default 'for char',
    about text,
    p_photo blob
);
drop table studnt_blob2;

insert into new_blob(s_id,about,p_photo) values (101,'I am so and so,studying in cdac kharghar','/Upload/17.jpg');
select * from new_blob;

SHOW VARIABLES LIKE 'secure_file_priv';