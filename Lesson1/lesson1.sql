-- task2 
create database MyDb;

Use myDB;
-- task3
Create table employee(
id int auto_increment not null ,
name varchar(20),
phone_number varchar(15),
primary key(id)
);

Create table primary_info(
position varchar(30),
sallary double,
id int,
foreign key(id) References employee(id));

create table other_info(
family_status varchar(20),
date_of_birth date,
residence varchar(50), 
id int,
foreign key(id) References employee(id));

insert into employee (name,phone_number) values ('John','+380999999999');
insert into employee (name,phone_number) values ('Arkasha','+380999999998');
insert into employee (name,phone_number) values ('Ira','+380999999997');
 
insert into primary_info (position,sallary,id) values ('Boss',10000,1);
insert into primary_info (position,sallary,id) values ('Intern programmer',250,2);
insert into primary_info (position,sallary,id) values ('Team lead',5000,3);

insert into other_info (family_status,date_of_birth,residence,id) values ('Single','2000-04-18','Poltava',1);
insert into other_info (family_status,date_of_birth,residence,id) values ('Married','1999-04-18','Kyiv',2);
insert into other_info (family_status,date_of_birth,residence,id) values ('Single','2002-04-18','Lviv',3);

-- task4
select id from mydb.primary_info where sallary >=10000;
-- task5
update other_info set family_status = 'Married' where id = 1;

-- task6
create database cars;
use cars;
create table cars(
id int auto_increment not null,
mark varchar(30),
model varchar(30),
engine_volume double,
price double,
max_speed double,
primary key (id));

insert into cars (mark,model,engine_volume,price,max_speed) values ('Nissan','GTR-35',8.5,20000,330);
insert into cars (mark,model,engine_volume,price,max_speed) values ('Toyota','Supra-mk5',10,30000,350);
insert into cars (mark,model,engine_volume,price,max_speed) values ('Ford','Musstang',12,40000,300);

select * from cars.cars;



