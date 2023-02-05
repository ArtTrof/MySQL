drop database myjoinsdb;
create database myjoinsdb;
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

select s.phone,(select residence from employee_info_add as sc where s.id=sc.employee_id)as City from employee_info as s;

select s.date_of_birth,(select phone from employee_info  sc where s.employee_id=sc.id)as Phone
from employee_info_add s where s.family_status='Single';

select s1.name,s1.phone,
(Select s2.family_status   from employee_info_add s2 where s1.id=s2.employee_id) as fam_status ,
(Select s3.salary from employee_pos s3 where s1.id=s3.employee_id)as salary from employee_info s1 
where (select s3.job_pos from employee_pos s3 where s1.id=s3.employee_id)='Manager';

use shopdb;
select Employees.Fname,Employees.Lname ,
(Select Customers.Fname from customers  where Customers.CustomerNo = Orders.CustomerNo)as Customer_Fname,
(Select Customers.Lname from customers where Customers.CustomerNo = Orders.CustomerNo)as Customer_fname,
(Select OrderDetails.TotalPrice from OrderDetails where Orders.OrderID = OrderDetails.OrderID) as Total_price
from Employees where (Select OrderDetails.TotalPrice from OrderDetails where Orders.OrderID = OrderDetails.OrderID)>1000;