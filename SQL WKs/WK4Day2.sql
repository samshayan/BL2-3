--WK4Day2
--1, Write a select statement that returns information from Vendors whose zip code starts with 9. Use a function in your WHERE clause. Sort the results by the area code.Column 1 "Name" is the contact's name using the first name initial followed by a period, a space, and then last name. Column 2 "Area Code" is the contacts 3 digit area code only. 
USE AP;

SELECT LEFT(VendorContactFName, 1) + '. ' + VendorContactLName Name, SUBSTRING(VendorPhone, 2, 3) 'Area Code'
FROM Vendors
WHERE SUBSTRING(VendorZipCode, 1, 1) = '9';


--2, Rewrite #1 using a LIKE condition in your WHERE clause and no function in the WHERE clause.

SELECT LEFT(VendorContactFName, 1) + '. ' + VendorContactLName Name, SUBSTRING(VendorPhone, 2, 3) 'Area Code'
FROM Vendors
WHERE VendorZipCode LIKE '9%';

--3, Write a select statement that returns the day of the week (Sunday, Monday, etc.) you were born on.
 
 SELECT DATENAME(WEEKDAY, '11/11/1992') 'Day of the week I was born';

 --4, Write the SQL to show the VendorID, VendorName and Address line 1. If the Address line 1 has nothing in it, print out 'NO ADDRESS ON FILE'. Show the vendors with no Address line 1 at the top of the report.

 SELECT VendorID, VendorName, ISNULL(VendorAddress1, 'NO ADDRESS ON FILE') AddressLine1
 FROM Vendors
 ORDER BY  VendorAddress1 ;