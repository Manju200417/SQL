-- ------------------A----------------------
create table stu (regno varchar(20) primary key,
name varchar(20),class varchar(20),bdate date,
marks1 int,marks2 int,marks3 int);

insert into stu values ('s001', 'john', '10', '15-jun-2005', 85, 90, 78);
insert into stu values ('s002', 'anna', '10', '20-feb-2005', 92, 88, 79);
insert into stu values ('s003', 'paul', '10', '30-apr-2005', 76, 84, 91);
insert into stu values ('s004', 'mike', '10', '25-jun-2005', 89, 94, 72);
insert into stu values ('s005', 'lucy', '10', '11-sep-2005', 81, 85, 80);

select * from stu where name = 'john';
select * from stu order by marks1 desc;
select * from stu having marks1>80; 
select class ,avg(marks1) from stu group by class having avg(marks1)>80;
--------------------------------------------------------
select sum(marks1) from student;
select avg(marks1) from stu;
select count(name) from stu;
select * from stu where name like '%a';
select name from stu where marks1 between 80 and 90;
select min(marks1),max(marks1) from stu;
-- --------------------B----------------------
create table department (deptno int primary key,
dname varchar(20),manager_id int);
    
create table employee (empid int primary key,
ename varchar(20),age int,salary int,deptno int);

insert into department (deptno, dname, manager_id) values (1, 'cs', 101);
insert into department (deptno, dname, manager_id) values (2, 'hr', 102);
insert into department (deptno, dname, manager_id) values (3, 'finance', 103);
insert into department (deptno, dname, manager_id) values (4, 'marketing', 104);
insert into department (deptno, dname, manager_id) values (5, 'admin', 105);

insert into employee (empid, ename, age, salary, deptno) values (201, 'alice', 25, 35000, 1);
insert into employee (empid, ename, age, salary, deptno) values (202, 'bob', 30, 45000, 2);
insert into employee (empid, ename, age, salary, deptno) values (203, 'charlie', 28, 40000, 1);
insert into employee (empid, ename, age, salary, deptno) values (204, 'david', 35, 30000, 3);
insert into employee (empid, ename, age, salary, deptno) values (205, 'eve', 29, 28000, 4);

select empid, ename from employee where salary between 10000 and 50000;

select ename, salary from employee 
where deptno = (select deptno from department where dname = 'cs');

select e.ename, d.dname from employee e 
inner join department d on e.deptno = d.deptno;