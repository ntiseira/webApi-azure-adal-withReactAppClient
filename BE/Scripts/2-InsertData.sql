USE [OrderManagement]
GO

--Products
if not exists (select * from [dbo].[Products]
						where products.name = 'Mesa')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Mesa' , 4000 , 10)
end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Silla')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Silla' , 500 ,50)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Mesa ratona')
begin

INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Mesa ratona' , 1000 ,15)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Sillon')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Sillon' , 20000 ,150)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Mesa de luz')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Mesa de luz' , 1500 ,200)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Comoda')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Comoda' , 2000 ,20)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Mesa de comedor')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Mesa de comedor' , 1200 ,20)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Escritorio')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Escritorio' , 2450 ,25)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Mesa de arrime')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Mesa de arrime' , 2700 ,250)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Biblioteca')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Biblioteca' , 3600 ,17)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Silla matera')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Silla matera' , 1500 ,30)
	 end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Cama')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Cama' , 10000 ,20)
end
GO


if not exists (select * from [dbo].[Products]
						where products.name = 'Armario')
begin
INSERT INTO [dbo].[Products] ([name],[unitprice] ,[unitsInstock])
     VALUES('Armario' , 5000 ,10)
end
GO


if not exists (select * from [dbo].[Customer]
						where [Customer].[ContactName] = 'Ramon')
begin
INSERT INTO [dbo].[Customer]
           ([ContactName]
           ,[City]
           ,[State]
           ,[PostalCode]
           ,[phoneNumber])
     VALUES
           ('Ramon'
           ,'Buenos Aires'
           ,'Buenos Aires'
           ,1708
           ,'115456464646')
end
GO


if not exists (select * from [dbo].[Customer]
						where [Customer].[ContactName] = 'Pedro')
begin
INSERT INTO [dbo].[Customer]
           ([ContactName]
           ,[City]
           ,[State]
           ,[PostalCode]
           ,[phoneNumber])
     VALUES
           ('Pedro'
           ,'Mendoza'
           ,'Mendoza'
           ,1709
           ,'115456464646')
end
GO



--Orders

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Garcia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Garcia 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Belgrano 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Belgrano 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'San martin 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'San martin 500','Buenos Aires','1708','Argentina',15000)
end
GO



if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Rosas 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Rosas 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Palermo 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Palermo 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Garcia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Colombia 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Estados Unidos 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Estados Unidos 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Merlo 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Merlo 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Av.Mayo 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Av.Mayo 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Alem 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Alem 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Diagonal Norte 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Diagonal Norte 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Triunvirato 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Triunvirato 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Monserrat 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Monserrat 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Francia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Francia 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Bolivia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Bolivia 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Chile 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Chile 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Paraguay 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Paraguay 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'French 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'French 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Abel Costa 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Abel Costa 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Boatti 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Boatti 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Uruguay 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Uruguay 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Rivera Indarte 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Rivera Indarte 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Brasil 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Brasil 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Espora 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Espora 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Alsina 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Alsina 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Hipolito Yrigoyen 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Hipolito Yrigoyen 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Rosales 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Rosales 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Yatay 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Yatay 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Monteagudo 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Monteagudo 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Maipu 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Maipu 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Corrientes 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Corrientes 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Necochea 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Necochea 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Saavedra 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Saavedra 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Mitre 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Mitre 500','Buenos Aires','1708','Argentina',15000)
end
GO

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Garcia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Garcia 500','Buenos Aires','1708','Argentina',15000)
end
GO

--------------

if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'French 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'French 500','Buenos Aires','1708','Argentina',15000)
end
GO



if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'French 300')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'French 300','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Rivadavia 502')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Rivadavia 502','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Rivadavia 1000')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Rivadavia 1000','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'French 400')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'French 400','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'French 100')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'French 100','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Av.Libertador 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Av.Libertador 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Av.Libertador 600')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Av.Libertador 600','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Paris 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Paris 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Monserrat 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Monserrat 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Roma 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Roma 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Francia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Francia 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Barcelona 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Barcelona 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Concordia 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Concordia 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 2 and [Orders].[shipAdress] = 'Rio Cuarto 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (2,GETDATE(),'Rio Cuarto 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Avellaneda 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Avellaneda 500','Buenos Aires','1708','Argentina',15000)
end
GO

--Order Details
USE [OrderManagement]
GO




INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,1,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,1,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,1,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,1,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,1,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,1,10,10)

GO

--



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,2,10,10)

GO
----


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,2,10,10)

GO
 
INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,2,10,10)

GO



----





INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,3,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,3,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,3,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,3,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,3,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,3,10,10)

GO


---




INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,4,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,4,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,4,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,4,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,4,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,4,10,10)

GO


---



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,5,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,5,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,5,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,5,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,5,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,5,10,10)

GO

---




INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,2,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,2,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,2,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,2,10,10)

GO

---



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,2,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,2,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,2,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,2,10,10)

GO

INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,2,10,10)

GO


---




INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (2,2,10,10)

GO



INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (3,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (4,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (5,2,10,10)

GO


INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (6,2,10,10)

GO


--
