USE [FS_RecruitingExercise]
GO


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


