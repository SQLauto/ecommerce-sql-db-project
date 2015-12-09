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


---------------------------------------------------------------------------
------ PROCEDURY DODAJ¥CE DANE DO BAZY ------------------------------------
---------------------------------------------------------------------------

CREATE PROCEDURE dbo.AddCustomersAddress
@IdCustomer int,
@Country varchar(10),
@City varchar(10),
@Zip_code nchar(6),
@Street_Name varchar(30),
@Street_Number int,
@State varchar(20)

AS BEGIN

	DECLARE @IdAddress int;
	DECLARE @InsertedID table (IdAddress int);

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT dbo.Addresses
			(Country, State, City, Zip_code, Street_Name, Street_Number)
			OUTPUT INSERTED.IdAddress into @InsertedID(IdAddress)
			VALUES 
			(@Country, @State, @City, @Zip_code, @Street_Name, @Street_Number);

			SELECT @IdAddress = IdAddress FROM @InsertedID;

			INSERT dbo.Customer_Addresses
			(IdCustomer, IdAddress)
			VALUES
			(@IdCustomer, @IdAddress);

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END

GO

-----

CREATE PROCEDURE dbo.DeleteCategory
@IdCategory int

AS BEGIN
	DELETE FROM dbo.Categories WHERE IdParent_Category = @IdCategory
	DELETE FROM dbo.Categories WHERE IdCategory = @IdCategory;
END

GO

-----

CREATE PROCEDURE dbo.DeleteCustomer
@IdCustomer int

AS BEGIN

	DECLARE @TempTable table (IdCustomer int ,IdAddress int);

	INSERT INTO @TempTable(IdCustomer, IdAddress) SELECT IdCustomer, IdAddress FROM Customer_Addresses WHERE IdCustomer = @IdCustomer;

	DECLARE @IdLogin_information int, @IdContact int, @IdMainAddress int;

	SELECT @IdLogin_information = IdLogin_information, @IdContact = IdContact, @IdMainAddress = IdMainAddress FROM Customers WHERE IdCustomer = @IdCustomer;

	DELETE FROM Customer_Addresses WHERE IdCustomer = @IdCustomer;

	DELETE FROM Customers WHERE IdCustomer = @IdCustomer;

	DELETE FROM Addresses WHERE IdAddress IN
		(SELECT IdAddress FROM @TempTable) OR IdAddress = @IdMainAddress;

	DELETE FROM Login_informations WHERE IdLogin_information = @IdLogin_information;

	DELETE FROM Contacts WHERE IdContact = @IdContact;

END

GO

-----

CREATE PROCEDURE dbo.DeleteCustomersAddress
@IdAddress int

AS BEGIN
	DELETE FROM Customer_Addresses WHERE IdAddress = @IdAddress;
	DELETE FROM Addresses WHERE IdAddress = @IdAddress;
END

GO

----

CREATE PROCEDURE dbo.DeleteEmployee
@IdEmployee int

AS BEGIN

	DECLARE @IdLogin_information int, @IdContact int, @IdAddress int;

	SELECT @IdLogin_information = IdLogin_information, @IdContact = IdContact, @IdAddress = IdAddress FROM Employees WHERE IdEmployee = @IdEmployee;

	DELETE FROM Employees WHERE IdEmployee = @IdEmployee;

	DELETE FROM Addresses WHERE IdAddress = @IdAddress;

	DELETE FROM Login_informations WHERE IdLogin_information = @IdLogin_information;

	DELETE FROM Contacts WHERE IdContact = @IdContact;

END

GO

-----

CREATE PROCEDURE dbo.DeleteGroup
@IdGroup int

AS BEGIN
	DELETE FROM Groups WHERE IdGroup = @IdGroup;
END

GO

-----

CREATE PROCEDURE dbo.DeleteOrder
@IdOrder int

AS BEGIN
	DELETE FROM Order_Details WHERE IdOrder = @IdOrder;
	DELETE FROM Orders WHERE IdOrder = @IdOrder;
END

GO

-----

CREATE PROCEDURE dbo.DeletePaymentMethods
@IdPaymentMethod int

AS BEGIN
	DELETE FROM Payment_Methods WHERE IdPayment_Method = @IdPaymentMethod;
END

GO

-----

CREATE PROCEDURE dbo.DeleteProducer
@IdProducer int

AS BEGIN

	DECLARE @IdContact int, @IdAddress int;

	SELECT @IdContact = IdContact, @IdAddress = IdAddress FROM Producers WHERE IdProducer = @IdProducer;

	DELETE FROM Producers WHERE IdProducer = @IdProducer;

	DELETE FROM Addresses WHERE IdAddress = @IdAddress;

	DELETE FROM Contacts WHERE IdContact = @IdContact;

END

GO

-----

CREATE PROCEDURE dbo.DeleteProduct
@IdProduct int

AS BEGIN
	DELETE FROM Products WHERE IdProduct = @IdProduct;
END

GO

-----

CREATE PROCEDURE dbo.DeleteReclamation
@IdReclamation int

AS BEGIN
	DELETE FROM Reclamations WHERE IdReclamation = @IdReclamation;
END

GO

------

CREATE PROCEDURE dbo.DeleteReclamationStatus
@IdReclamationStatus int

AS BEGIN
	DELETE FROM Status_Reclamation WHERE IdStatus_Reclamation = @IdReclamationStatus;
END

GO

------

CREATE PROCEDURE dbo.DeleteReturn
@IdReturn int

AS BEGIN
	DELETE FROM Return_Details WHERE IdReturn = @IdReturn
	DELETE FROM Returns WHERE IdReturn = @IdReturn;
END

GO

------

CREATE PROCEDURE dbo.DeleteShippmentMethods
@IdShippmentMethod int

AS BEGIN
	DELETE FROM Shippment_Methods WHERE IdShippment_Method = @IdShippmentMethod;
END

GO

------

CREATE PROCEDURE dbo.DeleteSupplier
@IdSupplier int

AS BEGIN

	DECLARE @IdContact int, @IdAddress int;

	SELECT @IdContact = IdContact, @IdAddress = IdAddress FROM Suppliers WHERE IdSupplier = @IdSupplier;

	DELETE FROM Suppliers WHERE IdSupplier = @IdSupplier;

	DELETE FROM Addresses WHERE IdAddress = @IdAddress;

	DELETE FROM Contacts WHERE IdContact = @IdContact;

END

GO

-----

CREATE PROCEDURE dbo.DeleteSupply
@IdSupply int

AS BEGIN
	DELETE FROM dbo.Supply_Details WHERE IdSupply = @IdSupply;
	DELETE FROM dbo.Supply WHERE IdSupply = @IdSupply;
END

GO

------

CREATE PROCEDURE dbo.DeleteTax
@IdTax_Level int

AS BEGIN
	DELETE FROM Taxes_Level WHERE IdTax_Level = @IdTax_Level
END

GO

------

CREATE PROCEDURE dbo.InsertCategory 
@Name_Category nvarchar(50), 
@Description_Category nvarchar(50), 
@IdParent_Category int 

AS BEGIN
	INSERT dbo.Categories 
	(Name_Category, Description_Category, IdParent_Category) 
	VALUES 
	(@Name_Category, @Description_Category, @IdParent_Category) 
END 

GO

------

CREATE PROCEDURE dbo.InsertCustomer
@Login nvarchar(50),
@Password nvarchar(50),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Phone_Number nchar(9),
@Country nvarchar(10),
@City nvarchar(10),
@Zip_code nchar(6),
@Street_Name nvarchar(30),
@Street_Number int,
@State nvarchar(20)

