--============================================
-- SQL NOT NULL Constraint

CREATE TABLE Customer_For_Not_Null (
  Id INT IDENTITY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  City NVARCHAR(40),
  CONSTRAINT PK_Customer_For_Not_Null PRIMARY KEY(Id)
)

ALTER TABLE Customer_For_Not_Null
ALTER COLUMN City NVARCHAR(40) NOT NULL



--=========================================
-- -- SQL Check Constraint 

CREATE TABLE Client (
	Id INT IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Country NVARCHAR(30),
	Status NVARCHAR(12) NOT NULL,
	CONSTRAINT CHK_Status CHECK (Status = 'Active' OR Status = 'InActive')
)

CREATE TABLE Measurement (
  Id INT IDENTITY,
  Temperature INT NOT NULL,
  Pressure INT NOT NULL,
  CONSTRAINT CHK_Measurement CHECK (Temperature > 150 OR Pressure > 100)
)

ALTER TABLE Customer_For_Not_Null  
ADD CONSTRAINT CHK_City CHECK (City = 'UK' OR City = 'France' OR City = 'Spain')

ALTER TABLE Customer_For_Not_Null
DROP CONSTRAINT CHK_City 



--=========================================
-- -- SQL Unique Constraint 

CREATE TABLE Customer_for_unique (
  Id INT IDENTITY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  Email NVARCHAR(50) UNIQUE NOT NULL,
  Phone NVARCHAR(25)
)

ALTER TABLE Customer_for_unique
ADD UNIQUE (Phone)

ALTER TABLE Customer_for_unique
ADD CONSTRAINT uni UNIQUE (Email)

ALTER TABLE Customer_for_unique
DROP CONSTRAINT uni



--=========================================
-- -- SQL Default Constraint 

CREATE TABLE Customer_for_default (
  Id INT IDENTITY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  City NVARCHAR(50),
  Country NVARCHAR(50) DEFAULT 'UK'
)


ALTER TABLE Customer_for_default
ADD CONSTRAINT Df_City DEFAULT 'New York' FOR City

ALTER TABLE Customer_for_default
DROP CONSTRAINT Df_City



--=========================================
--Drop All tables 
DROP TABLE Customer_for_default, Customer_for_unique,Client,Customer_For_Not_Null,Measurement;