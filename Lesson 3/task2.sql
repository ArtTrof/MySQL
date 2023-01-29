create database military;

use military;

create table soldier(
id int auto_increment not null primary key,
name varchar(20),
surname varchar(20),
father_name varchar(20),
platoon_id int,
gun_id int,
gun_giver_id int,
foreign key (platoon_id) references platoon(id),
foreign key (gun_id) references gun(id),
foreign key (gun_giver_id) references gun_giver(id)
);

create table platoon(
id int auto_increment not null primary key,
platoon_number int);

create table gun(
id int  auto_increment not null primary key,
name varchar(30) not null);

create table gun_giver(
id int auto_increment not null primary key,
full_name varchar(40),
rang varchar(20));