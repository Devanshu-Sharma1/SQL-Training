-- create database SQL_Training
create database SQL_Data;


-- use database SQL_Training
use SQL_Data;

-- create table Department
create table tableDept
(
	DeptNo int primary key,
	DName varchar(30),
	Loc varchar(30)
)

-- create table Employee
create table tableEmp
(  EmpNo int Primary Key,
   EName varchar(30),
   Job varchar(30),
   MgrId int,
   HireDate Date,
   Salary float,
   Comm int,
   DeptNo int references tableDept(DeptNo)
)

--Insert into table Department
insert into tableDept Values(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON')

-- Insert into table Employee
Insert into tableEmp Values(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20)

Insert into tableEmp Values(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975, null,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,null,20),
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10)

--        ASSIGNMENT No:- 2

-- 1. Retrieve a list of MANAGERS. 
select distinct(mgr.EName) as 'Manager' from tableEmp emp join tableEmp mgr on emp.MgrId = mgr.EmpNo

-- 2. Find out the names and salaries of all employees earning more than 1000 per month. 
select EName, Salary from tableEmp where Salary > 1000

-- 3. Display the names and salaries of all employees except JAMES.
select EName, Salary from tableEmp where EName != 'James'

-- 4. Find out the details of employees whose names begin with ‘S’. 
select * from tableEmp where EName like 'S%'

-- 5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select * from tableEmp where EName like '%A%'

-- 6. Find out the names of all employees that have ‘L’ as their third character in their name. 
select * from tableEmp where EName like '__L%'

-- 7. Compute daily salary of JONES. 
select EName, (Salary/30) as 'Daily Salary' from tableEmp where EName = 'Jones'

-- 8. Calculate the total monthly salary of all employees. 
select SUM(Salary) as 'Total Monthly Salary' from tableEmp

-- 9. Print the average annual salary . 
select AVG(Salary*12) as 'Average Annual Salary' from tableEmp

-- 10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select e.EmpNo, e.EName, e.Job, e.Salary, e.DeptNo from tableEmp e except (select empNo, EName, Job, Salary, DeptNo from tableEmp where DeptNo = 30 and Job = 'Salesman') 
  
-- 11. List unique departments of the EMP table. 
select distinct(e.DeptNo), d.DName from tableEmp e join tableDept d on e.DeptNo = d.DeptNo

-- 12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select EName as 'Employee', Salary as 'Monthly Salary', DeptNo from tableEmp where Salary > 1500 and DeptNo in (10,30)

-- 13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select EName, Job, Salary from tableEmp where Job in ('Manager', 'Analyst') and Salary not in (1000,3000,5000)

-- 14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select EName, Salary, Comm from tableEmp where Comm > (Salary + (Salary * 10/100))
   
-- 15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select * from tableEmp where EName like '%L%l%' and DeptNo=30 or MgrId=7782

-- 16. Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees. 
select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from tableEmp
where DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE()))  >10 and DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) < 20

-- 17. Retrieve the names of departments in ascending order and their employees in descending order. 
select d.DeptNo, d.DName, e.EName from tableDept d, tableEmp e where d.DeptNo = e.DeptNo order by d.DName, e.EName desc

-- 18. Find out experience of MILLER.
select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from tableEmp where EName='Miller'