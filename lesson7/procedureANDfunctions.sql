create database myfunkdb;
use myfunkdb;
create table employee(
empid int auto_increment primary key,
fname varchar(30),
phone varchar(15));

create table job_info(
empid int primary key references employee(empid),
salary double,
job_pos varchar(30));

create table add_info (
empid int primary key references employee(empid),
family_status varchar(20),
birth_date date,
residence varchar(30));

insert into employee(fname,phone) values
('Artem','+38099999999'),
('Vasya','+38099999999'),
('Nastya','+38099999999');
insert into job_info values
(1,20000,'Director'),
(2,2000,'Manager'),
(3,200,'Worker');
insert into add_info values
(1,'Single','2002-04-18','Poltava'),
(2,'Married','2002-04-19','Kiev'),
(3,'Single','2002-08-20','Tereshky');

DELIMITER \
\
Create procedure find_contacts()
begin
Select s.phone,sc.birth_date,sc.residence from employee s
inner join add_info sc on s.empid=sc.empid;
end
\
call find_contacts();\
create procedure find_singles()
begin
select s.phone,sc.birth_date from employee s 
inner join add_info sc on s.empid=sc.empid;
end\
call find_singles();\
create procedure managers_info()
begin 
Select s.birth_date,sc.phone from add_info s 
inner join employee sc on sc.empid=s.empid
inner join job_info scs on scs.empid=s.empid
where scs.job_pos='Manager';
end\
call managers_info();\
use carsshop;\
create function minclientage()
returns tinyint
begin
return(select min(age) from clients);
end\
SET GLOBAL log_bin_trust_function_creators = 1;\
select s.mark,s.model,s.price,s.speed from cars s
inner join clients sc on s.clientId=sc.id
where sc.age=minclientage;