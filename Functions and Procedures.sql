-- Create a Schema Called "Functions_Procedures"
CREATE SCHEMA Functions_Procedures;


-- Create a	Function That Returns Date in Year, Month and Day
create FUNCTION Functions_Procedures.MyDate(@date VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
  DECLARE @year VARCHAR(10)
  DECLARE @month VARCHAR(10)
  DECLARE @day VARCHAR(10)
  SET @year=(select DATENAME(YY,@date))
  SET @month=(select DATENAME(mm,@date))
  SET @day=(select DATENAME(DD,@date))
  RETURN 'Year is : '+ @year + ',    Month is :  ' + @month + ',    Day is : ' + @day
END

select Functions_Procedures.MyDate(GETDATE())
--===================================================================================


-- Function That Returns Vlues In Certain Range (Start , End) In A Table 
CREATE FUNCTION Functions_Procedures.GetValuesBetween(@start INT, @end INT)
RETURNS @Values TABLE (Value INT)
AS
BEGIN
    WHILE @start <= @end
		BEGIN
			INSERT INTO @Values (Value) VALUES (@start)
			SET @start = @start + 1
		END
    RETURN
END

SELECT * FROM Functions_Procedures.GetValuesBetween(1, 10)
--===================================================================================

CREATE FUNCTION CHECKING_NULLS(@id INT)
RETURNS  VARCHAR(50)
BEGIN 
	declare @message varchar(50)
	declare @city varchar(50)
	declare @country varchar(10)
	SET @city =(SELECT @city From Customer WHERE Id = @id);
	set @country =(SELECT @country From Customer WHERE Id = @id);

	IF(@city is Null and @country is Null )
		BEGIN
			SET @message  ='City & Country are null'
		END
	ELSE IF(@city is Null  )
		BEGIN
			SET @message  = 'City is null'
		END
	ELSE IF(@country is Null  )
		BEGIN
			SET @message  = 'Country is null'
		END
	ELSE
		BEGIN
			SET @message  ='City & Country name are not null'
		END 
	RETURN @message
END

SELECT dbo.CHECKING_NULLS(4)
--=================================================================================================================


-- Function To Display the Employee info (Experiece years, Age, Title Job, Graduation Project) From AdventureWorks DB
CREATE FUNCTION Employees_Info()
RETURNS TABLE
AS
RETURN(
	SELECT [JobTitle], CAST( DATENAME(yy,GETDATE()) as int)-DATENAME(yy,[HireDate]) AS 'NO.Of.Experience Years',
			CAST( DATENAME(yy,GETDATE()) as int)-DATENAME(yy,BirthDate) AS 'Age'
			,CONCAT(DATENAME(dd,[BirthDate]),DATENAME(mm,[BirthDate]) ,DATENAME(yy,[BirthDate])+21) AS 'Graduation Year'

	FROM [HumanResources].[Employee]	  
) 
SELECT * FROM dbo.Employees_Info()
--===================================================================================


-- Function shows how many produnt the the company is supplied
CREATE PROC countdepartment
AS
BEGIN
	SELECT  COUNT (p.Id) AS 'Number of student ' , s.CompanyName AS 'Department Name '
	FROM [dbo].[Product] p  join [dbo].[Supplier] s
	ON  p.id=s.Id
	GROUP BY  CompanyName
END

Exec countdepartment
--===================================================================================



CREATE PROC Employeenumber
AS
BEGIN
	DECLARE  @num INT
    SET @num=( SELECT COUNT(w.ESSN)
	FROM  [dbo].[Project] p,[dbo].[Works_ON] w
	WHERE p.PNumber=w.PNO and p.PName='P1')
	IF(@num>3)
	PRINT 'The number of employees in the project p1 is 3 or more'
	ELSE
		SELECT  emp.FName+emp.LName AS 'full name' ,ct.PName AS 'project Name p1'
		FROM Employee   emp ,Works_ON w,Project ct
		WHERE emp.SSN=w.ESSN and w.PNO=ct.PNumber and ct.PName='P1'
END