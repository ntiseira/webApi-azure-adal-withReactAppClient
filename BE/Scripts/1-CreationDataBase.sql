--Data base creation
USE [master]
GO

/****** Object:  Database [OrderManagement]    Script Date: 11/9/2018 9:38:02 PM ******/
CREATE DATABASE [OrderManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FS_RecruitingExercise', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FS_RecruitingExercise.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FS_RecruitingExercise_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FS_RecruitingExercise_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [OrderManagement] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [OrderManagement] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [OrderManagement] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [OrderManagement] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [OrderManagement] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [OrderManagement] SET ARITHABORT OFF 
GO

ALTER DATABASE [OrderManagement] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [OrderManagement] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [OrderManagement] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [OrderManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [OrderManagement] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [OrderManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [OrderManagement] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [OrderManagement] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [OrderManagement] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [OrderManagement] SET  DISABLE_BROKER 
GO

ALTER DATABASE [OrderManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [OrderManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [OrderManagement] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [OrderManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [OrderManagement] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [OrderManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [OrderManagement] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [OrderManagement] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [OrderManagement] SET  MULTI_USER 
GO

ALTER DATABASE [OrderManagement] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [OrderManagement] SET DB_CHAINING OFF 
GO

ALTER DATABASE [OrderManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [OrderManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [OrderManagement] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [OrderManagement] SET QUERY_STORE = OFF
GO

ALTER DATABASE [OrderManagement] SET  READ_WRITE 
GO


--User Login Creation

USE [OrderManagement]
GO
IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'orderUser')
BEGIN
CREATE LOGIN orderUser WITH PASSWORD = 'hol@Viernes12', DEFAULT_DATABASE = [OrderManagement] , DEFAULT_LANGUAGE = us_english, CHECK_POLICY= OFF;
END
go
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'orderUser')
BEGIN
/****** Object:  User [orderUser]    Script Date: 11/9/2018 9:39:56 PM ******/
CREATE USER orderUser FOR LOGIN orderUser WITH DEFAULT_SCHEMA=[dbo]
END
GO
ALTER ROLE [db_owner] ADD MEMBER [orderUser]
GO



--Tables creations
USE [OrderManagement]
GO
/****** Object:  User [orderUser]    Script Date: 11/9/2018 9:36:40 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'orderUser')
CREATE USER [orderUser] FOR LOGIN [orderUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [orderUser]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/9/2018 9:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[phoneNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Order_details]    Script Date: 11/9/2018 9:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order_details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[OrderId] [int] NULL,
	[Quantity] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Order_details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/9/2018 9:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Created_At] [datetime] NULL,
	[shipAdress] [varchar](50) NULL,
	[shipCity] [varchar](50) NULL,
	[shipPostalCode] [varchar](50) NULL,
	[shipCountry] [varchar](50) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/9/2018 9:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[unitprice] [decimal](18, 0) NULL,
	[unitsInstock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_details_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order_details]'))
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD  CONSTRAINT [FK_Order_details_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_details_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order_details]'))
ALTER TABLE [dbo].[Order_details] CHECK CONSTRAINT [FK_Order_details_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_details_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order_details]'))
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD  CONSTRAINT [FK_Order_details_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_details_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order_details]'))
ALTER TABLE [dbo].[Order_details] CHECK CONSTRAINT [FK_Order_details_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
