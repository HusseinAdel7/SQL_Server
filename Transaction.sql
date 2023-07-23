

-- Create a new order. Ensure that both Order and OrderItems are saved or none at all
BEGIN TRAN;
	INSERT INTO [Order] (OrderNumber, CustomerId, TotalAmount) VALUES (543208, 23, 183.35);
	DECLARE @OrderId INT;
	SET @OrderId = SCOPE_IDENTITY();
	INSERT INTO OrderItem(OrderId, ProductId, UnitPrice, Quantity) VALUES (@OrderId, 5, 21.35, 1);
	INSERT INTO OrderItem(OrderId, ProductId, UnitPrice, Quantity) VALUES (@OrderId, 20, 81.00, 2);

COMMIT TRAN;

SELECT * FROM [Order]
SELECT * FROM [OrderItem]



--  Add a new supplier and their products to the database.

BEGIN TRAN;
	INSERT INTO [Supplier] (CompanyName, ContactName, City, Country, Phone)
	VALUES ('Amsterdam Broodjes', 'Jan van de Berge', 'Amsterdam', 'Netherlands','(31) 1 2612 7769');
	DECLARE @SupplierId INT;
	SET @SupplierId = SCOPE_IDENTITY();
	INSERT INTO Product(SupplierId, ProductName, UnitPrice, Package)
	VALUES (@SupplierId, 'Krentebollen', 4.35, '6 in a bag');
	INSERT INTO Product(SupplierId, ProductName, UnitPrice, Package)
	VALUES (@SupplierId, 'Volkoren brood', 6.35, '1 loaf');
	INSERT INTO Product(SupplierId, ProductName, UnitPrice, Package)
	VALUES (@SupplierId, 'Roggebrood', 2.99, '20 slices per pkgs');
COMMIT TRAN;
--===========================================================
--===========================================================

CREATE DATABASE ATM

CREATE TABLE Person (
	
    PersonID int PRIMARY KEY IDENTITY(1,1),
    FirstName varchar(255),
    LastName varchar(255),
    [Address] varchar(255),
    City varchar(255),
	Age INT
)
 

 
INSERT INTO Person VALUES('Hussein', 'Adel','123  Wern Ddu Lane','LUSTLEIGH',23)
INSERT INTO Person VALUES('Mohamed','Adel','23  Peachfield Road','CEFN EINION',45)
INSERT INTO Person VALUES('Asmaa','Adel','85  Kingsway North','HOLTON',26)
INSERT INTO Person VALUES('Ahmed', 'Samir','59  Dover Road', 'WESTER GRUINARDS',51)
INSERT INTO Person VALUES('Mohamed','Samir','106  Newmarket Road','HAWTHORPE',46)
INSERT INTO Person VALUES('Tony','Michle ','100  Shannon Way','CHIPPENHAM',20)
INSERT INTO Person VALUES('Shehab','Mohamed','14  Pendwyallt Road','BURTON',19)
INSERT INTO Person VALUES('Hassan','Taha ','100  Shannon Way','CHIPPENHAM',18)
INSERT INTO Person VALUES('Hossam','Essam','72  Ballifeary Road','BANCFFOSFELEN',11)

--=========================================================================================


BEGIN TRAN
UPDATE Person  SET Lastname = 'Lucky',  Firstname = 'Luke'  WHERE  PersonID = 1
INSERT INTO Person VALUES('mm','ss','72  Ballifeary Road','BANCFFOSFELEN',11)
PRINT @@TRANCOUNT  -- initail value for @@TRANCOUNT = 1 and increase by one in each executed statement


BEGIN TRAN
UPDATE Person  SET Lastname = 'Lucky',  Firstname = 'Luke'  WHERE  PersonID = 1
PRINT @@TRANCOUNT --@@TRANCOUNT = 3 
COMMIT TRAN 
PRINT @@TRANCOUNT --@@TRANCOUNT = 2


BEGIN TRAN
UPDATE Person  SET Lastname = 'Lucky',  Firstname = 'Luke'  WHERE  PersonID = 1
PRINT @@TRANCOUNT --@@TRANCOUNT = 3 
ROLLBACK TRAN 
PRINT @@TRANCOUNT --@@TRANCOUNT = 0

--===================================================================================


BEGIN TRANSACTION 
INSERT INTO Person VALUES( 'Mouse', 'Micky','500 South Buena Vista Street, Burbank','California',43)
SAVE TRANSACTION InsertStatement
DELETE Person WHERE PersonID=3
SELECT * FROM Person 
ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person

--=======================================================================================

BEGIN TRAN
INSERT INTO Person  VALUES('Bunny', 'Bugs','742 Evergreen Terrace','Springfield',54)
UPDATE Person SET Age='MiddleAge' WHERE PersonID=7
SELECT * FROM Person
COMMIT TRAN

SELECT * FROM Person
