create database "Shamsipour"
create table students (id  int identity(1,1) PRIMARY KEY, Firstname NVARCHAR(20) NOT NULL, Lastname NVARCHAR(20) NOT NULL, grade NVARCHAR(20) , major int NOT NULL);
create table majors (id  int identity(1,1) PRIMARY KEY , name NVARCHAR(20)NOT NULL);
insert into students (Firstname,Lastname,grade,major) Values ('پوریا','عبدلی','Grade4', 1),('علی','احمدی','Grade4', 1),('عباس','حسینی','Grade1', 2);
insert into majors (name) Values ('Computer'),('Math'),('history');

select * from students
select * from majors

select count(*),Lastname from students group by Lastname;
select max(id),Lastname from students group by Lastname;
select max(id),Lastname from students group by Lastname having count(id) > 0;

