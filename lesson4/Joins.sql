create database MyJoinsDB;
use myjoinsdb;

create table employee_info(
id int auto_increment primary key,
name varchar(30),
phone varchar(30));

create table employee_pos(
employee_id int unique,
salary double,
job_pos varchar(30),
foreign key(employee_id) references employee_info(id));

create table employee_info_add(
employee_id int unique,
family_status varchar(30),
date_of_birth date,
phone varchar(30),
foreign key(employee_id) references employee_info(id) );

insert into employee_info(name,phone)values
('John','(077)1111111'),
('Bradley','(077)1111112'),
('Victor','(077)1111113');

insert into employee_pos values 
(1,100000,'Head'),
(2,50000,'Manager'),
(3,1000,'Worker');

alter table employee_info_add rename column phone to residence;

insert into employee_info_add values
(1,'Married','2000-04-18','Los-Angeles'),
(2,'Married','2001-04-18','Warsaw'),
(3,'Single','2003-04-18','Poltava');

select s.id,s.name,sc.residence from employee_info s left join employee_info_add sc on id=employee_id;
select * from employee_info_add;

select s.date_of_birth,sc.phone from employee_info_add s left join employee_info sc on s.employee_id=sc.id where family_status in 
(Select family_status from employee_info_add where family_status='Single');

select	employee_pos.job_pos,employee_info_add.date_of_birth,employee_info.phone from employee_pos 
inner join employee_info_add on employee_pos.employee_id=employee_info_add.employee_id
inner join employee_info on employee_pos.employee_id=employee_info.id
where job_pos in(Select job_pos from employee_pos where job_pos='Manager');

use shopdb;

select Employees.Fname,Employees.Lname,Customers.Fname,Customers.Lname,OrderDetails.TotalPrice from Employees
inner join Orders on Employees.EmployeeID	= Orders.EmployeeID
inner join Customers on Customers.CustomerNo = Orders.CustomerNo
inner join OrderDetails on Orders.OrderID = OrderDetails.OrderID;
