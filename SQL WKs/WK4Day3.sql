--WK4Day3
--1, Write the statement(s) to create a view Top10Invoices that lists the top 10 VendorID and Invoice Total when the invoice total (less the credit & payment) is more than zero. The output should be sorted in descending order by Invoice total. See starter code in notes area.

CREATE VIEW Top10Invoices AS
SELECT TOP 10 VendorID, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
ORDER BY InvoiceTotal DESC
GO

SELECT * 
FROM Top10Invoices
GO


--2, Write the statement(s) to create a view OverDueInvoices that lists InvoiceID, InvoiceDate, and InvoiceTotal for invoices that have no payment date and the due date is past due. The output should be sorted in descending order by Invoice total. See starter code in notes area.

DROP VIEW OverDueInvoices
GO
CREATE VIEW OverDueInvoices
AS
SELECT InvoiceID, InvoiceDate, InvoiceTotal, InvoiceDueDate, PaymentDate
FROM invoices
WHERE PaymentDate is null and InvoiceDate < GETDATE()
GO

SELECT * 
FROM OverDueInvoices  
ORDER BY InvoiceTotal DESC
GO

--3, Work with an updatable view; see starter code in notes area.
--Write the statement(s) to create an updatable view named ChangeTerms to returns all columns of the Terms table. 
--Write a select query to show the results from ChangeTerms.
--Write an insert statement for Net due 220 days as 220 days.
--Write an update statement to change both references to 240 days instead of 220 days.

CREATE VIEW ChangeTerms AS
SELECT TermsID, TermsDescription, TermsDueDays
FROM Terms
Go

SELECT TermsID, TermsDescription, TermsDueDays
FROM ChangeTerms;

INSERT ChangeTerms
VALUES ('Net due 220 days', 220);
GO

UPDATE ChangeTerms
SET TermsDescription = 'Net due 220 days',
	TermsDueDays = 240
WHERE TermsID = 8
GO
