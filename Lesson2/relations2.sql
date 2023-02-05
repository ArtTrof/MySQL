Create database magazine;
use magazine;

Create table supplier(
id_supplier int auto_increment not null,
supplier_name varchar(30),
adress varchar(30),
phone varchar(15),
email varchar(40),
Primary key (id_supplier));

create table product(
id_product int auto_increment not null,
id_supplier int,
name varchar(20),
price double,
quantity int,
primary key (id_product),
foreign key (id_supplier)references supplier(id_supplier));

create table magazine(
id_magazine int auto_increment not null,
id_product int,
name varchar(30),
address varchar(30),
primary key(id_magazine),
foreign key(id_product) references product(id_product));

create table staff(
id_employee int auto_increment not null,
id_magazine int ,
name varchar(20),
position varchar(30),
date_of_birth date,
address varchar(40),
phone varchar(15),
primary key(id_employee),
foreign key(id_magazine) references magazine(id_magazine));

create table customer(
id_customer int auto_increment not null,
name varchar(30),
address varchar (30),
phone varchar(15),
email varchar(40),
Primary key(id_customer));

create table booking(
id_order int auto_increment not null,
id_employee int,
id_customer int,
id_product int,
id_magazine int,
quantity int,
date_of_order date,
Primary key (id_order),
foreign key (id_employee) references staff(id_employee),
foreign key (id_customer) references customer(id_customer),
foreign key (id_product) references product(id_product),
foreign key (id_magazine) references magazine(id_magazine)
);

