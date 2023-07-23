
-- This trigger recalculates the order amount after an orderitem row is changed

CREATE TRIGGER OrderItemUpdate
ON [dbo].[OrderItem]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OrderId INT;
	SELECT @OrderId = INSERTED.[OrderId]FROM INSERTED
	UPDATE [dbo].[Order]
	SET [TotalAmount]= ( SELECT SUM([UnitPrice]*[Quantity]) 
						FROM OrderItem
						WHERE OrderId = @OrderId )
		WHERE [Order].Id = @OrderId;
END


--===============================================================
--Create a trigger that prevents changes to order items.


CREATE TRIGGER OrderItemBlock
ON OrderItem
INSTEAD OF UPDATE,DELETE
AS
BEGIN

	DECLARE @Message VARCHAR(MAX)
	SET @Message = '!! Can Not Update Or Delete Anything Because Of Restrictions !!'
	RAISERROR (@Message, 16, 1) 
END


UPDATE [dbo].[OrderItem]
SET [UnitPrice] =1 WHERE [OrderId]=1

SELECT * FROM [dbo].[OrderItem]

--===============================================================
--Drop Trigger


DROP TRIGGER OrderItemBlockDROP TRIGGER OrderItemUpdate--===============================================================--  Prevent users from making table schema changes. Rollback any attempt.CREATE TRIGGER TriggerTableRestrictions
ON  DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	PRINT 'No table modifications can be made'
	ROLLBACK
END--===============================================================-- List All TriggersSELECT *
 FROM sys.triggers 
WHERE type = 'TR';-- ===========================================================================-- ===========================================================================-- ===========================================================================-- Using Another Database  "TestTriggersDB"--create DB and Table to test Triggers

create database TestTriggersDB

CREATE TABLE Student 
(  
Student_RollNo INT NOT NULL PRIMARY KEY,  
Student_FirstName Varchar (100),  
Student_EnglishMarks INT,  
Student_PhysicsMarks INT,   
Student_ChemistryMarks INT,  
Student_MathsMarks INT,  
Student_TotalMarks INT,  
Student_Percentage  INT
); 


-- ==================================================================
-- A trigger After the insertion of the student record in the table
CREATE TRIGGER OrderItemUpdSate
ON Student
AFTER INSERT
AS
BEGIN
	PRINT 'You Can not'
END



