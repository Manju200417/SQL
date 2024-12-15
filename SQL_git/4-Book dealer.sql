create table author(
author_id int primary key,
name varchar(20),city varchar(20),
country varchar(20));

create table publisher(
publisher_id int primary key,
name varchar(20),city varchar(20),
country varchar(20));

create table category(category_id int primary key,
description varchar(45));

create table catalog(book_id int primary key,titel varchar(20),
author_id int references author(author_id),
publisher_id int references publisher(publisher_id),
category_id int references category(category_id),
year int,price int);

create table order_details(
order_no int primary key,
book_id int references catalog(book_id),
quantity int);

-- ------------------------------------------------------------------------------ 

insert into author values (101, 'p b kottur', 'india', 'banglore');
insert into author values (202, 'balguruswamy', 'india', 'delhi');
insert into author values (303, 'padama reddy', 'india', 'hydrabad');
insert into author values (404, 'robert hook', 'usa', 'paris');
insert into author values (505, 'james eilson', 'india', 'mumbai');

insert into publisher values (1001, 'pearson', 'pune', 'india');
insert into publisher values (2002, 'tata mcgraw', 'delhi', 'india');
insert into publisher values (3003, 'pearson', 'banglore', 'india');
insert into publisher values (4004, 'tata mcgraw', 'hydrabad', 'india');
insert into publisher values (5005, 'pearson', 'gadag', 'india');

insert into category values (100, 'networking');
insert into category values (200, 'programing');
insert into category values (300, 'deploying softeware');
insert into category values (400, 'security portactino');
insert into category values (500, 'eletronics');

insert into catalog values (111, 'java', 101, 1001, 100, 2002, 1500);
insert into catalog values (222, 'jee', 101, 2002, 200, 2003, 2000);
insert into catalog values (333, 'operating system', 101, 3003, 300, 2005, 1500);
insert into catalog values (444, 'c++', 202, 4004, 400, 2008, 500);
insert into catalog values (555, 'data structer', 202, 5005, 500, 2006, 500);

insert into order_details values (1010, 111, 100);
insert into order_details values (2020, 222, 200);
insert into order_details values (3030, 333, 300);
insert into order_details values (4040, 444, 400);
insert into order_details values (5050, 555, 500);

select * from author where author_id in (
select author_id from catalog 
where price > (select avg(price) from catalog) 
group by author_id 
having count(*) >= 2);

select a.name from author a, catalog c, order_details o 
where a.author_id = c.author_id 
and o.book_id = c.book_id 
and o.quantity = (select max(quantity) from order_details);

update catalog set price = price * 1.10 where publisher_id = 1001;
