create database myfunkdb2;
use myfunkdb2;
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

start transaction;
insert into employee(fname,phone) values
('Artem','+38099999999'),
('Vasya','+38099999999'),
('Nastya','+38099999999');
commit;
start transaction ;
insert into job_info values
(1,20000,'Director'),
(2,2000,'Manager'),
(3,200,'Worker');
commit;
start transaction;
insert into add_info values
(1,'Single','2002-04-18','Poltava'),
(2,'Married','2002-04-19','Kiev'),
(3,'Single','2002-08-20','Tereshky');
commit;

delimiter \

CREATE PROCEDURE insertCheck (IN fname1 varchar(30), IN phone1 varchar(30))
BEGIN
DECLARE Id int;
START TRANSACTION;
			
		INSERT employee (FName, phone)
		VALUES (fname1, phone1);
		SET Id = @@IDENTITY;

		
IF EXISTS (SELECT * FROM employee WHERE FName = fname1 AND phone = phone1 AND empid != id)
			THEN
				ROLLBACK; 
				
			END IF;	
			
		COMMIT; 
END; \
drop procedure insertcheck;\
call insertCheck('Artem2','+38099999999');\
select * from employee;\

create trigger ondelete
before delete on employee
for each row begin
delete from job_info where empid=old.empid;
delete from add_info where empid=old.empid;
end;\

delete from employee where empid=3;\
select * from job_info;\
select * from employee;\
select * from add_info;\

use shopdb;\



