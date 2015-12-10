

-------------------------------------DODANIE PROCEDUR TYPU SELECT ----------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- DODAJ SOBIE PO KAZDYM END SŁÓWKO GO, WTEDY MOŻNA PUSIC CAŁY SKRYPT NA RAZ!
------------------------------------------------------------------------------------
-- Procedura sprawdza czy istnieją w systemie zaległe reklamacje ze statusem 1 lub 2
-- czyli takie, które nie zostały wysłane do producenta lub zostały wysłane a
-- nie zostały odesłane do klienta.
-- Procedura przyjmuje parametr liczbowy w postaci liczby dni. Można sprawdzić np.
-- czy w systemie znajdują się reklamacje starsze niż 14 dni z powyższymi statusami:

-- EXEC FindOverdueReclamations 14;
-------------------------------------------------------------------------------------

CREATE PROCEDURE FindOverdueReclamations 
@Days int
AS BEGIN

SELECT Reclamations.IdReclamation as 'Nr reklamacji', Status_Reclamation.Name_Status_Reclamation
	as 'Status', Reclamations.Date_reclamation as 'Data rozpoczęcia', Products.Name_Product
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
-- Procedura pozwalająca na wyszukiwanie pracowników po imieniu i/lub nazwisku wprowadzając
-- ciąg tekstowy:

-- EXEC FindEmployee 'Anna', NULL;
----------------------------------------------------------------------------------------------

CREATE PROCEDURE FindEmployee
@FirstName varchar(20) = ' ',
@LastName varchar(20) = ' '

AS BEGIN

SELECT Employees.IdEmployee as 'Nr pracownika', Groups.Role as 'Stanowisko',
	Contacts.FirstName as 'Imię', Contacts.LastName as 'Nazwisko', 
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
-- Procedura pozwala wyświetlić żądaną ilość najlepiej sprzedających się produktów 
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
-- Procedura pozwala na wyświetlanie listy produktów w danym zamówieniu. Jest pomocna dla
-- pracowników obsługujących zamówienie klienta. Pozwala na przygotowanie do wysyłki zamówionych
-- produktów:

-- EXEC ShowProductsFromOrderNr 4;
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE ShowProductsFromOrderNr 
@Number int

AS BEGIN

SELECT Products.IdProduct as 'ID produktu', Products.Name_Product as 'Nazwa produktu', 
	Order_Details.Quantity_Ordered as 'Zamówiona ilość'
FROM Order_Details 
	inner join Products on Products.IdProduct = Order_Details.IdProduct
WHERE Order_Details.IdOrder = @Number
ORDER BY Products.Name_Product ASC;

END
GO

-------------------------------------------------------------------------------------------------
-- Procedura pozwala na wyświetlenie N liczby nazw miast z których najczęściej klienci robią zakupy.
-- Bywa pomocna w określeniu prawidłowej strategii marketingowej na danym obszarze kraju:

-- EXEC ShowSalesByCities 10;
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE ShowSalesByCities
@Number int

AS BEGIN

SELECT TOP (@Number) Addresses.City as 'Miasto', Addresses.State as 'Województwo', COUNT(*) as 'Ilość zamówień'

FROM Orders
	inner join Customers on Customers.IdCustomer = Orders.IdCustomer
	inner join Addresses on Addresses.IdAddress = Customers.IdMainAddress

GROUP BY Addresses.City, Addresses.State
ORDER BY [Ilość zamówień] DESC;

END
GO

--------------------------------------------------
--Wyszukiwanie szczegółów o Produkcie po nazwie --
--Exec FindProduct G27--
--------------------------------------------------

CREATE PROCEDURE FindProduct
@Name_Product varchar(50)

AS BEGIN

SELECT Products.IdProduct As 'ID Produktu', Products.Name_Product As 'Nazwa Produktu', Producers.Name_Producer As 'Nazwa Producenta',
Products.Quantity_Possessed As 'Ilość sztuk',Products.Net_Price As 'Cena Netto', Products.Gross_Price As 'Cena brutto'
FROM Products
	inner join Producers on Producers.IdProducer = Products.IdProducer
WHERE Products.Name_Product LIKE '%'  + @Name_Product + '%'
END
GO

-----------------------------------------------------------
-- Wyświetlenie ile produktów oferuje nam dany Producent po nazwie lub ID
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
--Szczegóły dostawy--
--exec ShowSupplydetail 1
------------------------------------------------------
CREATE PROCEDURE ShowSupplydetail
@Number int

AS BEGIN
SELECT Supply.IdSupply As 'Id Dostawy', Suppliers.Name_Supplier As 'Nazwa dostawcy', Products.Name_Product As 'Nazwa produktu', 
Supply_Details.Price_Item As 'Cena za sztuke', Supply_Details.Quantity_Supplied As 'Dostarczona ilość'
FROM Supply
	inner join Suppliers on Suppliers.IdSupplier = Supply.IdSupplier
	inner join Supply_Details on Supply_Details.IdSupply = Supply.IdSupply
	inner join Products on Products.IdProduct = Supply_Details.IdProduct
WHERE Supply.IdSupply like @Number
Order by [Dostarczona ilość] DESC
END
GO

----------------------------------------------------
--Szczegóły zwrotu towaru--
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