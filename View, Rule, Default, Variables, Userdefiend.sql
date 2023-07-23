-- On Testing Database
-- Create Default

create table Student
(
	ID int,
	[Name] nvarchar(20),
	City nvarchar(20),
	Bouns int,
	constraint Chk1 check (Bouns>5000)
)
create table Instructor
(
	ID int,
	[Name] nvarchar(20),
	City nvarchar(20),
	Salary int,
	constraint Chk2 check (Salary>5000)
)
create table Center
(
	ID int,
	[Name] nvarchar(20),
	City nvarchar(20),
	Rent int,

)
CREATE DEFAULT dcity as 'Minia';


sp_bindefault dcity, '[Student].[City]'
sp_bindefault dcity, '[Instructor].[City]'
sp_bindefault dcity, '[Center].[City]'

INSERT INTO Student(Name) values('TestDefault')

SELECT * FROM Student


sp_unbindefault '[Student].[City]'
sp_unbindefault '[Instructor].[City]'
sp_unbindefault '[Center].[City]'

drop default dCity

--==============================================
--==============================================
--==============================================

create rule R1 as @col >5000

sp_bindrule R1, 'Student.Salary'


--==============================================
--==============================================
--==============================================

CREATE VIEW Student_Info
AS(
SELECT ID ,[Name], City, Bouns  FROM Student
)

SELECT * FROM Student_Info
select Name from Student_Info

select Name from Student_Info
where ID= NULL

--===================================================
--===================================================
declare @MyVar nvarchar(11)
--assign value using set
set @MyVar ='test'

select @MyVar

--assign value using select
select @MyVar ='t'

print @MyVar

--==============================================
--=============================================
--==============================================

create type Tel from nvarchar(11) not null
--or--
sp_addtype SSN from 'nvarchar(50)','not null'

create table Dept
(
	ID int ,
	Phone Tel
)

alter table Dept
alter column Phone nvarchar(11) not null

drop type Tel