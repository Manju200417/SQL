create table salesman (salesman_id int primary key,
name varchar(50),city varchar(50),
commission decimal(5,2));

create table customer (customer_id int primary key,
cust_name varchar(50),city varchar(50),
grade int,salesman_id int,
foreign key (salesman_id) references salesman(salesman_id));

create table orders (ord_no int primary key,
purchase_amt int,ord_date date,
customer_id int,sman_id int);

insert into salesman (salesman_id, name, city, commission) values (5001, 'james', 'dharwad', 25);
insert into salesman (salesman_id, name, city, commission) values (5002, 'navya', 'bengalore', 30);
insert into salesman (salesman_id, name, city, commission) values (5003, 'vinay', 'bangalore', 30);
insert into salesman (salesman_id, name, city, commission) values (5004, 'shruti', 'pune', 40);
insert into salesman (salesman_id, name, city, commission) values (5005, 'kavya', 'goa', 35);

insert into customer (customer_id, cust_name, city, grade, salesman_id) values (3001, 'brunda', 'bangalore', 400, 5004);
insert into customer (customer_id, cust_name, city, grade, salesman_id) values (3002, 'vijay', 'davangere', 100, 5001);
insert into customer (customer_id, cust_name, city, grade, salesman_id) values (3003, 'ramya', 'bangalore', 200, 5002);
insert into customer (customer_id, cust_name, city, grade, salesman_id) values (3004, 'ramesh', 'hubli', 300, 5003);
insert into customer (customer_id, cust_name, city, grade, salesman_id) values (3005, 'raj', 'belagavi', 100, 5001);

insert into orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) values (7001, 150, '1997-01-04', 3005, 5002);
insert into orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) values (7002, 270, '1983-04-05', 3005, 5001);
insert into orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) values (7003, 65, '1997-03-07', 3002, 5002);
insert into orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) values (7004, 110, '1987-07-02', 3002, 5001);
insert into orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) values (7005, 270, '1983-09-15', 3003, 5004);

select count(*) from customer where grade > (select avg(grade) from customer where city = 'bangalore');

select salesman_id, name from salesman 
where salesman_id in (select salesman_id from customer group by salesman_id having count(*) > 1);

select s.salesman_id, s.name, c.cust_name, s.commission 
from salesman s, customer c 
where s.city = c.city 
union 
select salesman_id, name,'no match' as cust_name, commission 
from salesman 
where city not in (select city from customer);

create view abc as 
select b.ord_date, a.salesman_id, a.name 
from salesman a, orders b 
where a.salesman_id = b.salesman_id 
and b.purchase_amt = (select max(purchase_amt) from orders c where c.ord_date = b.ord_date);

delete from salesman where salesman_id = 5009;