----------------------------------------------------------------------
-----------------TABELE-----------------------------------------------
----------------------------------------------------------------------

CREATE TABLE dbo.Addresses(
	IdAddress int IDENTITY(1,1) NOT NULL,
	Country nvarchar(10) NOT NULL,
	City nvarchar(10) NOT NULL,
	Zip_code nchar(6) NOT NULL,
	Street_Name nvarchar(30) NOT NULL,
	Street_Number int NOT NULL,
	State nvarchar(20) NOT NULL,
 CONSTRAINT PK_Adress PRIMARY KEY CLUSTERED (IdAddress)
)

GO

---

CREATE TABLE dbo.Categories(
	IdCategory int IDENTITY(1,1) NOT NULL,
	Name_Category nvarchar(50) NOT NULL,
	Description_Category nvarchar(50) NULL,
	IdParent_Category int NULL,
 CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (IdCategory)
)

GO

---

CREATE TABLE dbo.Contacts(
	IdContact int IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Phone_Number nchar(9) NOT NULL,
 CONSTRAINT PK_Contact PRIMARY KEY CLUSTERED (IdContact),
	UNIQUE NONCLUSTERED (Email, Phone_Number)
)

GO

---

CREATE TABLE dbo.Customer_Addresses(
	IdCustomer int NOT NULL,
	IdAddress int NOT NULL
)

GO

---

CREATE TABLE dbo.Customers(
	IdCustomer int IDENTITY(1,1) NOT NULL,
	IdContact int NOT NULL,
	IdMainAddress int NOT NULL,
	IdLogin_information int NOT NULL,
 CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (IdCustomer)
)

GO

---

CREATE TABLE dbo.Employees(
	IdEmployee int IDENTITY(1,1) NOT NULL,
	IdContact int NOT NULL,
	IdAddress int NOT NULL,
	IdLogin_information int NOT NULL,
	IdGroup int NOT NULL,
 CONSTRAINT PK_Sellers PRIMARY KEY CLUSTERED (IdEmployee)
)

GO

---

CREATE TABLE dbo.Groups(
	IdGroup int IDENTITY(1,1) NOT NULL,
	Name nchar(20) NOT NULL,
	Role nchar(20) NOT NULL,
 CONSTRAINT PK_Group PRIMARY KEY CLUSTERED (IdGroup)
)

GO

---

CREATE TABLE dbo.Login_informations(
	IdLogin_information int IDENTITY(1,1) NOT NULL,
	Login nvarchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL,
 CONSTRAINT PK_Login_information PRIMARY KEY CLUSTERED (IdLogin_information)
)

GO

---

CREATE TABLE dbo.Order_Details(
	IdOrder int NOT NULL,
	IdProduct int NOT NULL,
	Quantity_Ordered int NOT NULL
)

GO

---

CREATE TABLE dbo.Orders(
	IdOrder int IDENTITY(1,1) NOT NULL,
	IdCustomer int NOT NULL,
	IdEmployee int NULL,
	IdStatus_Order int NULL,
	IdPayment_Method int NOT NULL,
	IdShippment_Method int NOT NULL,
	Description_Order nvarchar(100) NULL,
	Date_Order datetime NOT NULL,
	Date_Shippment datetime NULL,
	Orders_Discount_Percent int NOT NULL,
	Amount_Order money NULL,
 CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (IdOrder)
)

GO

---

CREATE TABLE dbo.Payment_Methods(
	IdPayment_Method int IDENTITY(1,1) NOT NULL,
	Name_Payment_Method nvarchar(50) NOT NULL,
	Description_Payment_Method nvarchar(50) NOT NULL,
 CONSTRAINT PK_Payment_Method PRIMARY KEY CLUSTERED (IdPayment_Method)
)

GO

---

CREATE TABLE dbo.Producers(
	IdProducer int IDENTITY(1,1) NOT NULL,
	Name_Producer nvarchar(20) NOT NULL,
	IdAddress int NOT NULL,
	IdContact int NOT NULL,
 CONSTRAINT PK_Producer PRIMARY KEY CLUSTERED (IdProducer)
)

GO

---

CREATE TABLE dbo.Products(
	IdProduct int IDENTITY(1,1) NOT NULL,
	IdCategory int NOT NULL,
	IdProducer int NOT NULL,
	Name_Product nvarchar(50) NOT NULL,
	Quantity_Possessed int NOT NULL,
	Gross_Price money NOT NULL,
	IdSupplier int NOT NULL,
	Description_Product nvarchar(100) NULL,
	Net_Price money NOT NULL,
	IdTax_Level int NOT NULL,
 CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (IdProduct)
)

