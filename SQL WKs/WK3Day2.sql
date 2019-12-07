--WK3Day2
--1, Write a SELECT statement that returns 2 columns from the InvoiceLineItems table: InvoiceID & Amount Due, where Amount Due is the sum of InvoiceLineItemAmount for each InvoiceID.
USE AP;
GO

SELECT InvoiceID, SUM(InvoiceLineItemAmount) AS 'Amount Due'
FROM InvoiceLineItems 
GROUP BY InvoiceID

--2, Write a SELECT statement based on #1, that includes the InvoiceTotal from Invoices. Join where the InvoiceIDs are equal.

SELECT Invoices.InvoiceID, SUM(InvoiceLineItemAmount) AS 'Amount Due'
FROM InvoiceLineItems 
JOIN Invoices
ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
GROUP BY Invoices.InvoiceID, InvoiceTotal
ORDER BY Invoices.InvoiceID;

--3, Write a SELECT statement that displays the AccountDescription for each GLAccount and the number of InvoiceLineItems for that GLAccount. Sort by the AccountDescription.

SELECT AccountDescription, COUNT(*) AS LineItems
FROM GLAccounts  
JOIN InvoiceLineItems 
ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY AccountDescription
ORDER BY AccountDescription;

--4, Write a SELECT statement based on #3, that includes the average line item total for each GLAccount showing only 2 decimal places and accounts with 2 or more invoice line items. Sort in descending order of the average line item total.

SELECT AccountDescription, COUNT(*) AS LineItems, CAST(AVG(InvoiceLineItemAmount) AS decimal(19,2)) AS Average
FROM GLAccounts  
JOIN InvoiceLineItems 
ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY 3 desc;


