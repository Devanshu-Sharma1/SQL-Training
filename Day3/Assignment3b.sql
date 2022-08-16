-- Create tables

create table table_Clients(
	clientId int primary key,
	cName varchar(40) not null,
	cAddress varchar(30),
	email varchar(30) unique,
	phone bigint,
	business varchar(20) not null
)

create table table_Departments(
	deptNo int primary key,
	dName varchar(15) not null,
	loc varchar(20)
)

create table table_Employees(
	empNo int primary key,
	eName varchar(20) not null,
	job varchar(15),
	salary int check(salary > 0),
	deptNo int references table_Departments(deptNo)
)

create table table_Projects(
	projectId int primary key,
	descr varchar(30) not null,
	startDate date,
	plannedEndDate date,
	actualEndDate date,
	check(actualEndDate > plannedEndDate),
	budget int check(budget>0),
	clientId int references table_Clients(clientId)
)

create table table_EmpProjectTasks(
	projectId int references table_Projects(projectId),
	empNo int references table_Employees(empNo),
	startDate date,
	endDate date,
	task varchar(25) not null,
	empProjStatus varchar(15) not null  
	primary key (projectId,empNo)
)

-- Insert statements

insert into table_Clients values(1001,'ACME Utilities','Noida','contact@acmeuti.com',9567880032,'Manufactoring'),
(1002,'Trackon Consultants','Mumbai','contact@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaver Distributors','Kolkata','save@moneysave.com',7799886655,'Reseller'),
(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional')

insert into table_Departments values(10,'Design','Pune'),
(20,'Developement','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumabi')

insert into table_Employees values(7001,'Sandeep','Analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),
(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),
(7005,'Abhay','Designer',35000,10),
(7006,'Uma','Tester',30000,30),
(7007,'Gita','Tech. Writer',30000,40),
(7008,'Priya','Tester',35000,30),
(7009,'Nutan','Developer',45000,20),
(7010,'Smita','Analyst',20000,10),
(7011,'Anand','Project Mgr',65000,10)


insert into table_Projects values(401,'Inventory','2011-04-01','2011-10-01','2011-10-31',150000,1001),
(402,'Accounting','2011-08-01','2012-01-01',null,500000,1002),
(403,'Payroll','2011-10-01','2011-12-31',null,75000,1003),
(404,'Contact Mgmt','2011-11-01','2011-12-31',null,50000,1004)


insert into table_EmpProjectTasks values(401,7001,'2011-04-01','2011-04-20','System Analysis','Completed'),
(401,7002,'2011-04-21','2011-05-30','System Design','Completed'),
(401,7003,'2011-06-01','2011-07-15','Coding','Completed'),
(401,7004,'2011-07-18','2011-09-01','Coding','Completed'),
(401,7006,'2011-09-03','2011-09-15','Testing','Completed'),
(401,7009,'2011-09-18','2011-10-05','Code Change','Completed'),
(401,7008,'2011-10-06','2011-10-16','Testing','Completed'),
(401,7007,'2011-10-06','2011-10-22','Documentation','Completed'),
(401,7011,'2011-10-22','2011-10-31','Sign off','Completed'),
(402,7010,'2011-08-01','2011-08-20','System Analysis','Completed'),
(402,7002,'2011-08-22','2011-09-30','System Design','Completed'),
(402,7004,'2011-10-01',null,'Coding','In Progress')


-- select statements

select * from table_Clients

select * from table_Employees

select * from table_Departments

select * from table_Projects

select * from table_EmpProjectTasks