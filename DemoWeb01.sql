CREATE DATABASE DemoWeb01
USE DemoWeb01

CREATE TABLE AdminUser(
	UserName Char(24) Primary key,
	UserPass Varchar(250),
)
CREATE TABLE Users(
	UserName Char(24) Primary key,
	UserPass Varchar(250),
	FirstName Nvarchar(20),
	LastName Nvarchar(20),
	Birthday DATE,
	Phone Char(10),
	Address NVARCHAR(100),
	Email Varchar(50),
	Gender Smallint,
)
CREATE TABLE LoaiSanPham(
	IdCate INT IDENTITY(1,1) PRIMARY KEY,
	NameCate Nvarchar(25)
)
CREATE TABLE SanPham(
	IdPro INT IDENTITY(1,1) PRIMARY KEY,
	NamePro Nvarchar(200),
	Quantity INT,
	Price Decimal(10,8),
	Descriptions Nvarchar(250),
	ImagePath Nvarchar(Max),
	IdCate INT,
	Constraint IdCate_SanPham_LoaiSanPham foreign key (IdCate) references LoaiSanPham (IdCate)
)
CREATE TABLE HoaDon(
	IdInvoice INT IDENTITY(1,1) PRIMARY KEY,
	UserName Char(24),
	DateOrder DATETIME,
	CONSTRAINT UserName_HoaDon_UserName FOREIGN KEY (UserName) REFERENCES Users (UserName)
)
CREATE TABLE CTHoaDon(
	IdInvoice INT,
	IdPro INT,
	ItemQuantity INT,
	CONSTRAINT PK_CTHoaDon PRIMARY KEY (IdInvoice, IdPro),
	CONSTRAINT UserName_CTHoaDon_SanPham FOREIGN KEY (IdPro) REFERENCES SanPham (IdPro),
	CONSTRAINT UserName_CTHoaDon_HoaDon FOREIGN KEY (IdInvoice) REFERENCES HoaDon (IdInvoice)
)
