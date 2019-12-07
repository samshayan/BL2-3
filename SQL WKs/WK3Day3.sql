--WK3Day3
USE AP;
--1, Write a SELECT statement that returns the same result as the statement below. Substitute a subquery in the WHERE clause for the inner join.

		SELECT DISTINCT AccountDescription
		FROM GLAccounts
		join InvoiceLineItems
			on GLAccounts.AccountNo = InvoiceLineItems.AccountNo 
		ORDER BY AccountDescription;

SELECT AccountDescription
FROM GLAccounts
WHERE AccountNo = ANY --in
	(SELECT DISTINCT AccountNo FROM InvoiceLineItems)
ORDER BY AccountDescription;

--2, Write a SELECT statement using a subquery that finds the invoices (InvoiceNumber & InvoiceTotal) that have an InvoiceTotal greater than the average InvoiceTotal. Sort in descending order by InvoiceTotal.

SELECT InvoiceNumber, InvoiceTotal
FROM invoices

WHERE InvoiceTotal >  (SELECT AVG(InvoiceTotal) FROM Invoices Inv)
ORDER BY InvoiceTotal desc;

--3, Write a SELECT statement using a subquery that shows the TermsID & TermsDescription for any TermID not found in the Invoices table. HINT: You might need to insert an unused term into your Terms table. See notes area for the insert code.

INSERT INTO [dbo].[Terms]
           ([TermsDescription]
           ,[TermsDueDays])
     VALUES
           ('Net due 120 days'
           ,120)
GO


SELECT TermsID, TermsDescription
FROM Terms
WHERE TermsID not in ( SELECT DISTINCT TermsID FROM Invoices)

--4, Write a SELECT statement using the GLAccounts table that returns one row for each account number that has never been used in InvoiceLineItems. Return the AccountNo & AccountDescription. Write 2 statements that give the same results using: 

--a, A correlated subquery introduced with the NOT EXISTS operator

SELECT AccountNo, AccountDescription
FROM GLAccounts
WHERE NOT EXISTS (
	SELECT 1 FROM InvoiceLineItems
	WHERE GLAccounts.AccountNo = InvoiceLineItems.AccountNo
	)				

--b, A non-correlated subquery

SELECT AccountNo, AccountDescription
FROM GLAccounts
WHERE AccountNo not in (
	SELECT DISTINCT AccountNo FROM InvoiceLineItems
	)
ORDER BY AccountNo ;