AS BEGIN 

	DECLARE @InsertedID table (IdContact int, IdMainAddress int, IdLogin_informations int, IdCustomer int);

	DECLARE 
	@IdContact int, 
	@IdMainAddress int, 
	@IdLogin_informations int, 
	@IdCustomer int;

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT dbo.Contacts(FirstName, LastName, Email, Phone_Number)
			OUTPUT INSERTED.IdContact INTO @InsertedID(IdContact)
			VALUES
			(@FirstName, @LastName, @Email, @Phone_Number);

			SELECT @IdContact = IdContact from @InsertedID;

			INSERT dbo.Addresses
			(Country, State, City, Zip_code, Street_Name, Street_Number)
			OUTPUT INSERTED.IdAddress into @InsertedID(IdMainAddress)
			VALUES 
			(@Country, @State, @City, @Zip_code, @Street_Name, @Street_Number);

			SELECT @IdMainAddress = IdMainAddress from @InsertedID;

			INSERT dbo.Login_informations
			(Login, Password)
			OUTPUT INSERTED.IdLogin_information into @InsertedID(IdLogin_informations)
			VALUES
			(@Login, @Password);

			SELECT @IdLogin_informations = IdLogin_informations from @InsertedID;

			INSERT dbo.Customers
			(IdLogin_information, IdContact, IdMainAddress)
			OUTPUT INSERTED.IdCustomer into @InsertedID(IdCustomer)
			VALUES
			(@IdLogin_informations, @IdContact, @IdMainAddress);

			SELECT @IdCustomer = IdCustomer from @InsertedID;

			INSERT dbo.Customer_Addresses
			(IdCustomer, IdAddress)
			VALUES
			(@IdCustomer, @IdMainAddress);

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END

GO

------

CREATE PROCEDURE dbo.InsertEmployee
@Login nvarchar(50),
@Password nvarchar(50),
@IdGroup int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Phone_Number nchar(9),
@Country nvarchar(10),
@City nvarchar(10),
@Zip_code nchar(6),
@Street_Name nvarchar(30),
@Street_Number int,
@State nvarchar(20)
AS BEGIN 

	DECLARE @InsertedID table (IdContact int, IdAddress int, IdLogin_information int);

	DECLARE 
	@IdContact int, 
	@IdAddress int, 
	@IdLogin_information int;

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT dbo.Contacts(FirstName, LastName, Email, Phone_Number)
			OUTPUT INSERTED.IdContact INTO @InsertedID(IdContact)
			VALUES
			(@FirstName, @LastName, @Email, @Phone_Number);

			SELECT @IdContact = IdContact from @InsertedID;

			INSERT dbo.Addresses
			(Country, State, City, Zip_code, Street_Name, Street_Number)
			OUTPUT INSERTED.IdAddress into @InsertedID(IdAddress)
			VALUES 
			(@Country, @State, @City, @Zip_code, @Street_Name, @Street_Number);

			SELECT @IdAddress = IdAddress from @InsertedID;

			INSERT dbo.Login_informations
			(Login, Password)
			OUTPUT INSERTED.IdLogin_information into @InsertedID(IdLogin_information)
			VALUES
			(@Login, @Password);

			SELECT @IdLogin_information = IdLogin_information from @InsertedID;

			INSERT dbo.Employees
			(IdLogin_information, IdGroup, IdContact, IdAddress)
			VALUES
			(@IdLogin_information, @IdGroup, @IdContact, @IdAddress);

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END

GO

-----

CREATE PROCEDURE dbo.InsertGroup
@Name char(20),
@Role char(20)

AS BEGIN
	INSERT Groups(Name, Role) VALUES (@Name, @Role);
END

GO

-----

CREATE PROCEDURE dbo.InsertOrder
@IdCustomer int,
@IdPayment_Method int,
@IdShippment_Method int,
@Description varchar(100),
@DiscountPercent int

AS BEGIN

	INSERT Orders(IdCustomer, IdPayment_Method, IdShippment_Method, Description_Order, Orders_Discount_Percent)
	VALUES (@IdCustomer, @IdPayment_Method, @IdShippment_Method, @Description, @DiscountPercent);

END

GO

------

CREATE PROCEDURE dbo.InsertOrderStatus
@Name_Status_Order varchar(20)

AS BEGIN

	INSERT dbo.Status_Orders(Name_Status_Order) 
	VALUES(@Name_Status_Order);

END

GO

------

CREATE PROCEDURE dbo.InsertPaymentMethods
@Name varchar(50),
@Description varchar(50)

AS BEGIN

	INSERT Payment_Methods(Name_Payment_Method, Description_Payment_Method)
	VALUES (@Name, @Description);

END

GO

-----

CREATE PROCEDURE dbo.InsertProducer
@Name_Producer nvarchar(50),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Phone_Number nchar(9),
@Country nvarchar(10),
@City nvarchar(10),
@Zip_code nchar(6),
@Street_Name nvarchar(30),
@Street_Number int,
@State nvarchar(20)
AS BEGIN 
DECLARE @InsertedID table (IdContact int, IdAddress int, IdProducer int);
DECLARE 
@IdContact int, 
@IdAddress int, 
@IdProducer int;

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT dbo.Contacts
			(FirstName, LastName, Email, Phone_Number)
			OUTPUT INSERTED.IdContact INTO @InsertedID(IdContact)
			VALUES
			(@FirstName, @LastName, @Email, @Phone_Number)
			SELECT @IdContact = IdContact from @InsertedID;
			INSERT dbo.Addresses
			(Street_Number,  Street_Name, Zip_code, City, State,Country)
			OUTPUT INSERTED.IdAddress into @InsertedID(IdAddress)
			VALUES (@Street_Number, @Street_Name, @Zip_code, @City, @State, @Country)
			SELECT @IdAddress = IdAddress from @InsertedID;
			INSERT dbo.Producers
			(Name_Producer, IdContact, IdAddress)
			OUTPUT INSERTED.IdProducer into @InsertedID(IdProducer)
			values
			(@Name_Producer, @IdContact, @IdAddress)
			SELECT @IdProducer = IdProducer from @InsertedID;

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END 

GO

-----

CREATE PROCEDURE dbo.InsertProduct
@Name_Product nvarchar(50), 
@IdCategory int, 
@IdProducer int, 
@IdSupplier int, 
@Net_Price money,
@IdTax_Level int, 
@Description_Product nvarchar(100),
@Quantity_Possessed int,
@Gross_Price money

AS BEGIN

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT 
			dbo.Products 
			( Name_Product, IdCategory, IdProducer, IdSupplier, Net_Price, IdTax_Level, Quantity_Possessed, Gross_Price, Description_Product) 
			VALUES 
			(@Name_Product, @IdCategory, @IdProducer, @IdSupplier, @Net_Price, @IdTax_Level, @Quantity_Possessed, @Gross_Price, @Description_Product) 

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END

GO

------

CREATE PROCEDURE dbo.InsertProductIntoOrder
@IdOrder int,
@IdProduct int,
@Quantity int

AS BEGIN
	INSERT Order_Details(IdOrder, IdProduct, Quantity_Ordered)
	VALUES (@IdOrder, @IdProduct, @Quantity);
END

GO

------

CREATE PROCEDURE dbo.InsertReclamation
@IdOrder int,
@IdProduct int,
@Description varchar(100)

