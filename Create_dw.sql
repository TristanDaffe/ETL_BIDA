IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'FoodiesDw')
  BEGIN
    CREATE DATABASE [FoodiesDw]
    END

USE Foodies977Dw;

DROP TABLE IF EXISTS factSales

DROP TABLE IF EXISTS dimDate
CREATE TABLE dimDate
(
DateKey int PRIMARY Key,
DayFrenchName nvarchar(100) NOT NULL,
DayEnglishName nvarchar(100) NOT NULL,
MonthFrenchName nvarchar(100) NOT NULL,
MonthEnglishName nvarchar(100) NOT NULL,
"Year" int NOT NULL,
);


DROP TABLE IF EXISTS dimProduct
CREATE TABLE dimProduct
(
ProductKey varchar(100) PRIMARY KEY,
OriginalId int NOT NULL,
productName nvarchar(40) NOT NULL,
QuantityPerUnit varchar(100) NOT NULL,
Discontinued bit NOT NULL,
);


DROP TABLE IF EXISTS dimCustomer
CREATE TABLE dimCustomer
(
CustomerKey varchar(50) PRIMARY KEY,
[CompanyName] nvarchar(50),
[OriginalId] varchar(50),
[ContactName] nvarchar(50)

);

DROP TABLE IF EXISTS dimEmployee
CREATE TABLE dimEmployee
(
EmployeeKey varchar(100) PRIMARY KEY,
OriginalId int NOT NULL,
LastName varchar(100) NOT NULL,
FirstName varchar(100) NOT NULL,
);

INSERT INTO dimEmployee VALUES 
('Unknown', 0, 'Unknown', 'Unknown');

DROP TABLE IF EXISTS dimCategory
CREATE TABLE dimCategory
(
CategoryKey varchar(100) PRIMARY KEY,
OriginalId int NOT NULL,
NameEnglish varchar(100) NOT NULL,
NameFrench varchar(100) NOT NULL,
);
INSERT INTO dimCategory VALUES 
(0, 0, 'Unknown', 'Unknown');

DROP TABLE IF EXISTS dimLocation
CREATE TABLE dimLocation
(
LocationKey varchar(100) PRIMARY KEY,
City varchar(100) NOT NULL,
Country varchar(100) NOT NULL,
Region varchar(100) NOT NULL,
PostalCode varchar(100) NOT NULL,
);

INSERT INTO dimLocation VALUES
('Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown');


CREATE TABLE factSales
(
SalesKey int IDENTITY(1,1) PRIMARY KEY,
OriginalId int NOT NULL,
CustomerKey varchar(50) NOT NULL 
CONSTRAINT FK_CustomerKey REFERENCES dimCustomer(CustomerKey),
CustomerLocationKey varchar(100) NOT NULL
CONSTRAINT FK_CustomerLocationKey REFERENCES dimLocation(LocationKey),
SellerKey varchar(100) NOT NULL
CONSTRAINT FK_SellerKey REFERENCES dimEmployee(EmployeeKey),
OrderDateKey int NOT NULL
CONSTRAINT FK_OrderDateKey REFERENCES dimDate(DateKey),
ShipDateKey int NOT NULL
CONSTRAINT FK_ShipDateKey REFERENCES dimDate(DateKey),
ShipLocationKey varchar(100) NOT NULL
CONSTRAINT FK_ShipLocationKey REFERENCES dimLocation(LocationKey),
ShipperName varchar(100) NOT NULL,
ProductKey varchar(100) NOT NULL
CONSTRAINT FK_ProductKey REFERENCES dimProduct(ProductKey),
CategoryKey varchar(100) NOT NULL
CONSTRAINT FK_CategoryKey REFERENCES dimCategory(CategoryKey),
Quantity int NOT NULL, 
Discount float NOT NULL, 
isOnline bit NOT NULL,
);