GO

---

CREATE TABLE dbo.Reclamations(
	IdReclamation int IDENTITY(1,1) NOT NULL,
	IdOrder int NOT NULL,
	IdStatus_Reclamation int NULL,
	IdProduct int NOT NULL,
	Date_reclamation datetime NOT NULL,
	Description_Reclamation nvarchar(100) NOT NULL,
 CONSTRAINT PK_Reclamations PRIMARY KEY CLUSTERED (IdReclamation)
)

GO

---

CREATE TABLE dbo.Return_Details(
	IdReturn int NOT NULL,
	IdProduct int NOT NULL
)

GO

---

CREATE TABLE dbo.Returns(
	IdReturn int IDENTITY(1,1) NOT NULL,
	IdOrder int NOT NULL,
	Date_Return datetime NOT NULL,
 CONSTRAINT PK_Returns PRIMARY KEY CLUSTERED (IdReturn)
)

GO

---

CREATE TABLE dbo.Shippment_Methods(
	IdShippment_Method int IDENTITY(1,1) NOT NULL,
	Name_Shippment_Method nvarchar(50) NOT NULL,
	Description_Shippment_Method nvarchar(100) NOT NULL,
	Price_Shippment_Method money NOT NULL,
 CONSTRAINT PK_Shippment_Method PRIMARY KEY CLUSTERED (IdShippment_Method)
)

GO

---

CREATE TABLE dbo.Status_Orders(
	IdStatus_Order int IDENTITY(1,1) NOT NULL,
	Name_Status_Order nvarchar(20) NOT NULL,
 CONSTRAINT PK_Status PRIMARY KEY CLUSTERED (IdStatus_Order)
)

GO

---

CREATE TABLE dbo.Status_Reclamation(
	IdStatus_Reclamation int IDENTITY(1,1) NOT NULL,
	Name_Status_Reclamation nvarchar(20) NOT NULL,
 CONSTRAINT PK_Status_Reclamation PRIMARY KEY CLUSTERED (IdStatus_Reclamation)
)

GO

---

CREATE TABLE dbo.Suppliers(
	IdSupplier int IDENTITY(1,1) NOT NULL,
	Name_Supplier nvarchar(50) NOT NULL,
	IdAddress int NOT NULL,
	IdContact int NOT NULL,
 CONSTRAINT PK_Supplier PRIMARY KEY CLUSTERED (IdSupplier)
)

GO

---

CREATE TABLE dbo.Supply(
	IdSupply int IDENTITY(1,1) NOT NULL,
	Data_Supply date NOT NULL,
	Price_Supply money NOT NULL,
	IdSupplier int NOT NULL,
 CONSTRAINT PK_Supply PRIMARY KEY CLUSTERED (IdSupply)
)

GO

---

CREATE TABLE dbo.Supply_Details(
	IdSupply int NOT NULL,
	IdProduct int NOT NULL,
	Price_Item money NOT NULL,
	Quantity_Supplied int NOT NULL
)

GO

---

CREATE TABLE dbo.Taxes_Level(
	IdTax_Level int IDENTITY(1,1) NOT NULL,
	Name_Tax nvarchar(50) NOT NULL,
	Tax_Percent int NOT NULL,
 CONSTRAINT PK_Taxes_Level PRIMARY KEY CLUSTERED (IdTax_Level)
)

GO

--------------------------------------------------------------
--------- INDEXY ---------------------------------------------
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FirstName ON dbo.Contacts(FirstName)
GO

CREATE NONCLUSTERED INDEX IX_LastName ON dbo.Contacts(LastName)
GO

CREATE NONCLUSTERED INDEX IX_NameProducer ON dbo.Producers(Name_Producer)
GO

CREATE NONCLUSTERED INDEX IX_NameProduct ON dbo.Products(Name_Product)
GO

CREATE NONCLUSTERED INDEX IX_Reclamations ON dbo.Reclamations(Date_reclamation)
GO

CREATE NONCLUSTERED INDEX IX_NameSuppliers ON dbo.Suppliers(Name_Supplier)
GO

--------------------------------------------------------------------------
---------- DEFAULTY ------------------------------------------------------
--------------------------------------------------------------------------

ALTER TABLE dbo.Addresses ADD  CONSTRAINT DF_Addresses_Country  DEFAULT ('Polska') FOR Country
GO

