create database "Shamsipour"
create table students (id  int identity(1,1) PRIMARY KEY, Firstname NVARCHAR(20) NOT NULL, Lastname NVARCHAR(20) NOT NULL, grade NVARCHAR(20) , major int NOT NULL);
create table majors (id  int identity(1,1) PRIMARY KEY , name NVARCHAR(20)NOT NULL);
insert into students (Firstname,Lastname,grade,major) Values ('پوریا','عبدلی','Grade4', 1),('علی','احمدی','Grade4', 1),('عباس','حسینی','Grade1', 2);
insert into majors (name) Values ('Computer'),('Math'),('history');

select * from students
select * from majors

select COUNT(*)  from students
select COUNT(Lastname) from students
select max(id) from majors
select min(id) from majors
select AVG(id) from majors
select * from students WHERE id between 2 and 3
select concat(firstname , ' '  , lastname) from students
select REPLACE(Lastname,N'ع','ا') from students WHERE Lastname= 'عبدلی'
select * from students order by id desc
select top 2 * from students order by id asc
