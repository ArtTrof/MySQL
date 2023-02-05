use myJoinsDB;
-- creating index for fast finding employee by name
Create index name on Employee_info(name);
-- creating indexes on salary and job_pos because this columns are most often refered to be found
Create index salary on Employee_pos(salary);
Create index job_pos on Employee_pos(job_pos);
-- tas4
create view emp_info as
Select s.name,s.phone,sc.residence from employee_info s
left join employee_info_add sc on s.id=sc.employee_id;

select * from emp_info;

create view emp_info_by_family_status as
select s.date_of_birth,sc.phone from employee_info_add s 
inner join employee_info sc on s.employee_id=sc.id and s.family_status ='Single';

select * from emp_info_by_family_status;

create view emp_managers_info as 
select s.date_of_birth,sc.phone,sc.name from employee_info_add s 
inner join employee_info sc on s.employee_id=sc.id
inner join Employee_pos scs on scs.employee_id=sc.id
where scs.job_pos='Manager';

select * from emp_managers_info;
-- task6
use shopdb;
alter table orders  drop constraint fk_orders_customers;

drop table customers;

create table customers(
customerNo int ,
Fname varchar(30),
Lname varchar(30),
Mname varchar(30),
adress1 varchar(30) not null,
adress2 varchar(30),
city varchar(30),
phone varchar(30),
dateInSystem date);


insert into customers (customerNo,adress1) 
values(1,'adress1'),
(2,'adress2'),
(3,'adress2');

create index customerNo on customers(customerNo);
explain select * from customers where customerNo=1;
-- filtered 100 select_type sinple (without pk)
drop table customers;
create table customers(
customerNo int auto_increment primary key,
Fname varchar(30),
Lname varchar(30),
Mname varchar(30),
adress1 varchar(30) not null,
adress2 varchar(30),
city varchar(30),
phone varchar(30),
dateInSystem date);
insert into customers(adress1) values
('adress1'),
('adress2'),
('adress3');
create index customersNo on customers(customerNo);
-- filter 100 posblkeys added (Primary,suctomerNo)((clustered))
explain select * from customers where customerNo=1;

alter table orders add constraint fk_order_customers foreign key(customerNo) references customers(customerNo);