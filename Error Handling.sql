BEGIN TRY  
	 SELECT 1/0  
END TRY  
BEGIN CATCH
	SELECT	ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
END CATCH

--=========================================
-- Adding a new customer without last name.

BEGIN TRY  
  /* Customer table columns:
  FirstName and LastName NOT NULL
  City, Country, and Phone NULL */

  INSERT INTO Customer VALUES('Jessie', NULL, 'New York', 'US', '212 589 874')
END TRY  
BEGIN CATCH  
  SELECT ERROR_NUMBER() AS ErrorNumber,
         ERROR_SEVERITY() AS ErrorSeverity,
         ERROR_STATE() AS ErrorState,
         ERROR_PROCEDURE() AS ErrorProcedure,
         ERROR_LINE() AS ErrorLine,
         ERROR_MESSAGE() AS ErrorMessage
END CATCH




