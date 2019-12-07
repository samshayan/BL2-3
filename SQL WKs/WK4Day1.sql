--WK4Day1
--1, Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: FirstName, LastName, Line1, City, State, ZipCode.Return one row for each customer, but only return addresses that are the shipping address for a customer.
USE MyGuitarShop;

SELECT FirstName, LastName, Line1, City, State, ZipCode
FROM Customers 
JOIN Addresses 
	ON Customers.CustomerID = Addresses.CustomerID
	and ShippingAddressID = AddressID;

--2, Write a SELECT statement that joins the Customers, Orders, OrderItems, and Products tables. This statement should return these columns: LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity.--Use aliases for the tables.Sort the final result set by LastName, --OrderDate, and ProductName.

SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
FROM Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID
JOIN OrderItems oi
	ON o.OrderID = oi.OrderID
JOIN Products p
	ON oi.ProductID = p.ProductID
ORDER BY LastName, OrderDate, ProductName;

--3, Write a SELECT statement joining 4 tables that shows VendorName, AccountDescription, LineItemCount (row count), & LineItemSum (sum of InvoiceLineItemAmount). For each vendor & account, return the number & sum of line items, sorted by vendor, then account description.
USE AP;

SELECT VendorName, COUNT(*) LineItemCount,  sum(InvoiceLineItemAmount) LineItemSum, AccountDescription
FROM vendors 
JOIN Invoices 
	ON vendors.VendorID = Invoices.VendorID
JOIN InvoiceLineItems 
	ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
JOIN GLAccounts 
	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription

--4, Write a SELECT statement which returns the Vendor Name and Total Number of Accounts and shows the vendors that are paid from more than one account.
SELECT VendorName, COUNT(DISTINCT AccountNo) 'Total Number of Accounts'
FROM Vendors
JOIN Invoices
	ON Invoices.VendorID = Vendors.VendorID
JOIN InvoiceLineItems
	ON invoices.InvoiceID = InvoiceLineItems.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT AccountNo) > 1
ORDER BY VendorName;

--5, Write a SELECT statement that answers this question: Which products have a list price that’s greater than the average list price for all products? --Return the ProductName and ListPrice columns for each product. --Sort the results by the ListPrice column in descending sequence.

USE MyGuitarShop;

SELECT ProductName, ListPrice
FROM Products
WHERE listPrice > 
	(SELECT AVG(listPrice) Average
	FROM Products)
ORDER BY ListPrice desc;

--6, Write a SELECT statement that returns the CategoryName column from the Categories table. --Return one row for each category that has never been assigned to any product in the Products table. To do that, use a subquery introduced with the NOT EXISTS operator.
SELECT CategoryName
FROM Categories
WHERE NOT EXISTS
	(SELECT CategoryID
	FROM Products
	WHERE Categories.CategoryID = Products.CategoryID);


