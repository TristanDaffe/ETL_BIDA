USE Foodies977Dw;

DROP TABLE factSales;
DROP TABLE dimDate;
DROP TABLE dimProduct;
DROP TABLE dimCustomer;
DROP TABLE dimEmployee;
DROP TABLE dimCategory;
DROP TABLE dimLocation;

DROP TABLE IF EXISTS dimDate
CREATE TABLE dimDate
(
    DateKey int IDENTITY(1,1) PRIMARY Key,
	DayFrenchName nvarchar(100) NOT NULL,
	DayEnglishName nvarchar(100) NOT NULL,
	MonthFrenchName nvarchar(100) NOT NULL,
	MonthEnglishName nvarchar(100) NOT NULL,
	WeekNumber int NOT NULL,
	DayOfYearNumber int NOT NULL,
	DayOfWeekNumber int NOT NULL,
);


DROP TABLE IF EXISTS dimProduct
CREATE TABLE dimProduct
(
    ProductKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    productName nvarchar(40) NOT NULL,
    QuantityPerUnit varchar(100) NOT NULL,
    Discontinued bit NOT NULL,
);


DROP TABLE IF EXISTS dimCustomer
CREATE TABLE dimCustomer
(
    CustomerKey varchar(50) PRIMARY KEY,
    [CompanyName] varchar(50),
    [OriginalId] varchar(50),
    [ContactName] varchar(50)

);

DROP TABLE IF EXISTS dimEmployee
CREATE TABLE dimEmployee
(
    EmployeeKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    LastName varchar(100) NOT NULL,
    FirstName varchar(100) NOT NULL,
);

DROP TABLE IF EXISTS dimCategory
CREATE TABLE dimCategory
(
    CategoryKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    NameEnglish varchar(100) NOT NULL,
    NameFrench varchar(100) NOT NULL,
);

DROP TABLE IF EXISTS dimLocation
CREATE TABLE dimLocation
(
    LocationKey varchar(100) PRIMARY KEY,
    City varchar(100) NOT NULL,
    Country varchar(100) NOT NULL,
    Region varchar(100) NOT NULL,
    PostalCode varchar(100) NOT NULL,
);

DROP TABLE IF EXISTS factSales
CREATE TABLE factSales
(
    SalesKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    CustomerKey varchar(50) NOT NULL
    CONSTRAINT FK_CustomerKey REFERENCES dimCustomer(CustomerKey),
    CustomerLocationKey varchar(100) NOT NULL
    CONSTRAINT FK_CustomerLocationKey REFERENCES dimLocation(LocationKey),
    SellerKey int NOT NULL
    CONSTRAINT FK_SellerKey REFERENCES dimEmployee(EmployeeKey),
    OrderDateKey int NOT NULL
    CONSTRAINT FK_OrderDateKey REFERENCES dimDate(DateKey),
    ShipDateKey int NOT NULL
    CONSTRAINT FK_ShipDateKey REFERENCES dimDate(DateKey),
    ShipLocationKey varchar(100) NOT NULL
    CONSTRAINT FK_ShipLocationKey REFERENCES dimLocation(LocationKey),
    ShipperName varchar(100) NOT NULL,
    ShipperOriginalId int NOT NULL
    CONSTRAINT FK_ShipperOriginalId REFERENCES dimEmployee(EmployeeKey),
    ProductKey int NOT NULL
    CONSTRAINT FK_ProductKey REFERENCES dimProduct(ProductKey),
    CategoryKey int NOT NULL
    CONSTRAINT FK_CategoryKey REFERENCES dimCategory(CategoryKey),
    Quantity int NOT NULL,
    Discount float NOT NULL,
    isOnline bit NOT NULL,
);