AS BEGIN

	INSERT Reclamations(IdOrder, IdProduct, Description_Reclamation)
	VALUES (@IdOrder, @IdProduct, @Description);

END

GO

------

CREATE PROCEDURE dbo.InsertReclamationStatus
@Name varchar(20)

AS BEGIN
	INSERT Status_Reclamation(Name_Status_Reclamation) VALUES(@Name);
END

GO

-----

CREATE PROCEDURE dbo.InsertReturn
@IdOrder int

AS BEGIN
	INSERT dbo.Returns(IdOrder) VALUES (@IdOrder);
END

GO

----

CREATE PROCEDURE dbo.InsertReturnDetails
@IdReturn int,
@IdProduct int

AS BEGIN
	INSERT dbo.Return_Details(IdReturn, IdProduct) VALUES (@IdReturn, @IdProduct);
END

GO

----

CREATE PROCEDURE dbo.InsertShippmentMethods
@Name varchar(50),
@Description varchar(100),
@Price money

AS BEGIN
	INSERT Shippment_Methods(Name_Shippment_Method, Description_Shippment_Method, Price_Shippment_Method)
	VALUES(@Name, @Description, @Price);
END

GO

----

CREATE PROCEDURE dbo.InsertSupply
@PriceSupply money,
@IdSupplier int

AS BEGIN
	INSERT dbo.Supply(Price_Supply, IdSupplier)
	VALUES (@PriceSupply,@IdSupplier);
END

GO

----

CREATE PROCEDURE dbo.InsertSupplyDetail
@IdSupply int,
@IdProduct int,
@Price_Item money,
@Quantity_Supplied int

AS BEGIN
	INSERT dbo.Supply_Details(IdSupply, IdProduct, Price_Item, Quantity_Supplied)
	VALUES (@IdSupply, @IdProduct, @Price_Item, @Quantity_Supplied );
END

GO

-----

CREATE PROCEDURE dbo.InsertTax 
@Name_Tax nvarchar(50),
@Tax_Percent int 

AS BEGIN 
	INSERT dbo.Taxes_Level 
	(Name_Tax, Tax_Percent) 
	VALUES (@Name_Tax, @Tax_Percent) 
END 

GO

-----

CREATE PROCEDURE dbo.RemoveProductFromOrder
@IdOrder int,
@IdProduct int

AS BEGIN
	DELETE FROM Order_Details WHERE IdOrder = @IdOrder AND IdProduct = @IdProduct;
END

GO

-----

CREATE PROCEDURE dbo.SetEmployeesGroup
@IdEmployee int,
@IdGroup int

AS BEGIN
	UPDATE Employees SET IdGroup = @IdGroup WHERE IdEmployee = @IdEmployee;
END

GO

-----

CREATE PROCEDURE dbo.SetMainCustomersAddress
@IdCustomer int, 
@IdAddress int

AS BEGIN
	UPDATE Customers SET IdMainAddress = @IdAddress
	WHERE IdCustomer = @IdCustomer;
END

GO

-----

CREATE PROCEDURE dbo.Supplier_Add
@Name_Supplier nvarchar(50),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Phone_Number nchar(9),
@Country nvarchar(10),
@City nvarchar(10),
@Zip_code nchar(6),
@Street_Name nvarchar(30),
@Street_Number int,
@State nvarchar(20)
AS BEGIN 
	DECLARE @InsertedID table (IdContact int, IdAddress int, IdSupplier int);
	DECLARE 
	@IdContact int, 
	@IdAddress int, 
	@IdSupplier int;

	BEGIN TRY
		BEGIN TRANSACTION

			INSERT dbo.Contacts
			(FirstName, LastName, Email, Phone_Number)
			OUTPUT INSERTED.IdContact INTO @InsertedID(IdContact)
			VALUES
			(@FirstName, @LastName, @Email, @Phone_Number)
			SELECT @IdContact = IdContact from @InsertedID;
			INSERT dbo.Addresses
			(Street_Number,  Street_Name, Zip_code, City, State,Country)
			OUTPUT INSERTED.IdAddress into @InsertedID(IdAddress)
			VALUES (@Street_Number, @Street_Name, @Zip_code, @City, @State, @Country)
			SELECT @IdAddress = IdAddress from @InsertedID;
			INSERT dbo.Suppliers
			(Name_Supplier, IdContact, IdAddress)
			OUTPUT INSERTED.IdSupplier into @InsertedID(IdSupplier)
			values
			(@Name_Supplier, @IdContact, @IdAddress)
			SELECT @IdSupplier = IdSupplier from @InsertedID;

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT 'TRANSAKCJA WYCOFANA!'
	END CATCH

END 

GO

-----

CREATE PROCEDURE dbo.UpdateAddress
@IdAddress int,
@Country varchar(10),
@City varchar(10),
@Zip_code nchar(6),
@Street_Name varchar(30),
@Street_Number int,
@State varchar(20)

AS BEGIN
	UPDATE Addresses
	SET Country = @Country, City = @City, Zip_code = @Zip_code, Street_Name = @Street_Name, Street_Number = @Street_Number, State = @State
	WHERE IdAddress = @IdAddress;
END

GO

----

CREATE PROCEDURE dbo.UpdateCategory
@Name_Category nvarchar(50), 
@Description_Category nvarchar(50), 
@IdParent_Category int,
@IdCategory int

AS BEGIN
	UPDATE dbo.Categories
	SET Name_Category = @Name_Category, Description_Category = @Description_Category, IdParent_Category = @IdParent_Category
	WHERE IdCategory = @IdCategory;
END

GO

----

CREATE PROCEDURE dbo.UpdateContact
@IdContact int, 
@FirstName varchar(50),
@LastName varchar(50),
@Email varchar(50),
@Phone_Number char(9)

AS BEGIN
	UPDATE Contacts
	SET FirstName = @FirstName, LastName = @LastName, Email = @Email, Phone_number = @Phone_Number
	WHERE IdContact = @IdContact;
END

GO

-----

CREATE PROCEDURE dbo.UpdateGroup
@IdGroup int,
@Name char(20),
@Role char(20)

AS BEGIN
	UPDATE Groups
	SET Name = @Name, Role = @Role
	WHERE IdGroup = @IdGroup;
END

GO

-----

CREATE PROCEDURE dbo.UpdateLoginInformations
@IdLogin_information int,
@Login varchar(50),
@Password varchar(50)

AS BEGIN
	UPDATE Login_informations
	SET Login = @Login, Password = @Password
	WHERE IdLogin_information = @IdLogin_information;
END

GO

----

CREATE PROCEDURE dbo.UpdateOrder
@IdOrder int,
@IdEmployee int, 
@IdStatusOrder int,
@IdPaymentMethod int,
@IdShippmentMethod int,
@Description varchar(100),
@DiscountPercent int

AS BEGIN
	UPDATE Orders 
	SET IdEmployee = @IdEmployee, IdStatus_Order = @IdStatusOrder, IdPayment_Method = @IdPaymentMethod, IdShippment_Method = @IdShippmentMethod,
		Description_Order = @Description, Orders_Discount_Percent = @DiscountPercent
	WHERE IdOrder = @IdOrder;
END

GO

-----

CREATE PROCEDURE dbo.UpdateOrderStatus
@IdOrderStatus int,
@Name_Status_Order varchar(20)

AS BEGIN
	UPDATE dbo.Status_Orders
	SET Name_Status_Order = @Name_Status_Order
	WHERE IdStatus_Order = @IdOrderStatus;
