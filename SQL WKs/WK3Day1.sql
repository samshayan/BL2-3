--WK3Day1

use ap;
go
--1, Write a SELECT statement that returns all columns from the Invoices table inner-joined with the Terms table.

SELECT * 
FROM Invoices 
JOIN Terms 
ON invoices.TermsID = terms.TermsID;

--2, Write a SELECT statement that returns InvoiceNumber, InvoiceDate, TermsDueDays, and Balance (InvoiceTotal minus PaymentTotal minus CreditTotal). The result set should have one row for each invoice with a non-zero balance. Sort by the Balance in descending order.

SELECT InvoiceNumber, InvoiceDate, TermsDueDays, 
InvoiceTotal - PaymentTotal - CreditTotal AS Balance 
FROM Invoices 
JOIN Terms
ON invoices.TermsID = terms.TermsID
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0
ORDER BY Balance DESC;

--3, Write a SELECT statement using an outer join that returns the AccountNo & AccountDescription from GLAccounts. The output has one row for each account number that has never been used & is sorted by AccountNo.

SELECT GLAccounts.AccountNo ,AccountDescription
FROM GLAccounts 
LEFT JOIN invoiceLineItems
ON  GLAccounts.AccountNo = invoiceLineItems.AccountNo
WHERE InvoiceLineItems.AccountNo is NULL
ORDER BY GLAccounts.AccountNo ;

--4, Write a SELECT statement that returns the VendorName, DefaultTermsID, and TermsDescription. The results show one row per vendor and are sorted by TermsDescription, then by VendorName.

SELECT VendorName, DefaultTermsID, TermsDescription
FROM Vendors 
JOIN Terms
ON  Vendors.DefaultTermsID = Terms.TermsID
ORDER BY TermsDescription, VendorName ;

--5, Write a SELECT statement that uses a self-join and returns VendorID, VendorName, and Name (the concatenation of VendorContactFName, a space, & VendorContactLName). The output has one row for each vendor whose contact has the same first name as another vendor's contact. Sort by the concatenated name.

SELECT v1.VendorID, v1.VendorName, v1.VendorContactFName +' '+  v1.VendorContactLName AS Name
FROM Vendors as v1
JOIN Vendors as v2
ON v1.VendorContactFName = v2.VendorContactFName
and v1.VendorID <> v2.VendorID
ORDER BY Name;