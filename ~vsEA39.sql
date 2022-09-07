use sales;
go
create schema sales_schema;
create schema production;
create table customers
(
 customerId int primary key,
 firstName varchar(50) not null,
 lastName varchar(50) not null,
 email varchar(50),
 phone varchar(50) unique,
 state varchar(50),
 city varchar(15) not null,
 street varchar(30) not null,
 zip_code varchar(5)

);
create table staff
(
staffId int primary key,
firstName varchar(50) not null,
lastName varchar(50) not null,
salary decimal check(salary between 3000 and 15000),
hireDate date,
storeId int foreign key references store (storeId)
);
create table store
(
storeId int primary key,
storeName varchar(50),
city varchar(50) not null,
phone varchar(10)

);
create table orders
(
orderId int primary key,
orderDate date,
orderStatus varchar(10),
orderType varchar(10),
customerId int foreign key references customers(customerId) 

);
alter table store
add street varchar(20);

alter table store
add zip_code int,
fax varchar(30);

alter table store 
alter column city varchar(20) null;

alter table store 
add constraint store_name_uq unique (storeName);
exec sp_rename 'staff','workers';
exec sp_rename 'orders.orderStatus','ordSt','column';