END

GO

-----

CREATE PROCEDURE dbo.UpdatePaymentMethods
@IdPaymentMethod int,
@Name varchar(20),
@Description varchar(50)

AS BEGIN
	UPDATE Payment_Methods
	SET Name_Payment_Method = @Name, Description_Payment_Method = @Description
	WHERE IdPayment_Method = @IdPaymentMethod;
END

GO

-----

CREATE PROCEDURE dbo.UpdateProducer
@Name_Producer nvarchar(50),
@IdProducer int

AS BEGIN
	UPDATE dbo.Producers
	SET Name_Producer = @Name_Producer
	WHERE IdProducer = @IdProducer;
END

GO

-----

CREATE PROCEDURE dbo.UpdateProduct
@Name_Product nvarchar(50), 
@IdCategory int, 
@IdProducer int, 
@IdSupplier int, 
@Net_Price money,
@IdTax_Level int, 
@Description_Product nvarchar(100),
@Quantity_Possessed int,
@Gross_Price money,
@IdProduct int

AS BEGIN
	UPDATE dbo.Products

	SET Name_Product = @Name_Product, IdCategory = @IdCategory, IdProducer = @IdProducer, IdSupplier = @IdSupplier, Net_Price = @Net_Price,
	IdTax_Level = @IdTax_Level, Description_Product = @Description_Product, Quantity_Possessed = @Quantity_Possessed, Gross_Price = @Gross_Price

	WHERE IdProduct = @IdProduct;
END

GO

-----

CREATE PROCEDURE dbo.UpdateReclamation
@IdReclamation int,
@IdStatus int,
@Description varchar(100)

AS BEGIN
	UPDATE Reclamations 
	SET IdStatus_Reclamation = @IdStatus, Description_Reclamation = @Description
	WHERE IdReclamation = @IdReclamation;
END

GO

-----

CREATE PROCEDURE dbo.UpdateReclamationStatus
@IdReclamationStatus int,
@Name varchar(20)

AS BEGIN
	UPDATE Status_Reclamation
	SET Name_Status_Reclamation = @Name
	WHERE IdStatus_Reclamation = @IdReclamationStatus;
END

GO

-----

CREATE PROCEDURE dbo.UpdateReturn
@IdOrder int,
@IdReturn int

AS BEGIN
	UPDATE dbo.Returns
	SET IdOrder = @IdOrder
	WHERE IdReturn = @IdReturn;
END

GO

-----

CREATE PROCEDURE dbo.UpdateShippmentMethods
@IdShippmentMethod int,
@Name varchar(20),
@Description varchar(50),
@Price money

AS BEGIN
	UPDATE Shippment_Methods
	SET Name_Shippment_Method = @Name, Description_Shippment_Method = @Description, Price_Shippment_Method = @Price
	WHERE IdShippment_Method = @IdShippmentMethod;
END

GO

----

CREATE PROCEDURE dbo.UpdateSupplier
@Name_Supplier nvarchar(50),
@IdSupplier int

AS BEGIN
	UPDATE dbo.Suppliers
	SET Name_Supplier = @Name_Supplier
	WHERE IdSupplier = @IdSupplier;
END

GO

----

CREATE PROCEDURE dbo.UpdateSupply
@PriceSupply money,
@IdSupplier int,
@IdSupply int

AS BEGIN
	UPDATE dbo.Supply
	SET Price_Supply = @PriceSupply, IdSupplier = @IdSupplier
	WHERE IdSupply = @IdSupply;
END

GO

----

CREATE PROCEDURE dbo.UpdateTax
@Name_Tax nvarchar(50),
@Tax_Percent int,
@IdTax_Level int

AS BEGIN
	UPDATE dbo.Taxes_Level
	SET Name_Tax = @Name_Tax, Tax_Percent = @Tax_Percent
	WHERE IdTax_Level = @IdTax_Level;
END

GO

----



-------------------------------------------------------------------------------------------------------------------------------------------------
----------------------- DODAWANIE DANYCH!!!
-------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------TABELA-CUSTOMERS-----------------------
-- Wstawianie przyk³adowych danych do tabeli Customers poleceniem:
----------------------------------------------------------------
-- EXEC InsertCustomer @Login nvarchar(50), @Password nvarchar(50), 
-- @FirstName nvarchar(50), @LastName nvarchar(50),
-- @Email nvarchar(50), @Phone_Number nchar(9), @Country nvarchar(10),
-- @City nvarchar(10), @Zip_code nchar(6), @Street_Name nvarchar(30),
-- @Street_Number int, @State nvarchar(20);
----------------------------------------------------------------

EXEC dbo.InsertCustomer 'Komar', '4234324', 'Krzysztof', 'Komarski', 'kk@wp.pl', '234564321', 'Poland', 'Wroc³aw',
						'21-312', 'Grabiszyñska', 21, 'Dolnoœl¹skie';
GO
EXEC dbo.InsertCustomer 'Aaani', '32fas3rf', 'Anna', 'Jab³oñska', 'anna-ja@onet.pl', '324456789', 'Poland', 'Kraków',
						'32-432', 'Wroc³awska', 34, 'Ma³opolskie';
GO
EXEC dbo.InsertCustomer 'Caddie', '32245', 'Rafa³', 'Cmyk', 'cmykkk@gmail.com', '345634567', 'Poland', 'Warszawa',
						'54-324', 'Powstañsców Œl¹skich', 1, 'Mazowieckie';
GO
EXEC dbo.InsertCustomer 'Koniu', 'fds23gf', 'Radek', 'Kawalec', 'radu@gmail.com', '837263987', 'Poland', 'Wroc³aw',
						'21-322', 'Prosta', 79, 'Dolnoœl¹skie';
GO
EXEC dbo.InsertCustomer 'Puchatek', 'fwef23512d', 'Bartosz', 'Dziêcio³', 'dzieciu@onet.pl', '948376253', 'Poland', 'Opole',
						'43-422', 'Krakowska', 213, 'Dolnoœl¹skie';
GO
EXEC dbo.InsertCustomer 'Ruda', 'fds23g', 'Gra¿yna', 'Niedziela', 'grazyna.niedziela@gmail.com', '998345736', 'Poland', 'Poznañ',
						'42-323', 'Krzywoustego', 101, 'Wielkopolskie';
GO
EXEC dbo.InsertCustomer 'Gumis', 'few3244', 'Pawe³', 'Guma', 'gumski@wp.pl', '984583748', 'Poland', 'Gdañsk',
						'56-322', 'Trakcyjna', 221, 'Pomorskie';
GO
EXEC dbo.InsertCustomer 'Heleka213', 'k32j42n', 'Helena', 'Grzyb', 'helagrzyb@poczta.fm', '938402938', 'Poland', 'Warszawa',
						'23-433', 'Os. Sobieskiego', 121, 'Mazowieckie';
GO
EXEC dbo.InsertCustomer 'Arreet123', 'fsd32fs', 'Arleta', 'Mróz', 'a.mroz134@wp.pl', '938493874', 'Poland', 'Sulistrowice',
						'25-324', 'Rzeczna', 2, 'Dolnoœl¹skie';
GO
EXEC dbo.InsertCustomer 'Igla21', 'fs23tg', 'Izabela', 'Prfoñska', 'prfiz@wp.pl', '876537892', 'Poland', 'Oborniki Wielkopolskie',
						'42-324', 'Rolna', 65, 'Wielkopolskie';
