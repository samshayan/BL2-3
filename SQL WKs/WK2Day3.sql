--Wk2Day3
--1,
use MyGuitarShop;
go
drop index if exists Addresses.IX_Addresses_ZipCode;
go
create nonclustered index IX_Addresses_ZipCode on Addresses (ZipCode);

--2,
if DB_ID('MyWebDB') is not null
	--drop database MyWebDB
	drop database if exists MyWebDB;
go
CREATE database MyWebDB;
go
use MyWebDB;
CREATE TABLE  Users (
	UserID		  int		   not null identity primary key,
	EmailAddress  varchar(100) not null unique,
	FirstName	  varchar(100) not null,
	LastName	  varchar(100) not null
);

CREATE TABLE  Products(
ProductID	int			 not null identity primary key,
ProductName	varchar(100) not null
);

CREATE TABLE Downloads (
	DownloadID	 int	      not null identity primary key,
	UserID		 int	      not null references Users(UserID),
	DownloadDate datetime2    not null,
	FileName	 varchar(255) not null,
	ProductID	 int		  not null references Products(ProductID)
)

--3,
ALTER TABLE Products
add Price decimal(5,2) not null default 9.99,
	DateAdded datetime2 not null;

--4,
ALTER TABLE Users
alter column firstName varchar(20) not null
