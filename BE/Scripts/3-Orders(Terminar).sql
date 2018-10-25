USE [FS_RecruitingExercise]
GO



if not exists (select * from [dbo].[Orders]
						where [Orders].[CustomerId] = 1 and [Orders].[shipAdress] = 'Avellaneda 500')
begin

INSERT INTO [dbo].[Orders] ([CustomerId],[Created_At],[shipAdress],[shipCity],[shipPostalCode],[shipCountry],[TotalAmount])
     VALUES (1,GETDATE(),'Avellaneda 500','Buenos Aires','1708','Argentina',15000)
end
GO


if not exists (select * from [dbo].[Order_details]
						where [Order_details].[ProductId] = 1 and [Order_details].[OrderId] = 1)
BEGIN 
INSERT INTO [dbo].[Order_details] ([ProductId],[OrderId],[Quantity],[discount])
     VALUES  (1,1,10,0)
END
GO




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