----------------------------------------------------------------
-- Dodawanie kolejnego adresu do istniej¹cego ju¿ klienta poleceniem:
-----------------------------------------------------------------
-- EXEC AddCustomersAddress @IdCustomer int, @Country varchar(10),
-- @City varchar(10), @Zip_code nchar(6), @Street_Name varchar(30),
-- @Street_Number int, @State varchar(20);
-----------------------------------------------------------------

EXEC AddCustomersAddress 1, 'Afganistan', 'Afg an', '00-001', 'Sunnnn Settt', 66, 'AFG';
GO
EXEC AddCustomersAddress 2, 'Wielka Brytania', 'Londyn', '21-001', 'Blue Street', 21, 'London';
GO
EXEC AddCustomersAddress 3, 'Polska', 'Szczecin', '32-320', 'Ró¿ana', 216, 'Pomorskie';
GO

----------------------------------------------------------------
-- Zmiana domyœlnego adresu klienta (MainAddress) poleceniem:
----------------------------------------------------------------
-- EXEC SetMainCustomersAddress @IdCustomer, @IdMainAddress;
-----------------------------------------------------------------

EXEC SetMainCustomersAddress 1, 11;
GO
EXEC SetMainCustomersAddress 2, 12;
GO
EXEC SetMainCustomersAddress 3, 13;
GO

-------------TABELA-GROUPS---------------------------------------
-- Wstawianie danych do tabeli Groups poleceniem:
-----------------------------------------------------------------
-- EXEC InsertGroup @Name char(20), @Role char(20);
-----------------------------------------------------------------

EXEC InsertGroup 'Administrator', 'Admin';
GO
EXEC InsertGroup 'Sprzedawca pocz¹tkuj¹cy', 'SellerL1';
GO
EXEC InsertGroup 'Sprzedawca zaawansowany', 'SellerL2';
GO
EXEC InsertGroup 'Sprzedawca senior', 'SellerL3';
GO
EXEC InsertGroup 'Menad¿er', 'Manager';
GO

-------------TABELA-EMPLOYEES-------------------------------------
-- Wstawianie przyk³adowych danych do tabeli Employees poleceniem:
------------------------------------------------------------------
-- EXEC @Login nvarchar(50), @Password nvarchar(50), @IdGroup int,
-- @FirstName nvarchar(50), @LastName nvarchar(50), @Email nvarchar(50),
-- @Phone_Number nchar(9), @Country nvarchar(10), @City nvarchar(10),
-- @Zip_code nchar(6), @Street_Name nvarchar(30),@Street_Number int,
-- @State nvarchar(20);
-------------------------------------------------------------------

EXEC InsertEmployee 'EJanKowal', '321rfew321f', 1, 'Jan', 'Kowalski', 'janek@supersklep.pl', '000000213', 'Polska', 
	'Wroc³aw', '21-312', 'D³uga', 21, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EJolaByl', 'dsa3f23f', 1, 'Jolanta', 'Bylowska', 'jolka@supersklep.pl', '000000214', 'Polska', 
	'Wroc³aw', '21-312', 'Krótka', 211, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EBartOl', '3dasfasewg21f', 1, 'Bartosz', 'Olekañczuk', 'bart@supersklep.pl', '000000210', 'Polska', 
	'Wroc³aw', '21-645', 'Stroma', 54, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EGrzegSztolpa', 'g43kjfew32', 1, 'Grzegorz', 'Szto³pa', 'greg-s@supersklep.pl', '000000113', 'Polska', 
	'Wroc³aw', '21-312', 'Pochy³a', 32, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EAnnaBalonik', 'fsdrew43fs', 1, 'Anna', 'Balonik', 'aneczka@supersklep.pl', '000000192', 'Polska', 
	'Wroc³aw', '54-234', 'Robocza', 264, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EKrysHubert', 'g23ew23', 2, 'Krystyna', 'Hubert', 'krysia-h@supersklep.pl', '000000100', 'Polska', 
	'Wroc³aw', '21-543', 'Szybka', 214, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EAndrzeKlus', 'fadgafw2', 1, 'Andrzej', 'Kluœ', 'andrew@supersklep.pl', '000000413', 'Polska', 
	'Wroc³aw', '23-332', 'Grabiszyñska', 100, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EBeataSilny', 'few23fsd', 2, 'Beata', 'Silny', 'beatka@supersklep.pl', '000000513', 'Polska', 
	'Wroc³aw', '31-342', 'G³ówna', 347, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'ERafalHans', 'gsdwesa32r', 1, 'Rafa³', 'Hans', 'hans@supersklep.pl', '000000299', 'Polska', 
	'Wroc³aw', '21-312', 'D³uga', 321, 'Dolnoœl¹skie';
GO
EXEC InsertEmployee 'EKrzysSzkanys', 'fsd32fds', 1, 'Krzysztof', 'Szkanys', 'krzys@supersklep.pl', '000000613', 'Polska', 
	'Wroc³aw', '21-612', 'D³uga', 215, 'Dolnoœl¹skie';
GO


-----TABELA-STATUS_RECLAMATION---------------------------------
-- Wstawianie danych do tabeli Status_Reclamation poleceniem:
---------------------------------------------------------------
-- EXEC InsertStatusReclamation @Name;
---------------------------------------------------------------

EXEC InsertReclamationStatus 'Przyjêto reklamacjê';
GO
EXEC InsertReclamationStatus 'Odes³ano do producenta';
GO
EXEC InsertReclamationStatus 'Naprawiono i odes³ano do klienta';
GO
EXEC InsertReclamationStatus 'Reklamacja odrzucona. Odes³ano do klienta';
GO

----TABELA-SHIPPMENT_METHODS------------------------------------
-- Wstawianie danych do tabeli Shippment_Methods poleceniem:
----------------------------------------------------------------
-- EXEC InsertShippmentMethods @Name, @Description, @Price;
----------------------------------------------------------------

EXEC InsertShippmentMethods 'Wysy³ka kurierem DPD', 'Szybka wysy³ka. Czas dostarczenia 1 dzieñ roboczy', 20;
GO
EXEC InsertShippmentMethods 'Wysy³ka kurierem POCZTEX48', 'Czas dostarczenia 1-2 dni robocze', 15;
GO
EXEC InsertShippmentMethods 'Wysy³ka poczt¹', 'Czas dostarczenia do 3-4 dni roboczych', 10;
GO
EXEC InsertShippmentMethods 'Wysy³ka do paczkomatu', 'Czas dostarczenia 2 dni robocze', 12;
GO


----TABELA-PAYMENT_METHODS---------------------------------------
-- Wstawianie danych do tabeli Payment_Methods poleceniem:
-----------------------------------------------------------------
-- EXEC InsertPaymentMethods @Name, @Description;
-----------------------------------------------------------------

EXEC InsertPaymentMethods 'Przelew bankowy', 'Ksiêgowanie do dwóch dni roboczych';
GO
EXEC InsertPaymentMethods 'P³atnoœæ PayPal', 'Ksiêgowanie natychmiastowe';
GO
EXEC InsertPaymentMethods 'Szybkie p³atnoœci', 'Ksiêgowanie do 24 godzin';
GO
EXEC InsertPaymentMethods 'P³atnoœæ kart¹ kredytow¹', 'Ksiêgowanie natychmiastowe';
GO
EXEC InsertPaymentMethods 'P³atnoœæ przy odbiorze', '';
GO

