--WK4Day4
--1, Use AP: Write a script that declares & sets a variable that is equal to the Invoice total for vendor id 83 where the Invoice total (less the credit total & payment total) is greater than zero. If that balance due is greater than $100 the script returns the Vendor Contact First Name and Balance due. If that balance due is less than $100, the script should return the message 'Balance due is less than $100.00.‘

USE AP;

DECLARE @invTotal money;
SET @invTotal = (SELECT InvoiceTotal - PaymentTotal - CreditTotal 
				FROM Invoices
				WHERE VendorID = 83 
				AND InvoiceTotal - PaymentTotal - CreditTotal > 0);

--SELECT @invTotal;
IF @invTotal >= 100
	SELECT VendorContactFName, @invTotal  BalDue
	FROM Vendors
	WHERE VendorID = 83;
ELSE
	SELECT 'Balance due is less than $100.00';


--2, Use MyGuitarShop: Write a script that attempts to insert a new category named “Guitars” into the Categories table using a local variable to hold the new category name. 
	--If the insert is successful, the script should display this message:
	--SUCCESS: Record was inserted.
	--If the update is unsuccessful, the script should display a message something like this:
	--Error 2627: Violation of UNIQUE KEY constraint 
	--Rerun this script, changing the new category variable to “Flutes”

USE [MyGuitarShop]
GO

DECLARE @Category varchar(255);
SET @Category = 'Flutes';
BEGIN TRY
	INSERT INTO [dbo].[Categories]
			   ([CategoryName])
		 VALUES
			   (@Category);
	SELECT 'SUCCESS: Record was inserted';
END TRY
BEGIN CATCH
	SELECT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;


