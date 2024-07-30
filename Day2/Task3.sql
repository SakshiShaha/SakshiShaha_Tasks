use empdb;


-- Select the first name, last name, and salary of the top 3 employees with the highest salaries.
select  FirstName,LastName,salary from employees order by salary desc limit 3;

-- Select the first name, last name, and salary of the top 3 employees with the lowest salaries.
select  FirstName,LastName,salary from employees  limit 3;

-- Select the first name, last name, and salary of the employee with the 2nd highest salary.
 select  FirstName,LastName,salary from employees order by salary desc limit 1,1;
 
 -- Select the first name, last name, and salary of the employee with the 2nd lowest salary.
 select  FirstName,LastName,salary from employees  limit 1,1;
 
 -- Select the first name, last name, and salary of the employee with the 3rd highest salary.
 select  FirstName,LastName,salary from employees order by salary desc limit 3,1;
 
 -- Select the first name, last name, and salary of the employee with the 3rd lowest salary.
 select  FirstName,LastName,salary from employees  limit 3,1;
 
 -- Select the first name, last name, email, and salary of employees with a salary between 65000 and 80000, ordered by their first name in descending order, and limit the result to 3 rows.
 select  FirstName,LastName,email, salary from employees where salary between 65000 and 80000 order by firstname desc limit 3;