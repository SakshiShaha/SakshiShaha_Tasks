-- use database empdb
use empdb;

-- create table Departments 
-- 4. **Create a primary key constraint on the DepartmentID column in the Departments table.**
create table Departments(DepartmentID int,DepartmentName varchar(50) not null ,primary key(DepartmentID));

-- insert data into Departments table
insert into Departments values(1,'Marketing');
insert into Departments values(2,'Sales');
insert into Departments values(3,'IT');
insert into Departments values(4,'Finance');
insert into Departments values(5,'HR');

-- show records of Departments :
select * from Departments;

-- add column DepartmentID in table named employee 
alter table employees add column (Departmentid int);

desc employees;


-- update records for employee table 
update  employees set departmentid=1 where employee_id=1;
update  employees set departmentid=2 where employee_id=2;
update  employees set departmentid=1 where employee_id=3;
update  employees set departmentid=3 where employee_id=4;
update  employees set departmentid=2 where employee_id=5;
update  employees set departmentid=3 where employee_id=6;

select * from employees;

-- 2. Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table.
alter table employees add constraint fk_department foreign key (departmentid) references departments (departmentid);

-- create table Projects
create table Projects(ProjectID int,ProjectName varchar(100) not null);

--  5.Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table.
alter table Projects add column departmentid int,add foreign key(departmentid)references departments(departmentid);

-- insert record into Projects table:
insert into Projects values(1,'Project A',1);
insert into Projects values(2,'Project B',2);
insert into Projects values(3,'Project C',3);
insert into Projects values(4,'Project D',4);
insert into Projects values(5,'Project E',5);

-- 1.Create a constraint to ensure that the salary of an employee is greater than 0.
alter table employees add check (Salary>=0);

-- 3.Create a unique constraint on the Email column in the Employees table.
alter table employees add unique(email);

-- 7.Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT');

-- result : 0	19	12:41:04	insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT')	Error Code: 1062. Duplicate entry 'david.brown@company.com' for key 'employees.Email'	0.016 sec

-- 6. Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.
insert into employees values(14,'pqr','lmn','abc@gmail.com',59000,'IT',9);
-- Result : 0	61	15:53:31	insert into employees values(14,'pqr','lmn','abc@gmail.com',59000,'IT',9)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.094 sec

-- 8. Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.
delete from departments where departmentid = 1;
-- Result- 0	63	15:57:10	delete from departments where departmentid = 1	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.016 sec


-- 9. Update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation.
update employees set departmentid=8 where employee_id=1;

-- Result : 0	64	16:10:00	update employees set departmentid=8 where employee_id=1	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.032 sec