ALTER TABLE dbo.Orders ADD  CONSTRAINT DF_Orders_Data_Order  DEFAULT (getdate()) FOR Date_Order
GO

ALTER TABLE dbo.Orders ADD  CONSTRAINT DF_Orders_Orders_Discount_Percent  DEFAULT ((0)) FOR Orders_Discount_Percent
GO

ALTER TABLE dbo.Reclamations ADD  CONSTRAINT DF_Reclamations_Date_reclamation  DEFAULT (getdate()) FOR Date_reclamation
GO

ALTER TABLE dbo.Returns ADD  CONSTRAINT DF_Returns_Date_Return  DEFAULT (getdate()) FOR Date_Return
GO

ALTER TABLE dbo.Supply ADD  CONSTRAINT DF_Supply_Data_Supply  DEFAULT (getdate()) FOR Data_Supply
GO

---------------------------------------------------------------------------------------------------
-----------------FOREGIN KEYS----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Categories  WITH CHECK ADD  CONSTRAINT FK_Categories_Categories FOREIGN KEY(IdParent_Category)
REFERENCES dbo.Categories (IdCategory)
GO

ALTER TABLE dbo.Categories CHECK CONSTRAINT FK_Categories_Categories
GO

ALTER TABLE dbo.Customer_Addresses  WITH CHECK ADD  CONSTRAINT FK_Customer_Adress_Adress FOREIGN KEY(IdAddress)
REFERENCES dbo.Addresses (IdAddress)
GO

ALTER TABLE dbo.Customer_Addresses CHECK CONSTRAINT FK_Customer_Adress_Adress
GO

ALTER TABLE dbo.Customer_Addresses  WITH CHECK ADD  CONSTRAINT FK_Customer_Adress_Customer FOREIGN KEY(IdCustomer)
REFERENCES dbo.Customers (IdCustomer)
GO

ALTER TABLE dbo.Customer_Addresses CHECK CONSTRAINT FK_Customer_Adress_Customer
GO

ALTER TABLE dbo.Customers  WITH CHECK ADD  CONSTRAINT FK_Customer_Contact FOREIGN KEY(IdContact)
REFERENCES dbo.Contacts (IdContact)
GO

ALTER TABLE dbo.Customers CHECK CONSTRAINT FK_Customer_Contact
GO

ALTER TABLE dbo.Customers  WITH CHECK ADD  CONSTRAINT FK_Customer_Login_information FOREIGN KEY(IdLogin_information)
REFERENCES dbo.Login_informations (IdLogin_information)
GO

ALTER TABLE dbo.Customers CHECK CONSTRAINT FK_Customer_Login_information
GO

ALTER TABLE dbo.Customers  WITH CHECK ADD  CONSTRAINT FK_Customers_Addresses FOREIGN KEY(IdMainAddress)
REFERENCES dbo.Addresses (IdAddress)
GO

ALTER TABLE dbo.Customers CHECK CONSTRAINT FK_Customers_Addresses
GO

ALTER TABLE dbo.Employees  WITH CHECK ADD  CONSTRAINT FK_Empolyess_Group FOREIGN KEY(IdGroup)
REFERENCES dbo.Groups (IdGroup)
GO

ALTER TABLE dbo.Employees CHECK CONSTRAINT FK_Empolyess_Group
GO

ALTER TABLE dbo.Employees  WITH CHECK ADD  CONSTRAINT FK_Sellers_Adress FOREIGN KEY(IdAddress)
REFERENCES dbo.Addresses (IdAddress)
GO

ALTER TABLE dbo.Employees CHECK CONSTRAINT FK_Sellers_Adress
GO

ALTER TABLE dbo.Employees  WITH CHECK ADD  CONSTRAINT FK_Sellers_Contact FOREIGN KEY(IdContact)
REFERENCES dbo.Contacts (IdContact)
GO

ALTER TABLE dbo.Employees CHECK CONSTRAINT FK_Sellers_Contact
GO

ALTER TABLE dbo.Employees  WITH CHECK ADD  CONSTRAINT FK_Sellers_Login_information FOREIGN KEY(IdLogin_information)
REFERENCES dbo.Login_informations (IdLogin_information)
GO

ALTER TABLE dbo.Employees CHECK CONSTRAINT FK_Sellers_Login_information
GO

ALTER TABLE dbo.Order_Details  WITH CHECK ADD  CONSTRAINT FK_Orders_Items_Orders FOREIGN KEY(IdOrder)
REFERENCES dbo.Orders (IdOrder)
GO

