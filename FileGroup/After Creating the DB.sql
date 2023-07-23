

-- Adding more than one file TO *Primary* filegroup " Default"
ALTER DATABASE Testing1
ADD FILE
(
	NAME = file1,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing1\file1.mdf',
	SIZE = 100MB,
	MAXSIZE = 200,
	FILEGROWTH = 10
)
ALTER DATABASE Testing1
ADD FILE
(
	NAME = file2,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing1\file2.ndf',
	SIZE = 100MB,
	MAXSIZE = 200,
	FILEGROWTH = 10
)


-- Remove the Files that added to a filegroup
ALTER DATABASE Testing1
REMOVE FILE file1

ALTER DATABASE Testing1
REMOVE FILE file2

--==========================================================================


-- Add filegroup 
ALTER DATABASE Testing1
ADD FILEGROUP SecondaryFG;

-- Add file to created filegroup 
ALTER DATABASE Testing1
ADD FILE
(
    NAME = file3,
    FILENAME = 'E:\file3.ndf',
    SIZE = 100MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10MB
),
(
    NAME = file4,
    FILENAME = 'E:\file4.ndf',
    SIZE = 100MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10MB
)
TO FILEGROUP SecondaryFG;



-- Remove the Files that added to a filegroup
ALTER DATABASE Testing1
REMOVE FILE file3

ALTER DATABASE Testing1
REMOVE FILE file4

--==========================================================================

-- can't make a filegroup in default without there are no files in it (must there is at least one file to make the filegroup as a default)
ALTER DATABASE Testing1 MODIFY FILEGROUP  SecondaryFG DEFAULT;


--==============================================================================
-- remove filegroup

-- error you can't remove it because it has files 
ALTER DATABASE Testing1
REMOVE FILEGROUP SecondaryFG

-- remove all files in the filegroup then remove the filegroup itself
ALTER DATABASE Testing1
REMOVE FILE file3
ALTER DATABASE Testing1
REMOVE FILE file4

ALTER DATABASE Testing1
REMOVE FILEGROUP SecondaryFG


--================= add table on file =======

use Testing1
CREATE TABLE EMP
(
	ID INT PRIMARY KEY,
	Fname NVARCHAR(20),
	Lname NVARCHAR(20),
	Phone int
)
on [SecondaryFG]
