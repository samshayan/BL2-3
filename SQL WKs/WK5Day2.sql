--Wk5Day2
--UPS was purchased by FedEx & the new company is FedUp.
--Create a set of action queries inside a transaction to:
--Declare 2 variables: @DeleteVendorID & @NewVendorID
--Select the VendorID for United Parcel Service (using the vendor name) into @DeleteVendorID before the transaction 
--Select the VendorID for Federal Express Corporation (using the vendor name) into @NewVendorID before the transaction
--Inside the transaction:
--Update the invoices table setting VendorID to @NewVendorID where VendorID = @DeleteVendorID
--Delete the row in Vendors where the VendorID = @DeleteVendorID
--Update Vendors setting VendorName = 'FedUP' where the VendorID = @NewVendorID
--If the row count from the delete statement is less than 1, print an error & rollback. 

--Shows counts for the 2 vendors
select Vendors.VendorID, VendorName, count(*) 
from Vendors
join Invoices on Vendors.VendorID = Invoices.VendorID
where VendorName = 'United Parcel Service' or VendorName = 'Federal Express Corporation' or VendorName = 'FedUp'
group by Vendors.VendorID, VendorName;

DECLARE @DeleteVendorID int, @NewVendorID int;
SELECT @DeleteVendorID = vendorID
FROM Vendors
WHERE VendorName = 'United Parcel Service';

SELECT @NewVendorID = vendorID
FROM Vendors
WHERE VendorName = 'Federal Express Corporation';

BEGIN TRY
	BEGIN TRAN
		UPDATE Invoices
		SET VendorID = @NewVendorID
		WHERE VendorID = @DeleteVendorID;

		DELETE Vendors
		WHERE VendorID = @DeleteVendorID;
		IF @@ROWCOUNT < 1
			BEGIN
				ROLLBACK TRAN;
				THROW 50001, 'No rows to delete', 1
			END
		UPDATE Vendors
		SET VendorName = 'FedUp'
		WHERE VendorID = @NewVendorID;
	COMMIT TRAN
END TRY
BEGIN CATCH
	--ROLLBACK TRAN;
	SELECT 'Update not completed:' + ERROR_MESSAGE();
END CATCH