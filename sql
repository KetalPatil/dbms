show databases;
create database school;
use school;
create table data(rollno int,sname varchar(100),age int,gender varchar(50),dob date,city varchar(200));
desc data;
 insert into data(rollno,sname,age,gender,dob,city) values(1,'pranav',20,'male','2009-03-02','jalgaon');
 insert into data(rollno,sname,age,gender,dob,city) values(5,'palak',17,'female','2009-03-02','jalgaon'),(2,'ketal',20,'female','2004-03-01','pune'),(10,'harshal',30,'male','1992-05-16','pune'),(15,'om',17,'male','2007-12-22','nagar');
 alter table data add mobno int;
desc data;
update data set mobno=123 where sname='pranav';
select * from data;
 alter table data drop mobno;
 update data set mobno=123;
ALTER TABLE Persons
MODIFY COLUMN DateOfBirth year;(modify datatype)
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
create index school_data on data (rollno,sname);
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);
ALTER TABLE Persons AUTO_INCREMENT=100;
create view school_db as select sname,city from data where gender='male';
select * from school_db;
 select * from data where city='jalgaon' or age<15;
select * from data where city='jalgaon' and age>20;
select * from data where not city='nagar';
select * from data order by rollno;
select * from data order by rollno desc;
select sname from data where rollno is null;
select sname from data where rollno is not null;
delete from data where city='nagar';
select * from data where city='pune' limit 1;
 select min(rollno) as smallest from data;
 select max(rollno) as largest from data;
select count(sname) from data;
select avg(rollno) from data;
select sum(rollno) from data;
select avg(rollno) as average from data;
select * from data where city like '%e';
select * from data where city like 'j%';
select * from data where city like '%un%';
select * from data where city like '__l%';
 select * from data where city like 'p__%';
select * from data where city like 'p%e';
select * from data where city in ('pune');
select * from data where city not in ('pune');
select * from data where age between 10 and 20;
select * from data where age not between 10 and 20;
 create table score(sname varchar(200),rollno int,marks int);
 insert into score(sname,rollno,marks) values('ketal',10,100),('pranav',1,89),('palak',5,98),('riya',20,79),('smital',19,89);
select data.rollno,score.sname,score.marks from data inner join score on data.rollno=score.rollno;
select data.rollno,score.sname,score.marks from data left join score on data.rollno=score.rollno;
select data.rollno,score.sname,score.marks from data right join score on data.rollno=score.rollno;
select data.rollno,score.sname,score.marks from data cross join score on data.rollno=score.rollno;
select count(rollno),city from data group by city;
select a.rollno,a.sname,b.marks from data a inner join score b on a.rollno=b.rollno where a.city='pune';

**procedure**
delimiter @@
 select * from score;
 @@
 create procedure updatestatus1(in mark1 int)
    -> begin
    -> declare mymark int;
    -> set mymark=mark1;
    -> if mymark>35 then
    -> update score set status='pass' where marks=mymark;
    -> else
    -> update score set status='fail' where marks=mymark;
    -> end if;
    -> end;
    -> @@
call updatestatus1(100);
    -> @@
select * from score;

**function**
 delimiter $$
mysql> create function student_data(age int)
    ->  returns varchar (20)
    ->  deterministic
    ->  begin
    ->  declare grade varchar(20);
    ->  if marks>20 then
    ->  set grade='engineer';
    ->  elseif (marks<=18 and marks>=20) then
    ->  set grade='student';
    -> elseif marks<18 then;
    ->  set grade='child';
    ->  end if;
    ->  return (grade);
    ->  end$$
select sname,marks, student_data(marks) from score;

**cursor**

