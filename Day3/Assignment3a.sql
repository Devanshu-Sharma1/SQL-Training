create table table_Book
(
	bookId int primary key,
	title varchar(50),
	author varchar(30),
	isbn bigint unique,
	published_date datetime
)

select * from table_Book

insert into table_Book values(1,'My First SQL Book','Mary Parker',981483029127,'2012-02-22 12:08:17')

insert into table_Book values(2,'My Second SQL Book','John Mayer',857300923713,'1972-07-03 09:22:45'),
(3,'My Third SQL Book','Cary Flint',523120967812,'2015-10-18 14:05:44')

-- 1. fetch details of books written by author whose name ends with er
   select * from table_Book
   where author like '%er'

-- 2. Review table
create table table_review
(
    id int primary key,
	book_id int references table_Book(bookId),
	reviewer_name varchar(30),
	content varchar(50),
	rating int,
	published_date datetime
)

select * from table_review

insert into table_review values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),
(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12'),
(3,2,'Alice Walker','Author review',1,'2017-10-22 23:47:10')

-- display title, author and reviewer name for all above book
select title, author, reviewer_name from table_Book join table_review
on bookId = book_id

-- 3. display name of reviewer who received more than one book
select reviewer_name from table_review
group by reviewer_name
having count(reviewer_name) > 1

-- 4. Customer table
create table table_cust(
    custId int primary key,
	custName varchar(30),
	age int,
	custAddress varchar(30),
	salary float
)

select * from table_cust

insert into table_cust values(1,'Ramesh',32,'Ahmedabad',2000.00)

insert into table_cust values(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',4500.00),
(7,'Muffy',24,'Indore',10000.00)

-- display name of customer who lives in same address which has 'o' character anywhere in address
   select custName from table_cust
   where custAddress like '%o%'

-- 5. Order table
create table table_Order(
     oId int primary key,
	 ordDate datetime,
	 customer_Id int references table_cust(custId),
	 amount int
)

select * from table_Order

insert into table_Order values(102,'2009-10-08',3,3000)
insert into table_Order values(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060)

-- write a query to display date, total no. of customer who placed order on same date 
   select ordDate, count(customer_Id) as 'Total Customer' from table_Order
   group by ordDate

-- 6. Employee table
create table table_Employee(
    empId int primary key,
	empName varchar(30),
	age int,
	empAddress varchar(30),
	salary float
)

select * from table_Employee

insert into table_Employee values(1,'Ramesh',32,'Ahmedabad',2000.00)

insert into table_Employee values(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null)

-- display the names of employee in lower case whose salary is null
   select Lower(empName) from table_Employee
   where salary is null

-- 7. Table studentDetails
create table table_StudentDetails(
       registerNo int primary key,
	   studName varchar(30),
	   age int,
	   qualification varchar(10),
	   mobileNo bigint,
	   mail_id varchar(50),
	   loc varchar(30),
	   gender varchar(2)
)

select * from table_StudentDetails

insert into table_StudentDetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

-- query to display total number of male and female
   select gender,count(gender) from table_StudentDetails
   group by gender

-- 8. table courseDetails and table courseRegistration
create table table_CourseDetails(
       cId varchar(20) primary key,
	   cName varchar(30),
	   startDate date,
	   endDate date,
	   fee float
)

select * from table_CourseDetails

insert into table_CourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

create table table_CourseRegistration(
	registerNo int references table_StudentDetails(registerNo),
	cId varchar(20) references table_CourseDetails(cId),
	batch varchar(5)
	primary key(registerNo,cId)
)

select * from table_CourseRegistration

insert into table_CourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

-- reterive courseName and number of student students registered for each course
-- between 2018-01-02 and 2018-02-28 and arrange result by cId desc
   select cd.cId, cName, count(registerNo) as 'Student Count' from table_CourseDetails cd join table_CourseRegistration cr
   on cd.cId = cr.cId
   group by cName, cd.cId
   order by cd.cId desc


-- 9. customer table and order table
create table table_cust9(
	cId int primary key,
	firstName varchar(30),
	lastName varchar(30)
)

insert into table_cust9 values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')

select * from table_cust9

create table table_order9(
	orderId int primary key,
	orderDate date,
	amount float,
	customerId int
)

insert into table_order9 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-08-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)

select * from table_order9

-- display first name and last name of the customer who has placed exactly 2 order
   select firstName, lastName from table_cust9 c join table_order9 o
   on c.cId = o.customerId
   group by firstName, lastName
   having count(customerId) = 2

-- 10. from table_StudentDetails, display all student names in reverse order and capitalise all 
--     character in location
   select studName, Upper(loc) from table_StudentDetails
   order by studName desc


-- 11. table table_OrderV, table_OrderItemV, table_ProductV
create table table_OrderV(
	ordId int primary key,
	orderDate date,
	orderNumber int,
	customerId int,
	totalAmount float
)

create table table_ProductV(
	prodId int primary key,
	productName varchar(20),
	supplierId int,
	unitPrice float,
	package float,
	isDiscontinued bit
)

create table table_OrderItemV(
	id int primary key,
	orderId int references table_OrderV(ordId),
	productId int references table_ProductV(prodId),
	unitPrice float,
	quantity int
)

-- create a view to display the product name, ordered quantity, ordername
   create view productOrderView as
   select productName, quantity, orderNumber
   from table_ProductV p join table_OrderItemV oi
   on p.prodId = oi.productId
   join table_OrderV o
   on o.ordId = oi.orderId

   select * from productOrderView

-- 12. from studentDetail, courseDetail and courseRegistration
--     display course name registered by Nisha

   select studName, cName
   from table_StudentDetails sd join table_CourseRegistration cr
   on cr.registerNo = sd.registerNo
   join table_CourseDetails cd
   on cd.cId = cr.cId
   where studName ='Nisha'
