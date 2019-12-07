--Wk5Day1
--Create a stored procedure, sp_InsTerms, that inserts a new Terms row. The procedure accepts the description & due days. Include drop logic, error checking, and execution statements (1 that works & 1 that generates a user error).
USE AP;
GO

DROP PROC IF EXISTS sp_InsTerms;
GO

CREATE PROC sp_InsTerms 
	@description varchar(50),
	@dueDays smallint
AS
	BEGIN TRY
		INSERT INTO [dbo].[Terms]
				   ([TermsDescription]
				   ,[TermsDueDays])
			 VALUES
				   (@description
				   ,@dueDays)
		END TRY
		BEGIN CATCH
			PRINT 'An error occurd. Row was inserted. '
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_NUMBER());
			PRINT 'Error number: '+
				CONVERT(varchar(100), ERROR_MESSAGE());
		END CATCH
GO

--sp_InsTerms 'Net due 400 days' , 400
--sp_InsTerms  NULL, 450
--sp_InsTerms 'Net due 400 days' , NULL