ALTER TABLE dbo.Order_Details CHECK CONSTRAINT FK_Orders_Items_Orders
GO

ALTER TABLE dbo.Order_Details  WITH CHECK ADD  CONSTRAINT FK_Orders_Items_Product FOREIGN KEY(IdProduct)
REFERENCES dbo.Products (IdProduct)
GO

ALTER TABLE dbo.Order_Details CHECK CONSTRAINT FK_Orders_Items_Product
GO

ALTER TABLE dbo.Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Customer FOREIGN KEY(IdCustomer)
REFERENCES dbo.Customers (IdCustomer)
GO

ALTER TABLE dbo.Orders CHECK CONSTRAINT FK_Orders_Customer
GO

ALTER TABLE dbo.Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Payment_Method FOREIGN KEY(IdPayment_Method)
REFERENCES dbo.Payment_Methods (IdPayment_Method)
GO

ALTER TABLE dbo.Orders CHECK CONSTRAINT FK_Orders_Payment_Method
GO

ALTER TABLE dbo.Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Sellers FOREIGN KEY(IdEmployee)
REFERENCES dbo.Employees (IdEmployee)
GO

ALTER TABLE dbo.Orders CHECK CONSTRAINT FK_Orders_Sellers
GO

ALTER TABLE dbo.Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Shippment_Method FOREIGN KEY(IdShippment_Method)
REFERENCES dbo.Shippment_Methods (IdShippment_Method)
GO

ALTER TABLE dbo.Orders CHECK CONSTRAINT FK_Orders_Shippment_Method
GO

ALTER TABLE dbo.Orders  WITH CHECK ADD  CONSTRAINT FK_Orders_Status FOREIGN KEY(IdStatus_Order)
REFERENCES dbo.Status_Orders (IdStatus_Order)
GO

ALTER TABLE dbo.Orders CHECK CONSTRAINT FK_Orders_Status
GO

ALTER TABLE dbo.Producers  WITH CHECK ADD  CONSTRAINT FK_Producer_Adress FOREIGN KEY(IdAddress)
REFERENCES dbo.Addresses (IdAddress)
GO

ALTER TABLE dbo.Producers CHECK CONSTRAINT FK_Producer_Adress
GO

ALTER TABLE dbo.Producers  WITH CHECK ADD  CONSTRAINT FK_Producer_Contact FOREIGN KEY(IdContact)
REFERENCES dbo.Contacts (IdContact)
GO

ALTER TABLE dbo.Producers CHECK CONSTRAINT FK_Producer_Contact
GO

ALTER TABLE dbo.Products  WITH CHECK ADD  CONSTRAINT FK_Product_Categories FOREIGN KEY(IdCategory)
REFERENCES dbo.Categories (IdCategory)
GO

ALTER TABLE dbo.Products CHECK CONSTRAINT FK_Product_Categories
GO

ALTER TABLE dbo.Products  WITH CHECK ADD  CONSTRAINT FK_Product_Producer FOREIGN KEY(IdProducer)
REFERENCES dbo.Producers (IdProducer)
GO

ALTER TABLE dbo.Products CHECK CONSTRAINT FK_Product_Producer
GO

ALTER TABLE dbo.Products  WITH CHECK ADD  CONSTRAINT FK_Product_Supplier FOREIGN KEY(IdSupplier)
REFERENCES dbo.Suppliers (IdSupplier)
GO

ALTER TABLE dbo.Products CHECK CONSTRAINT FK_Product_Supplier
GO

ALTER TABLE dbo.Products  WITH CHECK ADD  CONSTRAINT FK_Products_Taxes_Level FOREIGN KEY(IdTax_Level)
REFERENCES dbo.Taxes_Level (IdTax_Level)
GO

ALTER TABLE dbo.Products CHECK CONSTRAINT FK_Products_Taxes_Level
GO

ALTER TABLE dbo.Reclamations  WITH CHECK ADD  CONSTRAINT FK_Reclamations_Orders1 FOREIGN KEY(IdOrder)
REFERENCES dbo.Orders (IdOrder)
GO

ALTER TABLE dbo.Reclamations CHECK CONSTRAINT FK_Reclamations_Orders1
GO

ALTER TABLE dbo.Reclamations  WITH CHECK ADD  CONSTRAINT FK_Reclamations_Products FOREIGN KEY(IdProduct)
REFERENCES dbo.Products (IdProduct)
GO

