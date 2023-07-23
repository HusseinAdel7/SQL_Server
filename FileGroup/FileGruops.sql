CREATE DATABASE DotNetTrackCompany
on (
	NAME = DOTNETTRACKCOMPANYDATA,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DOTNETTRACKCOMPANYDATA.mdf',
	SIZE = 10MB ,
	MAXSIZE= 5MB,
	FILEGROWTH=50MB
)
LOG on
(	
	NAME = SD3xCompanyLog,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DOTNETTRACKCOMPANYDATA.ldf',
	SIZE=5MB,
	MAXSIZE=40MB,
	FILEGROUGH=2MB
);

USE DotNetTrackCompany
ALTER DATABASE DotNetTrackCompany
ADD FILEGROUP SecondaryFG;

ALTER DATABASE DotNetTrackCompany
ADD FILE
(
	NAME = 'firstFile',
	FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\firstFile.ndf',
	SIZE = 8MB,
	MAXSIZE=10MB,
	FILEGROWTH=2MB
)
TO FILEGROUP SecondaryFG

ALTER DATABASE DotNetTrackCompany
ADD FILE
(
	NAME = 'secondFile',
	FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\secondFile.ndf',
	SIZE = 8MB,
	MAXSIZE=10MB,
	FILEGROWTH=2MB
)
TO FILEGROUP SecondaryFG


use DotNetTrackCompany
create table Employee
(
	ID int,
	FirstName nvarchar(15),
	LastName nvarchar(15),
	[Address] nvarchar(50),
	City nvarchar(20)
)


use DotNetTrackCompany
SELECT * FROM Employee;