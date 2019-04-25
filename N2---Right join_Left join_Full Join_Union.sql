create database "Shamsipour"
create table students (id  int identity(1,1) PRIMARY KEY, Firstname NVARCHAR(20) NOT NULL, Lastname NVARCHAR(20) NOT NULL, grade NVARCHAR(20) , major int NOT NULL);
create table majors (id  int identity(1,1) PRIMARY KEY , name NVARCHAR(20)NOT NULL);
insert into students (Firstname,Lastname,grade,major) Values ('پوریا','Abdoli','Grade4', 1),('علی','احمدی','Grade4', 1),('عباس','حسینی','Grade1', 2);
insert into majors (name) Values ('Computer'),('Math'),('history');

select * from students
select * from majors
UPDATE students set Lastname='عبدلی' where Lastname='abdoli'
Delete From students WHERE Firstname='عباس'
alter table students
	add foreign key (major) references majors(id)
select * from students left join majors on students.major=majors.id
UNION ALL
select * from students right join majors on students.major=majors.id;
select * from students full join majors on students.major=majors.id;