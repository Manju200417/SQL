create table person (
driver_id char(10) primary key,
name char(10),address char(10));

create table car (
reg_no char(10) primary key,
model char(10),year int);

create table accident (
report_no int primary key,
adate date,location char(10));

create table owns (
driver_id char(10) references person (driver_id),
reg_no char(10) references car (reg_no));

create table participated1 (
driver_id char(10) references person (driver_id),
reg_no char(10) references car (reg_no),
report_no int references accident (report_no),
damage_amount int);

insert into person values ('a21', 'ravi', 'navanagar');
insert into person values ('a22', 'tanu', 'sapthapur');
insert into person values ('a23', 'pooja', 'cbt');
insert into person values ('a24', 'padama', 'gokulroad');
insert into person values ('a25', 'sunil', 'oldhubli');

insert into car values ('ka20', 'santro', 2000);
insert into car values ('ka21', 'benz', 2001);
insert into car values ('ka22', 'ferari', 2002);
insert into car values ('ka23', 'benz', 2003);
insert into car values ('ka24', 'swift', 2004);

insert into accident values (12, '2002-2-01', 'hubli');
insert into accident values (13, '2003-3-01', 'davangeri');
insert into accident values (14, '2018-8-15', 'bangalore');
insert into accident values (15, '2005-5-23', 'goa');
insert into accident values (16, '2018-3-19', 'dandeli');

insert into owns values ('a21', 'ka20');
insert into owns values ('a22', 'ka21');
insert into owns values ('a23', 'ka22');
insert into owns values ('a24', 'ka23');
insert into owns values ('a25', 'ka24');

insert into participated1 values ('a21', 'ka20', 12, 1000);
insert into participated1 values ('a22', 'ka21', 13, 2000);
insert into participated1 values ('a23', 'ka22', 14, 3000);
insert into participated1 values ('a24', 'ka23', 15, 9000);
insert into participated1 values ('a25', 'ka24', 16, 8000);
--------------------------------------------------------------------------------------------------
update participated1 set damage_amount = 25000
where report_no = 12;

insert into accident values(17, '2023-2-07', 'pune');

select count(driver_id) from participated1
where report_no in (select report_no from accident where adate between '2002-1-01' and '2002-12-31');

select count(report_no)
from participated1 p, car c
where p.reg_no = c.reg_no and c.model = 'benz';