------------------------------------------------
-- Dodawanie Kategorii --
------------------------------------------------

EXEC InsertCategory 'Koputery PC', 'Zestawy Komputerowe', null;
GO
EXEC InsertCategory 'Laptopy', 'Notebooki, laptopy', null;
GO
EXEC InsertCategory 'Akcesoria', 'Wszelkie akcesoria komputerowe', null;
GO
EXEC InsertCategory 'Kontrolery', 'Myszki, klawiatury i inne', 3;
GO
EXEC InsertCategory 'Myszy', null, 4;
GO
EXEC InsertCategory 'Klawiatury', null , 4;
GO
EXEC InsertCategory 'Pady', null , 4;
GO
EXEC InsertCategory 'Kierownice', null , 4;
GO
EXEC InsertCategory 'Drukarki', null, 3;
GO
EXEC InsertCategory 'Laserowe', null , 9;
GO
EXEC InsertCategory 'Atramentowe', null , 9;
GO
EXEC InsertCategory 'Pozosta³e', 'Inne akcesoria', 2;
GO

------------------------------------------------
-- Dodawanie podatków --
------------------------------------------------
EXECUTE InsertTax 'Podatek Vat', 0;
GO


------------------------------------------------
--Dodawanie Producentów --
------------------------------------------------

EXECUTE InsertProducer 'Razer', 'Gra¿yna', 'Wolska', 'Gwolska@Razer.com', 456986321, 'Polska', 'Szczecin', '87-860', 'Morska', 5, 'Kujawsko-Pomorskie';
GO
EXECUTE InsertProducer 'A4tech', 'Jan', 'Kubica', 'JKubica@gmail.com', 562384769, 'Polska', 'Warszwa', '41-963', 'Marsza³kowska', 56, 'Mazowieckie';
GO
EXECUTE InsertProducer 'StellSeries' , 'Katarzyna', 'Kowalska', 'Kasia548@o2.pl', 541286327, 'Polska' , 'Poznañ' ,'56-182', 'Plac Grunwaldzki', 21, 'Wielkopolskie';
GO
EXECUTE InsertProducer 'Brother', 'Mieczys³aw' , 'Wolny' , 'MWolny@gmail.com' , 667841295, 'Polska' , 'Wroc³aw' , '58-100', 'Zachodnia' , 15, 'Dolnoœl¹skie';
GO
EXECUTE InsertProducer 'Lexmark' , 'Patryk', 'Bogacki', 'PBogacki@wp.pl', 686935418, 'Polska' , 'Warszawa', '41-963', 'Wa³brzyska', 1, 'Mazowieckie';
GO
EXECUTE InsertProducer 'HP', 'Wies³awa', 'Szymborska', 'WSzymborska@hp.com', 654386749, 'Polska' , '£ódŸ', '56-185', 'Zamkowa', 18, '£ódzkie';
GO
EXECUTE InsertProducer  'Media tech',	'Paulina'	,'Biedroñ'	,'PBiedron@gmail.com',	529638415	,'Polska',	'Toruñ',	'52-961',	'Cmentarna',	6	,'Kujowasko-pomorskie'
GO
EXECUTE InsertProducer 'Logitech',	'Zdzis³aw',	'¯ulikowski', 'Zdzisiek549@wp.pl', 	528961478,'Polska',	'Kraków', 	'64-852','Leœna', 	25, 'Ma³opolskie'
GO
EXECUTE InsertProducer 'Canon',	'Edward'	,'Œmig³y',	'ESmigly@live.com',	685219638,	'Polska',	'Legnica',	'58-145',	'D³uga'	,16,	'Dolnoœl¹skie'
GO
EXECUTE InsertProducer 'Samsung',	'Mieczys³awa',	'Grabowska',	'MGrabowska@hotmail.com',	666963954	,'Polska',	'Katowice'	,'64-125',	'Fabryczna',34	,'Œl¹skie'
GO
EXECUTE InsertProducer 'Sony', 'Adam'	,'Adamczyk',	'AAdamczyk@sony.com',	752961485	,'Polska'	,'Jelenia Góra'	,'56-148',	'Browarowa',	3	,'Dolnosl¹skie'
GO

-----------------------------------------------
-- Dodawanie Dostawców --
-----------------------------------------------

EXECUTE Supplier_Add 'Yamo', 'Grzegorz' , 'Piasecki' , 'GPiasecki@yamo.pl', 452698357, 'Polska', 'Wroc³aw', '58-100', 'Armi Krajowej', 4, 'Dolnoœl¹skie';
GO
EXECUTE Supplier_Add 'Incom', 'Bart³omiej', 'Filipek', 'BFilipek@gmail.com', 583951728, 'Polska', 'Poznañ', '54-893', 'Toruñska', 53, 'Wielkopolskie';
GO
EXECUTE Supplier_Add 'Sprint', 'Zuzanna' , 'Mucha', 'ZMucha@wp.pl', 457986265, 'Polska', 'Wa³brzych','58-130' ,'Œwidnicka', 5, 'Dolnoœl¹skie';
GO
EXECUTE Supplier_Add 'Axel Computer', 'Konrad', 'Walendron', 'KWalenrod@axel.com', 808546935, 'Polska', 'Gdañsk', '80-208', 'Stoczniowa', 19, 'Pomorskie';
GO
EXECUTE Supplier_Add 'Pakt', 'Monika', 'Kuczyñska', 'MKuczynska@Pakt.pl', 963852741, 'Polska', 'Warszawa', '02-776', 'Kazimierza Wielkiego', 29, 'Mazowieckie';
GO
EXECUTE Supplier_Add 'Pronox', 'Genowefa', 'Nowak', 'GNowak@Pronox.pl', 654852961, 'Polska' ,'Polkowice', '57-635', 'Parkowa', 12, 'Dolnoœl¹skie';
GO
EXECUTE Supplier_Add 'Proline', 'Alicja', 'Bukowska', 'ABukowska@Proline.pl', 762854963, 'Polska', 'Leszno', '64-100', 'Leszczyñskich', 5, 'Œl¹skie';
GO
EXECUTE Supplier_Add 'Adict', 'Edward', 'Zieliñki', 'AZielinski@Adict.pl', 659384192, 'Polska', 'Gniezno', '42-611', 'Centralna', 16, 'Wielkopolskie';
GO
EXECUTE Supplier_Add 'Atapol', 'Ludwik', 'Wielki', 'LWielki@Atapol.com',  743851469, 'Polska', 'W³oszczowa', '15-157', 'Dworcowa', 1, 'Mazowieckie';
GO
EXECUTE Supplier_Add 'Ogleo', 'Ma³gorzata', 'Kowalska', 'MKowalska@Ogleo.pl', 652963851, 'Polska', 'Rzeszów', '52-453', 'Polna', 15, 'Podkarpackie';
GO

