create table department (
dno varchar(10) primary key,
dname varchar(20),mgrstartdate date,
mgrssn varchar(10) references employee(ssn));

create table employee (
ssn varchar(10) primary key,
fname varchar(20),lname varchar(20),
address varchar(20),sex char(1),
salary integer,superssn varchar(10),
dno varchar(10) references department(dno));

create table dlocation (dloc varchar(20),
dno varchar(10) references department(dno),
primary key (dno, dloc));

create table project (pno integer primary key,
pname varchar(20),plocation varchar(20),
dno varchar(10) references department(dno));

create table works_on(hours int,
ssn varchar(10) references employee(ssn),
pno integer references project(pno),
primary key (ssn, pno));

insert into employee values ('E01', 'John', 'Scott', 'Bangalore', 'M', 450000, 'D1');
insert into employee values ('E02', 'James', 'Smith', 'Bangalore', 'M', 500000, 'D1');
insert into employee values ('E03', 'Hearn', 'Baker', 'Bangalore', 'M', 700000, 'D1');
insert into employee values ('E04', 'Edward', 'Scott', 'Mysore', 'M', 500000, 'D7');
insert into employee values ('E05', 'Pavan', 'Hegde', 'Mangalore', 'M', 650000, 'D7');
insert into employee values ('E06', 'Girish', 'Malya', 'Dharwad', 'M', 450000, 'D7');

insert into department values ('D1', 'Accounts', '2001-01-01', 'E01');
insert into department values ('D2', 'IT', '2016-08-01', 'E01');
insert into department values ('D3', 'ECE', '2008-06-01', 'E01');
insert into department values ('D5', 'CSE', '2002-06-01', 'E06');
insert into department values ('D7', 'Accounts', '2001-01-01', 'E01');
insert into department values ('D4', 'ISE', '2015-08-01', 'E05');

insert into dlocation values ('Bangalore', 'D1');
insert into dlocation values ('Bangalore', 'D2');
insert into dlocation values ('Bangalore', 'D4');
insert into dlocation values ('Mangalore', 'D4');
insert into dlocation values ('Mangalore', 'D5');

insert into project values (100, 'IoT', 'Bangalore', 'D5');
insert into project values (101, 'Cloud', 'Bangalore', 'D5');
insert into project values (102, 'BigData', 'Bangalore', 'D5');
insert into project values (103, 'Sensors', 'Bangalore', 'D4');
insert into project values (104, 'Bank Management', 'Bangalore', 'D1');
insert into project values (105, 'Salary Management', 'Bangalore', 'D1');
insert into project values (106, 'OpenStack', 'Bangalore', 'D4');
insert into project values (107, 'SmartCity', 'Bangalore', 'D2');

insert into works_on values (4, 'E01', 100);
insert into works_on values (6, 'E01', 101);
insert into works_on values (8, 'E03', 102);
insert into works_on values (10,'E04', 100);
insert into works_on values (4, 'E04', 101);
insert into works_on values (5, 'E04', 102);
-----------------------------------------------------------------------
select distinct p.pno 
from project p
join works_on w on p.pno = w.pno
join employee e on e.ssn = w.ssn
where e.lname = 'Scott'
or p.dno = (select dno from department where mgrssn = e.ssn);

select e.fname, e.lname, 1.1 * e.salary as incr_sal 
from employee e
join works_on w on e.ssn = w.ssn
join project p on w.pno = p.pno
where p.pname = 'IoT';

select sum(e.salary) as total_salary, max(e.salary) as max_salary, min(e.salary) as min_salary, avg(e.salary) as avg_salary
from employee e join department d on e.dno = d.dno where d.dname = 'Accounts';

create view dept_view as 
select d.dname, l.dloc 
from department d, dlocation l 
where d.dno = l.dno 
and l.dloc = 'Mangalore';

select * from dept_view where dloc = 'Mangalore';