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