CREATE DATABASE Foodies977Dw;

CREATE TABLE dimDate
(
    DateKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    Year int NOT NULL,
    MonthEnglishName varchar(10) NOT NULL,
    MonthFrenchName varchar(10) NOT NULL,
    DayEnglishName varchar(10) NOT NULL,
    DayFrenchName varchar(10) NOT NULL,
);

CREATE TABLE dimProduct
(
    ProductKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    NameEnglish varchar(100) NOT NULL,
    NameFrench varchar(100) NOT NULL,
    QuantityPerUnit int NOT NULL,
    Discontinued bit NOT NULL,
);

CREATE TABLE dimCustomer
(
    CustomerKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    CompanyName varchar(100) NOT NULL,
    ContactName varchar(100) NOT NULL,
);

CREATE TABLE dimEmployee
(
    EmployeeKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    LastName varchar(100) NOT NULL,
    FirstName varchar(100) NOT NULL,
    Title varchar(100) NOT NULL,
);

CREATE TABLE dimCategory
(
    CategoryKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    NameEnglish varchar(100) NOT NULL,
    NameFrench varchar(100) NOT NULL,
);

CREATE TABLE dimLocation
(
    LocationKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    CityEnglish varchar(100) NOT NULL,
    CityFrench varchar(100) NOT NULL,
    CountryEnglish varchar(100) NOT NULL,
    CountryFrench varchar(100) NOT NULL,
    RegionEnglish varchar(100) NOT NULL,
    RegionFrench varchar(100) NOT NULL,
    PostalCode varchar(100) NOT NULL,
);

CREATE TABLE c
(
    SalesKey int IDENTITY(1,1) PRIMARY KEY,
    OriginalId int NOT NULL,
    CustomerKey int NOT NULL
    CONSTRAINT FK_CustomerKey REFERENCES dimCustomer(CustomerKey),
    CustomerLocationKey int NOT NULL
    CONSTRAINT FK_CustomerLocationKey REFERENCES dimLocation(LocationKey),
    SellerKey int NOT NULL
    CONSTRAINT FK_SellerKey REFERENCES dimEmployee(EmployeeKey),
    OrderDateKey int NOT NULL
    CONSTRAINT FK_OrderDateKey REFERENCES dimDate(DateKey),
    ShipDateKey int NOT NULL
    CONSTRAINT FK_ShipDateKey REFERENCES dimDate(DateKey),
    ShipLocationKey int NOT NULL
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


select * from factSales