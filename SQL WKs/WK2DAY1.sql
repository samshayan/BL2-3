/* 
	Week 2 day 1
*/
--1,
use MyGuitarShop
SELECT ProductCode, ProductName, ListPrice, DiscountPercent 
FROM Products 
ORDER BY ListPrice desc;

--2,
SELECT LastName + ', ' +FirstName as FullName 
FROM Customers
WHERE LastName > 'M'
ORDER BY LastName asc;

--3,
SELECT productName, ListPrice, DateAdded
FROM Products
WHERE ListPrice BETWEEN 500 and 2000
ORDER BY DateAdded desc;

--4,
SELECT ProductName, ListPrice, DiscountPercent, 
		(ListPrice * DiscountPercent) /100 as DiscountAmount,
		ListPrice - (ListPrice * DiscountPercent) /100 as DiscountPrice
FROM Products
ORDER BY 5 desc;

--5,
SELECT ItemID, ItemPrice, DiscountAmount, Quantity,
	ItemPrice * Quantity as PriceTotal,
	DiscountAmount * Quantity as DiscountTotal,
	(ItemPrice - DiscountAmount) * Quantity as ItemTotal
FROM OrderItems
WHERE (ItemPrice - DiscountAmount) * Quantity > 500
ORDER BY ItemTotal desc;

--6,
SELECT OrderID, OrderDate, ShipAmount
FROM Orders
WHERE ShipDate is Null;

