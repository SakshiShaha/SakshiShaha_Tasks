-- Database :
create database empdb;
use empdb;

-- Create table employees :
create table employees(Employee_id int primary key,FirstName varchar(50)not null,LastName varchar(50)not null, Email varchar(100) not null,Salary int not null,Department varchar(50));

-- insert Records:

insert into employees values(1,'John','Doe','john.doe@company.com',60000,'Marketing');
insert into employees values(2,'Jane','Smith','jane.smith@company.com',75000,'Sales');
insert into employees values(3,'Michael','Johnson','michael.johnson@company.com',85000,'Marketing');
insert into employees values(4,'Emily','Williams','emily.williams@company.com',72000,'IT');
insert into employees values(5,'David','Brown','david.brown@company.com',65000,'Sales');
insert into employees values(6,'Sarah','Davis','sarah.davis@company.com',90000,'IT');
insert into employees values(7,'Robert','Miller','robert.miller@company.com',70000, 'Finance');
insert into employees values(8,'Jessica','Wilson','jessica.wilson@company.com',65000,'Finance');
insert into employees values(9,'Daniel','Anderson','daniel.anderson@company.com',72000,'IT',1);
insert into employees values(10,'Ashley','Taylor','ashley.taylor@company.com',58000,'Sales');
insert into employees values(11,'William','Brown', 'william.brown@company.com',78000,'Marketing');
insert into employees values(12,'Sophia','Davis','sophia.davis@company.com',62000,'HR');

-- Display records :
select * from employees;

-- 1.Create a constraint to ensure that the salary of an employee is greater than 0.
alter table employees add check (Salary>=0);

-- 2. Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table.
alter table employees add constraint fk_department foreign key (departmentid) references departments (departmentid);

-- 3.Create a unique constraint on the Email column in the Employees table.
alter table employees add unique(email);

-- 4. **Create a primary key constraint on the DepartmentID column in the Departments table.**
create table Departments(DepartmentID int,DepartmentName varchar(50) not null ,primary key(DepartmentID));

--  5.Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table.
alter table Projects add column departmentid int,add foreign key(departmentid)references departments(departmentid);

-- 6. Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.
insert into employees values(14,'pqr','lmn','abc@gmail.com',59000,'IT',9);
-- Result : 0	61	15:53:31	insert into employees values(14,'pqr','lmn','abc@gmail.com',59000,'IT',9)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.094 sec

-- 7.Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT');

-- result : 0	19	12:41:04	insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT')	Error Code: 1062. Duplicate entry 'david.brown@company.com' for key 'employees.Email'	0.016 sec

-- 8. Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.
delete from departments where departmentid = 1;
-- Result- 0	63	15:57:10	delete from departments where departmentid = 1	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.016 sec


-- 9. Update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation.
update employees set departmentid=8 where employee_id=1;

-- Result : 0	64	16:10:00	update employees set departmentid=8 where employee_id=1	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`empdb`.`employees`, CONSTRAINT `fk_department` FOREIGN KEY (`Departmentid`) REFERENCES `departments` (`DepartmentID`))	0.032 sec
-- 7.Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT');

-- result :0	19	12:41:04	insert into employees values(13,'abc','xyz','david.brown@company.com',70000,'IT')	Error Code: 1062. Duplicate entry 'david.brown@company.com' for key 'employees.Email'	0.016 sec