ALTER TABLE dbo.Reclamations CHECK CONSTRAINT FK_Reclamations_Products
GO

ALTER TABLE dbo.Reclamations  WITH CHECK ADD  CONSTRAINT FK_Reclamations_Status_Reclamation FOREIGN KEY(IdStatus_Reclamation)
REFERENCES dbo.Status_Reclamation (IdStatus_Reclamation)
GO

ALTER TABLE dbo.Reclamations CHECK CONSTRAINT FK_Reclamations_Status_Reclamation
GO

ALTER TABLE dbo.Return_Details  WITH CHECK ADD  CONSTRAINT FK_Return_Detail_Products FOREIGN KEY(IdProduct)
REFERENCES dbo.Products (IdProduct)
GO

ALTER TABLE dbo.Return_Details CHECK CONSTRAINT FK_Return_Detail_Products
GO

ALTER TABLE dbo.Return_Details  WITH CHECK ADD  CONSTRAINT FK_Return_Detail_Returns FOREIGN KEY(IdReturn)
REFERENCES dbo.Returns (IdReturn)
GO

ALTER TABLE dbo.Return_Details CHECK CONSTRAINT FK_Return_Detail_Returns
GO

ALTER TABLE dbo.Returns  WITH CHECK ADD  CONSTRAINT FK_Returns_Orders FOREIGN KEY(IdOrder)
REFERENCES dbo.Orders (IdOrder)
GO

ALTER TABLE dbo.Returns CHECK CONSTRAINT FK_Returns_Orders
GO

ALTER TABLE dbo.Suppliers  WITH CHECK ADD  CONSTRAINT FK_Supplier_Adress FOREIGN KEY(IdAddress)
REFERENCES dbo.Addresses (IdAddress)
GO

ALTER TABLE dbo.Suppliers CHECK CONSTRAINT FK_Supplier_Adress
GO

ALTER TABLE dbo.Suppliers  WITH CHECK ADD  CONSTRAINT FK_Supplier_Contact FOREIGN KEY(IdContact)
REFERENCES dbo.Contacts (IdContact)
GO

ALTER TABLE dbo.Suppliers CHECK CONSTRAINT FK_Supplier_Contact
GO

ALTER TABLE dbo.Supply  WITH CHECK ADD  CONSTRAINT FK_Supply_Supplier FOREIGN KEY(IdSupplier)
REFERENCES dbo.Suppliers (IdSupplier)
GO

ALTER TABLE dbo.Supply CHECK CONSTRAINT FK_Supply_Supplier
GO

ALTER TABLE dbo.Supply_Details  WITH CHECK ADD  CONSTRAINT FK_Supply_Detail_Product FOREIGN KEY(IdProduct)
REFERENCES dbo.Products (IdProduct)
GO

ALTER TABLE dbo.Supply_Details CHECK CONSTRAINT FK_Supply_Detail_Product
GO

ALTER TABLE dbo.Supply_Details  WITH CHECK ADD  CONSTRAINT FK_Supply_Detail_Supply FOREIGN KEY(IdSupply)
REFERENCES dbo.Supply (IdSupply)
GO

-------------------------------------------------------------------------------------------------------
----------------------CHECKS---------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Supply_Details CHECK CONSTRAINT FK_Supply_Detail_Supply
GO

ALTER TABLE dbo.Addresses  WITH CHECK ADD  CONSTRAINT CK_Adress_Street_number CHECK  ((Street_Number>(0)))
GO

ALTER TABLE dbo.Addresses CHECK CONSTRAINT CK_Adress_Street_number
GO

ALTER TABLE dbo.Addresses  WITH CHECK ADD  CONSTRAINT CK_Adress_Zip_Code CHECK  ((Zip_Code like '[0-9][0-9]-[0-9][0-9][0-9]'))
GO

ALTER TABLE dbo.Addresses CHECK CONSTRAINT CK_Adress_Zip_Code
GO

ALTER TABLE dbo.Contacts  WITH CHECK ADD  CONSTRAINT CK_Contact_Email CHECK  ((Email like '%_@_%_.__%'))
GO

ALTER TABLE dbo.Contacts CHECK CONSTRAINT CK_Contact_Email
GO

ALTER TABLE dbo.Contacts  WITH CHECK ADD  CONSTRAINT CK_Contact_Phone_Number CHECK  ((Phone_Number like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE dbo.Contacts CHECK CONSTRAINT CK_Contact_Phone_Number
GO

