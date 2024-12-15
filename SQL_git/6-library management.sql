create table publisher (
name varchar(20) primary key,
phone bigint,address varchar(20));

insert into publisher values ('mcgraw-hill', 9989076587, 'bangalore');
insert into publisher values ('pearson', 9889076565, 'newdelhi');
insert into publisher values ('random house', 7455679345, 'hydrabad');
insert into publisher values ('hachette livre', 8970862340, 'chenai');
insert into publisher values ('grupoplaneta', 7756120238, 'bangalore');

create table book (
book_id int primary key,
title varchar(20),
pub_year varchar(20),
publisher_name varchar(20),
foreign key (publisher_name) references publisher(name) on delete cascade);

insert into book values (1, 'dbms', 'jan-2017', 'mcgraw-hill');
insert into book values (2, 'adbms', 'jun-2016', 'mcgraw-hill');
insert into book values (3, 'cn', 'sep-2016', 'pearson');
insert into book values (5, 'os', 'may-2016', 'pearson');

create table book_authors (
author_name varchar(20),
book_id int,
primary key (book_id, author_name),
foreign key (book_id) references book(book_id) on delete cascade);

insert into book_authors values ('navathe', 1);
insert into book_authors values ('navathe', 2);
insert into book_authors values ('tanenbaum', 3);
insert into book_authors values ('galvin', 5);

create table library_branch (
branch_id int primary key,
branch_name varchar(50),
address varchar(50));

insert into library_branch values (10, 'rr nagar', 'bangalore');
insert into library_branch values (11, 'rnsit', 'bangalore');
insert into library_branch values (12, 'rajaji nagar', 'bangalore');
insert into library_branch values (13, 'nitte', 'mangalore');
insert into library_branch values (14, 'manipal', 'udupi');

create table book_copies (
no_of_copies int,
book_id int,
branch_id int,
primary key (book_id, branch_id),
foreign key (book_id) references book(book_id) on delete cascade,
foreign key (branch_id) references library_branch(branch_id) on delete cascade);

insert into book_copies values (10, 1, 10);
insert into book_copies values (5, 1, 11);
insert into book_copies values (2, 2, 12);
insert into book_copies values (5, 2, 13);
insert into book_copies values (7, 3, 14);
insert into book_copies values (1, 5, 10);

create table card (card_no int primary key);

insert into card values (100);
insert into card values (101);
insert into card values (102);
insert into card values (103);
insert into card values (104);

create table book_lending (
date_out date,
due_date date,
book_id int,
branch_id int,
card_no int,
primary key (book_id, branch_id, card_no),
foreign key (book_id) references book(book_id) on delete cascade,
foreign key (branch_id) references library_branch(branch_id) on delete cascade,
foreign key (card_no) references card(card_no) on delete cascade);

insert into book_lending values ('01-jan-17', '01-jun-17', 1, 10, 101);
insert into book_lending values ('11-jan-17', '11-mar-17', 3, 14, 101);
insert into book_lending values ('21-feb-17', '21-apr-17', 2, 13, 101);
insert into book_lending values ('12-apr-17', '12-may-17', 1, 11, 104);

select b.book_id, b.title, b.publisher_name, a.author_name, c.no_of_copies, l.branch_id
from book b
join book_authors a on b.book_id = a.book_id
join book_copies c on b.book_id = c.book_id
join library_branch l on c.branch_id = l.branch_id;

select card_no
from book_lending
where date_out between '01-jan-2017' and '01-jul-2017'
group by card_no
having count(*) > 2;

delete from book where book_id = 3;

create view v_books as
select b.book_id, b.title, c.no_of_copies
from book b
join book_copies c on b.book_id = c.book_id;

select * from v_books;