----------------------------------------------
-- Dodawanie Produktów --
----------------------------------------------
EXECUTE InsertProduct 'Naga', 5, 1, 1, 270.00, 1 ,'myszka laserowa, przewodowa, Max. Rozdzielczoœæ (DPI): 8200', 0, 342.9;
GO
EXECUTE InsertProduct 'Sensei', 5, 3, 2, 220.00, 1, 'myszka laserowa, przewodowa, Max. Rozdzielczoœæ (DPI): 5700', 0, 270.6;
GO
EXECUTE InsertProduct 'X7', 5, 2, 3, 50, 1, 'Myszka optyczna, przewodowa, Max. Rozdzielczoœæ (DPI): 1600', 0, 61.5;
GO
EXECUTE InsertProduct 'HL-1110E', 10, 4, 1, 200.00, 1,  'Ma³a monochromatyczna drukarka laserowa', 0, 246.00;
GO
EXECUTE InsertProduct 'F310', 7, 8, 5, 70.0, 1, 'Gamepad Logitech Gamepad F310', 0, 86.1;
GO
EXECUTE InsertProduct 'Sony Dual Shock 4', 7, 11, 7, 200.00, 1 ,'Gamepad Sony Dual Shock 4', 0, 246.00;
GO
EXECUTE InsertProduct 'Razer Deathstalker Essential', 6, 1, 4, 140.00, 1, 'Klawiatura Razer Deathstalker Essential 2014', 0, 172.20;
GO
EXECUTE InsertProduct 'K120', 6, 8, 6, 40, 1, 'Klawiatura Logitech K120', 0, 49.2;
GO
EXECUTE InsertProduct 'Logitech G27 Racing Wheel', 8, 8, 8, 700.00, 1, 'Kierownica wraz z osprzêtem dla komputerów PC ', 0, 861;
GO
EXECUTE InsertProduct 'MediaTech CYBER Race', 8, 7, 9, 150.00, 1, 'Kierownica kompatybilna z PC i konsolami PS1, PS2. K¹t obrotu 270 stopni', 0, 184.5;
GO
EXECUTE InsertProduct 'Pixma IP7250', 11, 9, 7, 230.00, 1, 'Szybka drukarka fotograficzna', 0, 282.9;
GO
EXECUTE InsertProduct 'Pro 8100', 11, 6, 5,240.00, 1, 'Drukarka atramentowa HP Pro 8100', 0, 295.2;
GO

-------------------------------------------------
--Dodawanie dostaw--
--------------------------------------------------
EXECUTE InsertSupply 4100.00, 1;
GO
EXECUTE InsertSupply 800.00, 2;
GO
EXECUTE InsertSupply 2000.00, 1;
GO
EXECUTE InsertSupply 5600.00, 1;
GO

-----------------------------------------
--Dodawanie produktów do dostawy--
------------------------------------------

EXECUTE InsertSupplyDetail 1, 4, 100, 40;
GO
EXECUTE InsertSupplyDetail 1, 3, 20, 50;
GO
EXECUTE InsertSupplyDetail 2, 2, 80, 50;
GO
EXECUTE InsertSupplyDetail 4, 3, 20, 200;
GO
EXECUTE InsertSupplyDetail 4, 4, 100, 16;
GO

-----------------------------------------
--Dodawanie Statusów zamówienia--
-----------------------------------------

EXECUTE InsertOrderStatus 'Zamówienie nieop³acone';
GO
EXECUTE InsertOrderStatus 'Przygotowanie do wysy³ki';
GO
EXECUTE InsertOrderStatus 'Towar wys³any';
GO
EXECUTE InsertOrderStatus 'Zamówienie zrealizowane';
GO
EXECUTE InsertOrderStatus 'Towar Zwrócony';
GO


------TABELA-ORDERS----------------------------------------------
-- Wstawnianie danych do tabeli Orders poleceniem:
-----------------------------------------------------------------
-- EXEC InsertOrder @IdCustomer int, @IdPayment_Method int,
-- @IdShippment_Method int, @Description varchar(100),
-- @DiscountPercent int;
----------------------------------------------------------------

EXEC InsertOrder 1, 1, 1, 'Proszê o szybk¹ realizacjê', 5;
GO
EXEC InsertOrder 2, 1, 1, 'Proszê o woln¹ realizacjê', 10;
GO
EXEC InsertOrder 3, 1, 1, 'Proszê w ogóle o realizacjê', 0;
GO
EXEC InsertOrder 4, 1, 1, 'Bez komentarza', 0;
GO
EXEC InsertOrder 4, 1, 1, 'Dziekuje za zrealizowanie', 0;
GO

-----------------------------------------------------------------
-- Dodawanie produktu do zamówienia poleceniem:
-----------------------------------------------------------------
-- EXEC @IdOrder int, @IdProduct int, @Quantity int;
-----------------------------------------------------------------

EXEC InsertProductIntoOrder 1, 2, 1;
GO
EXEC InsertProductIntoOrder 2, 2, 1;
GO
EXEC InsertProductIntoOrder 3, 2, 1;
GO
EXEC InsertProductIntoOrder 4, 2, 1;
GO
EXEC InsertProductIntoOrder 4, 3, 5;
GO
EXEC InsertProductIntoOrder 4, 2, 2;
GO
EXEC InsertProductIntoOrder 2, 3, 4;
GO

------TABELA-RECLAMATIONS----------------------------------------
-- Wstawianie danych do tabeli Reclamations poleceniem:
-----------------------------------------------------------------
-- EXEC InsertReclamation @IdOrder, @IdProduct, @Description;
-----------------------------------------------------------------

EXEC InsertReclamation 1, 2, 'Opis uszkodzenia...';
GO
EXEC InsertReclamation 2, 2, 'Opis 2...';
GO
EXEC InsertReclamation 3, 2, 'Opis 3...';
GO
EXEC InsertReclamation 4, 2, 'Opis 4...';
GO

----------------------------------------------------
--Dodawanie Zwrotów
----------------------------------------------------
EXEC InsertReturn 2
GO
EXEC InsertReturn 5
GO
EXEC InsertReturn 4
GO

----------------------------------------------------
--Dodawanie produków do Zwrotów
----------------------------------------------------
EXEC InsertReturnDetails 1, 2
GO
EXEC InsertReturnDetails 3, 2
GO
EXEC InsertReturnDetails 3, 3
GO



-------------------------------------DODANIE PROCEDUR TYPU SELECT ----------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- DODAJ SOBIE PO KAZDYM END S£ÓWKO GO, WTEDY MO¯NA PUSIC CA£Y SKRYPT NA RAZ!
------------------------------------------------------------------------------------
-- Procedura sprawdza czy istniej¹ w systemie zaleg³e reklamacje ze statusem 1 lub 2
-- czyli takie, które nie zosta³y wys³ane do producenta lub zosta³y wys³ane a
-- nie zosta³y odes³ane do klienta.
-- Procedura przyjmuje parametr liczbowy w postaci liczby dni. Mo¿na sprawdziæ np.
-- czy w systemie znajduj¹ siê reklamacje starsze ni¿ 14 dni z powy¿szymi statusami:

-- EXEC FindOverdueReclamations 14;
-------------------------------------------------------------------------------------

CREATE PROCEDURE FindOverdueReclamations 
@Days int
AS BEGIN

SELECT Reclamations.IdReclamation as 'Nr reklamacji', Status_Reclamation.Name_Status_Reclamation
	as 'Status', Reclamations.Date_reclamation as 'Data rozpoczêcia', Products.Name_Product
	as 'Nazwa produktu'
FROM Reclamations
	inner join Status_Reclamation on 
		Status_Reclamation.IdStatus_Reclamation = Reclamations.IdStatus_Reclamation
	inner join Products on Products.IdProduct = Reclamations.IdProduct
WHERE Reclamations.Date_reclamation <= DATEADD(dd, (@Days * (-1)), GETDATE())
	AND Reclamations.IdStatus_Reclamation < 3; 

END
GO

----------------------------------------------------------------------------------------------
-- Procedura pozwalaj¹ca na wyszukiwanie pracowników po imieniu i/lub nazwisku wprowadzaj¹c
-- ci¹g tekstowy:

