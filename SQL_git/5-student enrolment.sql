create table student (
regno char(6) primary key,
name varchar(20),
major varchar(20),
birth_date date);

create table course (
course_no int primary key,
course_name varchar(20),
department varchar(20));

create table enroll (
regno char(6) references student(regno),
course_no int references course(course_no),
semester int,marks int);

create table text_book (
book_isbn int primary key,
book_title varchar(20),
publisher varchar(20),
author varchar(20));

create table book_adopted (
course_no int references course(course_no),
semester int,
book_isbn int references text_book(book_isbn));

insert into student values ('18u113', 'arpita', 'computer science', '2001-04-02');
insert into student values ('18u114', 'ashwini', 'computer science', '2001-06-02');
insert into student values ('18u115', 'goutami', 'science', '1999-03-15');
insert into student values ('18u116', 'archana', 'computer science', '2000-01-17');
insert into student values ('18u117', 'chandrakant', 'science', '2000-07-12');

insert into course values (11, 'bca', 'computer science');
insert into course values (22, 'bba', 'commerce');
insert into course values (33, 'bsc', 'physics');
insert into course values (44, 'bcom', 'commerce');
insert into course values (55, 'ba', 'arts');

insert into enroll values ('18u113', 11, 5, 90);
insert into enroll values ('18u114', 33, 3, 96);
insert into enroll values ('18u115', 44, 5, 95);
insert into enroll values ('18u116', 11, 5, 95);
insert into enroll values ('18u117', 22, 3, 99);

insert into text_book values (101, 'c++', 'pearson', 'patrick naughton');
insert into text_book values (102, 'java', 'tata mcgraw', 'robert jesin');
insert into text_book values (103, 'unix', 'tata mcgraw', 'lene kevin');
insert into text_book values (104, 'c', 'pearson', 'john martin');
insert into text_book values (105, 'dbms', 'pearson', 'ramakrishna');

insert into book_adopted values (11, 5, 101);
insert into book_adopted values (22, 3, 102);
insert into book_adopted values (33, 5, 104);
insert into book_adopted values (55, 5, 103);
insert into book_adopted values (44, 3, 105);
insert into book_adopted values (33, 5, 103);
insert into book_adopted values (11, 5, 106);

-- ----------------------------------------------------------------

insert into text_book values (106, 'maths', 'prism', 'umarani');
insert into book_adopted values (11, 5, 106);

select t.book_title, b.book_isbn, c.course_no
from course c
join book_adopted b on c.course_no = b.course_no
join text_book t on b.book_isbn = t.book_isbn
where c.department = 'computer science'
order by t.book_title, b.book_isbn, c.course_no;

select distinct c.department
from course c
join book_adopted b on c.course_no = b.course_no
join text_book t on b.book_isbn = t.book_isbn
where t.publisher = 'pearson';