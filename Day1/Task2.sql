create database school_management;
use school_management;
create table students(student_id int,first_name varchar(20),last_name varchar(20),email varchar(30),phone_number varchar(10),date_of_birth date);
create table courses(course_id int,course_name varchar(20),course_description varchar(50),credits int);

-- Add column
alter table students add column grade varchar(2);
alter table students modify column phone_number varchar(15);

-- insert data

insert into students values(1,"Sakshi","Shaha","sakshishaha101@gmail.com",'9876541230','2001-11-01',"A");
insert into students values(2,"Rani","Behare","abc@gmail.com",'9874563210','2001-11-10',"A");
insert into students values(3,"Gauri","vetal","xyz@gmail.com",'9876541230','2001-01-01',"A");

select * from students;

insert into courses values(101,"Java","It is Object_oriented programming Language",1);
insert into courses values(102,"Linux","It is Open Source",2);
insert into courses values(103,"C","It is general purpose programming Language",3);
insert into courses values(104,"CPP","It is programming Language",4);
insert into courses values(105,"AWS","It is Amazone Web Services",5);
select * from courses;

-- retrive data

select first_name,last_name,email from students;

-- Drop objects 
drop table students;
drop database school_management;