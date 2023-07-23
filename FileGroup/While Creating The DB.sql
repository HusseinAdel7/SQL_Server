CREATE DATABASE Testing2
on (
	NAME = file1,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file1.mdf',
	SIZE = 10MB 
)
LOG on
(	
	NAME = file2,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file2.ldf',
	SIZE=50MB
);

DROP DATABASE Testing2


--=================================================================

-- more than one file while creating the database 

CREATE DATABASE Testing2
ON 
(
	NAME=file1,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file1.mdf',
	SIZE = 4
),
(
	NAME=file2,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file2.ndf',
	SIZE = 4
)
LOG ON
(
	NAME=file3,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file3.ldf',
	SIZE = 4
);

	
DROP DATABASE Testing2
--=====================================================================================================

-- Can't add more than one log file 
-- can add a file after log file but not applicable for a filegroup 


CREATE DATABASE Testing2
ON 
(
	NAME=file1,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file1.mdf',
	SIZE = 4
),
(
	NAME=file2,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file2.ndf',
	SIZE = 4
)
LOG ON
(
	NAME=file3,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file3.ldf',
	SIZE = 4
),
(
	NAME=file4,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Testing2\file4.ndf',
	SIZE = 4
);	

DROP DATABASE Testing2

--=====================================================================================================

