-- 1. create database statement which creates a database named a2
create database a2;

-- use the created database
use a2;

-- 2. create table with our first names
create table phuong_gavin
(
    icecream_flavor varchar(100), 
    price_per_scoop decimal(4,2), 
    in_stock boolean
);

-- 4. five insert statements

-- i. all field/column names
insert into phuong_gavin (icecream_flavor, price_per_scoop, in_stock)
values ('cheesecake', 3.00, TRUE);

-- ii. omits all field/column names
insert into phuong_gavin
values ('cotton candy', 2.75, FALSE);

-- iii. changes the order of fields/columns
insert into phuong_gavin (in_stock, price_per_scoop, icecream_flavor)
values (TRUE, 2.50, 'mint');

-- iv. leaves fields/column out 
insert into phuong_gavin (icecream_flavor) 
values ('salted caramel');

-- v. add multiple records
insert into phuong_gavin (icecream_flavor, price_per_scoop, in_stock)
values ('pumpkin', 3.00, TRUE), ('marshmallow', 2.50, TRUE);

-- 5. drop table
drop table phuong_gavin;
