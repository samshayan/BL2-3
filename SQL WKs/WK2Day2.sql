--WK2Day2
--1,
use MyGuitarShop;
select ListPrice,
	CAST(ListPrice AS decimal(9,1)) AS PriceFormat,
	CONVERT(int, ListPrice) AS PriceInteger,
	CAST(ListPrice AS bigint) AS PriceIntCast
from Products;

--2,
Select DateAdded,
	CAST(DateAdded AS date) AS DateOnly,
	CAST(DateAdded AS time) AS TimeOnly,
	CAST(DateAdded AS char(7)) AS MonthOnly
from Products;

--3,
select OrderDate,
	CONVERT(varchar, OrderDate, 101 ) AS MMDDYYYY,
	CONVERT(varchar, OrderDate, 100) AS LongDate,
	CONVERT(varchar, OrderDate, 108) LongDate24
from Orders;


