create database hr_departament;
use hr_departament;

create table regions(
region_id int auto_increment not null,
region_name varchar(30),
primary key(region_id));

create table countries(
country_id char(2) not null,
country_name varchar(30),
region_id int,
primary key(country_id));


create table locations(
location_id int auto_increment not null,
street_address varchar(30),
postal_code varchar(30),
city varchar(30),
state_province varchar(30),
country_id varchar(30),
primary key(location_id));

create table departments(
department_id int auto_increment not null,
department_name varchar(30),
manager_id int,
location_id int,
primary key(department_id)
);

create table employees(
employee_id int auto_increment not null,
first_name varchar(20),
second_name varchar(20),
email varchar(25),
phone_number varchar(25),
hire_date date,
job_id varchar(10),
salary double,
comission_pct double(10,2),
manager_id int,
department_id int,
primary key(employee_id)
);

create	table jobs(
job_id varchar(10) not null,
job_title varchar(35),
min_salary double,
max_salary double,
primary key(job_id)
);

create table job_history(
employee_id int,
start_date date not null,
end_date date,
job_id varchar(10),
department_id int,
primary key(employee_id));


alter table countries
add constraint fk_region_id
foreign key(region_id) references regions(region_id);

alter table locations
add constraint fk_country_id
foreign key(country_id) references countries(country_id);

alter table locations
add constraint fk_country_id
foreign key(country_id) references countries(country_id);

alter table employees add constraint un_manager_id unique(manager_id);
alter table departments
add constraint fk_location_id
foreign key(location_id) references locations(location_id),
add constraint fk_manager_id
foreign key (manager_id) references employees(manager_id);



alter table employees
add constraint fk_job_id
foreign key(job_id) references jobs(job_id),
add constraint fk_department_id
foreign key (department_id) references departments(department_id);

alter table job_history add constraint fk_job_id_history
foreign key (job_id) references jobs(job_id),
add constraint fk_department_id_history
foreign key (department_id) references departments(department_id);


