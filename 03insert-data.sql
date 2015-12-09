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