-- EXEC FindEmployee 'Anna', NULL;
----------------------------------------------------------------------------------------------

CREATE PROCEDURE FindEmployee
@FirstName varchar(20) = ' ',
@LastName varchar(20) = ' '

AS BEGIN

SELECT Employees.IdEmployee as 'Nr pracownika', Groups.Role as 'Stanowisko',
	Contacts.FirstName as 'Imiê', Contacts.LastName as 'Nazwisko', 
	Contacts.Email as 'Adres mail', Contacts.Phone_Number as 'Numer telefonu', 
	Addresses.Street_Name as 'Nazwa ulicy',  Addresses.Street_Number as 'Nr domu', 
	Addresses.City as 'Miasto'
FROM Employees
	inner join Groups on Groups.IdGroup = Employees.IdGroup
	inner join Contacts on Contacts.IdContact = Employees.IdContact
	inner join Addresses on Addresses.IdAddress = Employees.IdAddress
WHERE Contacts.FirstName LIKE '%' + @FirstName + '%' OR Contacts.LastName LIKE '%' + @LastName + '%';

END
GO

------------------------------------------------------------------------------------
-- Procedura pozwala wyœwietliæ ¿¹dan¹ iloœæ najlepiej sprzedaj¹cych siê produktów 
-- w sklepie.

-- EXEC ShowBestSellers 10;
-------------------------------------------------------------------------------------


CREATE PROCEDURE ShowBestSellers
@Number int

AS BEGIN

SELECT TOP (@Number) Order_Details.IdProduct as 'ID', Products.Name_Product as 'Nazwa produktu', 
	Categories.Name_Category as 'Kategoria', Producers.Name_Producer as 'Producent', 
	Products.Gross_Price as 'Cena brutto', Sum(Order_Details.Quantity_Ordered) as 'Suma'
FROM Order_Details
	inner join Products on Products.IdProduct = Order_Details.IdProduct
	inner join Categories on Categories.IdCategory = Products.IdCategory
	inner join Producers on Producers.IdProducer = Products.IdProducer
GROUP BY Order_Details.IdProduct, Products.Name_Product, Categories.Name_Category, 
	Producers.Name_Producer, Products.Gross_Price
ORDER BY Suma DESC;

END
GO

----------------------------------------------------------------------------------------------
-- Procedura pozwala na wyœwietlanie listy produktów w danym zamówieniu. Jest pomocna dla
-- pracowników obs³uguj¹cych zamówienie klienta. Pozwala na przygotowanie do wysy³ki zamówionych
-- produktów:

-- EXEC ShowProductsFromOrderNr 4;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE ShowProductsFromOrderNr 
@Number int

AS BEGIN

SELECT Products.IdProduct as 'ID produktu', Products.Name_Product as 'Nazwa produktu', 
	Order_Details.Quantity_Ordered as 'Zamówiona iloœæ'
FROM Order_Details 
	inner join Products on Products.IdProduct = Order_Details.IdProduct
WHERE Order_Details.IdOrder = @Number
ORDER BY Products.Name_Product ASC;

END
GO

-------------------------------------------------------------------------------------------------
-- Procedura pozwala na wyœwietlenie N liczby nazw miast z których najczêœciej klienci robi¹ zakupy.
-- Bywa pomocna w okreœleniu prawid³owej strategii marketingowej na danym obszarze kraju:

-- EXEC ShowSalesByCities 10;
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE ShowSalesByCities
@Number int

AS BEGIN

SELECT TOP (@Number) Addresses.City as 'Miasto', Addresses.State as 'Województwo', COUNT(*) as 'Iloœæ zamówieñ'

FROM Orders
	inner join Customers on Customers.IdCustomer = Orders.IdCustomer
	inner join Addresses on Addresses.IdAddress = Customers.IdMainAddress

GROUP BY Addresses.City, Addresses.State
ORDER BY [Iloœæ zamówieñ] DESC;

END
GO

--------------------------------------------------
--Wyszukiwanie szczegó³ów o Produkcie po nazwie --
--Exec FindProduct G27--
--------------------------------------------------

CREATE PROCEDURE FindProduct
@Name_Product varchar(50)

AS BEGIN

SELECT Products.IdProduct As 'ID Produktu', Products.Name_Product As 'Nazwa Produktu', Producers.Name_Producer As 'Nazwa Producenta',
Products.Quantity_Possessed As 'Iloœæ sztuk',Products.Net_Price As 'Cena Netto', Products.Gross_Price As 'Cena brutto'
FROM Products
	inner join Producers on Producers.IdProducer = Products.IdProducer
WHERE Products.Name_Product LIKE '%'  + @Name_Product + '%'
END
GO

-----------------------------------------------------------
-- Wyœwietlenie ile produktów oferuje nam dany Producent po nazwie lub ID
--EXEC ShowProduceritem null, 3
-----------------------------------------------------------

CREATE PROCEDURE [dbo].[ShowProduceritem]
@Name_Producer varchar(20),
@IdProducer int

AS BEGIN

SELECT 
Products.Name_Product As 'Nazwa produktu', Producers.Name_Producer As 'Nazwa Producenta', Producers.IdProducer As 'ID Producenta',  
Suppliers.Name_Supplier As 'Nazwa Dostawcy', Contacts.Email As 'Email', Contacts.Phone_Number As 'Numer telefonu'
FROM Producers
	inner join Products on Products.IdProducer = Producers.IdProducer
	inner join Suppliers on Suppliers.IdSupplier = Products.IdSupplier	
	inner join Contacts on Contacts.IdContact = Producers.IdContact
WHERE Producers.Name_Producer like '%' + @Name_Producer + '%' or Producers.IdProducer like @IdProducer
END
GO

------------------------------------------------------
--Szczegó³y dostawy--
--exec ShowSupplydetail 1
------------------------------------------------------
CREATE PROCEDURE ShowSupplydetail
@Number int

AS BEGIN
SELECT Supply.IdSupply As 'Id Dostawy', Suppliers.Name_Supplier As 'Nazwa dostawcy', Products.Name_Product As 'Nazwa produktu', 
Supply_Details.Price_Item As 'Cena za sztuke', Supply_Details.Quantity_Supplied As 'Dostarczona iloœæ'
FROM Supply
	inner join Suppliers on Suppliers.IdSupplier = Supply.IdSupplier
	inner join Supply_Details on Supply_Details.IdSupply = Supply.IdSupply
	inner join Products on Products.IdProduct = Supply_Details.IdProduct
WHERE Supply.IdSupply like @Number
Order by [Dostarczona iloœæ] DESC
END
GO

----------------------------------------------------
--Szczegó³y zwrotu towaru--
--EXEC ShowReturnDeatil 3
----------------------------------------------------

CREATE PROCEDURE ShowReturnDeatil
@Number int
AS BEGIN
SELECT Returns.IdReturn As 'Id Zwrotu', Products.Name_Product As 'Nazwa Produktu', Returns.IdOrder As 'Id Zamówienia', 
Orders.Date_Order 'Data Zamówienia', Returns.Date_Return 'Data Zwrotu'
FROM Returns
	inner join Return_Details on Return_Details.IdReturn = Returns.IdReturn
	inner join Products on Products.IdProduct = Return_Details.IdProduct
	inner join Orders on Orders.IdOrder = Returns.IdOrder
WHERE Returns.IdReturn like @Number
END
GO