SHOW DATABASES;
CREATE SCHEMA Foreign_key_constraints;
SHOW SCHEMAS;

USE Foreign_key_constraints;
SHOW TABLES;



-- Q1. Create authors
-- author_id INT (Primary Key, Auto Increment)
-- author_name VARCHAR(50)
CREATE TABLE authors(
	author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(50)
);
desc authors;

-- Q2. Create books
-- book_id INT (Primary Key, Auto Increment)
-- book_name VARCHAR(50)
-- author_id INT (Foreign Key)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE
CREATE TABLE books(
	book_id INT PRIMARY KEY AUTO_INCREMENT, 
    book_name VARCHAR(50),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE    
);



-- Q3. Create members
-- ● member_id INT (Primary Key, Auto Increment) 
-- ● member_name VARCHAR(50) 
CREATE TABLE members (
	member_id INT Primary Key Auto_Increment,
	member_name VARCHAR(50)
);

-- Q4. Create issued_books
-- ● issue_id INT (Primary Key, Auto Increment) 
-- ● book_id INT (Foreign Key) 
-- ● member_id INT (Foreign Key) 
-- ● ON DELETE SET NULL on book_id 
-- ● ON DELETE RESTRICT on member_id 
create table issued_books(
	issued_id int auto_increment primary key,
    book_id int,
    member_id int,
    foreign key(book_id) references books(book_id)
    on delete set null,
    foreign key(member_id) references members(member_id)
    on delete restrict
);

-- Q5.Insert: 
-- ● At least 3 authors 
-- ● At least 5 books (multiple books per author) 
insert into authors (author_name) values ('Author A'), ('Author B'), ('Author C');
insert into books (book_name, author_id) values ('Book 1', 1), ('Book 2', 1), ('Book 3', 2), ('Book 4', 3), ('Book 5', 2);


-- Q6.Insert: 
-- ● At least 3 members 
-- ● Issue at least 4 books to different members 
insert into members (member_name) values ('Gajendra'), ('Viraj'), ('Ajay');
insert into issued_books (book_id, member_id) values (1,1), (2,2), (3,3), (4,1);
SELECT * FROM members;

-- Q7. Delete an author who has written multiple books. 
delete from authors where author_id=1;

-- Q8. Update an author_id. 
update authors set author_id=20 where author_id=2;

-- Q9. SET NULL- Delete a book that is currently issued. 
delete from books where book_id=3;

-- Q10. Attempt to delete a member who has issued books. 
delete from members where member_id=1;		# Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`feb26`.`issued_books`, CONSTRAINT `issued_books_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE RESTRICT)

-- Q11.Delete issued records of a member and then deleted the member. 
delete from issued_books where member_id=1;
delete from members where member_id=1;

-- Q12.Attempt to insert into issued_books with a non-existing book_id (e.g., 999). 
insert into issued_books(book_id,member_id) values(999,2);		# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`feb26`.`issued_books`, CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL)

-- Q13.Attempt to update book_id in issued_books to a non-existing value. 
update issued_books set book_id=999 where issued_id=6;		# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`feb26`.`issued_books`, CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL)

-- Q14.Modify the schema such that: 
-- When a member is deleted, all corresponding issued records are also deleted.Write the required SQL statement. 
alter table issued_books drop foreign key issued_books_ibfk_2;
alter table issued_books add constraint fk_member foreign key (member_id) REFERENCES members(member_id) ON DELETE CASCADE;
delete from members where member_id=2;

select * from authors;
select * from books;
select * from members;
select * from issued_books;

--
-- Section B: Hospital Database 
--
-- Q15. 
-- Create doctors: 
-- ● doctor_id (Primary Key) 
-- ● doctor_name 
-- ● specialization 
create table doctors(
	doctor_id int primary key,
    doctor_name varchar(50),
    specialization varchar(20)
);

-- Q16. (CASCADE) 
-- Create patients_cascade: 
-- ● patient_id (Primary Key) 
-- ● patient_name 
-- ● doctor_id (Foreign Key) 
-- ● ON DELETE CASCADE 
create table patients_cascade(
	patient_id int primary key,
    patient_name varchar(20),
    doctor_id int,
    foreign key (doctor_id) references doctors(doctor_id) on delete cascade
);

-- Q17. 
-- Insert: 
-- ● At least 3 doctors 
-- ● Multiple patients under the same doctor 
insert into doctors values (1,'Dr A','Cardio'), (2,'Dr B','Neuro'), (3,'Dr C','Ortho');
insert into patients_cascade values (1,'P1',1), (2,'P2',1), (3,'P3',2);

-- Q18.Delete a doctor. 
delete from doctors where doctor_id=2;

-- Q19.Update doctor_id. 
update doctors set doctor_id=10 where doctor_id=1;	# Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`feb26`.`patients_cascade`, CONSTRAINT `patients_cascade_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE)

select * from doctors;
select * from patients_cascade;

--
-- Section C: College Database 
--
-- Q20. 
-- Create courses: 
-- ● course_id (Primary Key) 
-- ● course_name 
create table courses(
	course_id int primary key,
    course_name varchar(20)
);

-- Q21. (SET NULL) 
-- Create students_setnull: 
-- ● student_id 
-- ● student_name 
-- ● course_id (Foreign Key, should allow NULL) 
-- ● ON DELETE SET NULL 
create table students_setnull(
	student_id int primary key,
    student_name varchar(20),
    course_id int,
    foreign key(course_id) references courses(course_id) on delete set null
);

DROP TABLE student_setnull;
CREATE TABLE student_setnull (
	student_id INT PRIMARY KEY,
	student_name VARCHAR(30),
    course_id INT,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE SET NULL
);

-- Q22.Insert: 
-- ● At least 3 courses 
-- ● Students enrolled in different courses
insert into courses values (1,'CS'), (2,'IT'), (3,'AI');
insert into students_setnull values (1,'S1',1), (2,'S2',2), (3,'S3',3);

-- Q23.Delete a course. 
delete from courses where course_id=1;

-- Q24. INSERT INTO students_setnull VALUES ('X', 999);
insert into students_setnull values ('X',999);		# Error Code: 1136. Column count doesn't match value count at row 1
insert into students_setnull values(4,'S4',2);

select * from courses;
select * from students_setnull;

--
-- Section D: E-Commerce Database
--
-- Q25. 
-- Create categories: 
-- ● category_id (Primary Key) 
-- ● category_name 
create table categories(
	category_id int primary key,
    category_name varchar(20)
);

-- Q26. (RESTRICT) 
-- Create products_restrict: 
-- ● product_id 
-- ● product_name 
-- ● category_id (Foreign Key) 
-- ● ON DELETE RESTRICT 
create table products_restrict(
	product_id int primary key,
    product_name varchar(20),
    category_id int,
    foreign key (category_id) references categories(category_id) on delete restrict
);


-- Q27.Insert categories and products.
insert into categories values (1,'Electronics'), (2,'Clothing');
insert into products_restrict values (1,'Laptop',1), (2,'Shirt',2);

-- Q28. Attempt to delete a category that is referenced by products. 
delete from categories where category_id=1;		# Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`feb26`.`products_restrict`, CONSTRAINT `products_restrict_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`))

-- Q29. Delete dependent products and then delete the category.
delete from products_restrict where category_id=1;
delete from categories where category_id=1;

select * from categories;
select * from products_restrict;


