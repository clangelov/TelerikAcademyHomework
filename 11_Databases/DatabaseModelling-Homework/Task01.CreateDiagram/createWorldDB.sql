USE [master]
GO
/****** Object:  Database [WorldDB]    Script Date: 5.10.2015 г. 14:34:07 ******/
CREATE DATABASE [WorldDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WorldDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorldDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WorldDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorldDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WorldDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorldDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WorldDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorldDB', N'ON'
GO
USE [WorldDB]
GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 5.10.2015 г. 14:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresses](
	[AdressId] [int] IDENTITY(1,1) NOT NULL,
	[AdressText] [nvarchar](150) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Adresses] PRIMARY KEY CLUSTERED 
(
	[AdressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 5.10.2015 г. 14:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentId] [int] IDENTITY(10,10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 5.10.2015 г. 14:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(100,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 5.10.2015 г. 14:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(10000,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AdressId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 5.10.2015 г. 14:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownId] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (2, N'105 Alexander Malinov Blvd', 1002)
INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (3, N'1 Wale Str', 1000)
INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (4, N'Alexander Platz', 1004)
INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (5, N'10 Queen Elizabeth Str', 1001)
INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (6, N'666 Ninja Blvd', 1007)
INSERT [dbo].[Adresses] ([AdressId], [AdressText], [TownId]) VALUES (7, N'456 Kent Str', 1008)
SET IDENTITY_INSERT [dbo].[Adresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (10, N'Africa')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (20, N'Europe')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (30, N'Asia')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (40, N'North America')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (50, N'Australia')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (60, N'South America')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (103, N'South Africa', 10)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (104, N'Nigaria', 10)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (105, N'Bulgaria', 20)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (106, N'Germany', 20)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (107, N'Japan', 30)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (108, N'Inida', 30)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (109, N'Canada', 40)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (110, N'Australia', 50)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (111, N'Brazil', 60)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AdressId]) VALUES (2, N'Hideo', N'Kojima', 6)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AdressId]) VALUES (10000, N'Kelly', N'Miller', 7)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AdressId]) VALUES (10001, N'Aaron', N'Mokoena', 3)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AdressId]) VALUES (10002, N'Ilkan', N'Gündoğan', 4)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1000, N'Cape Town', 103)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1001, N'Abuja', 104)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1002, N'Sofia', 105)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1004, N'Berlin', 106)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1005, N'Kyoto', 107)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1006, N'Goa', 108)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1007, N'Vancouver', 109)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1008, N'Sydney', 110)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1009, N'Sao Paulo', 111)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Adresses]  WITH CHECK ADD  CONSTRAINT [FK_Adresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([TownId])
GO
ALTER TABLE [dbo].[Adresses] CHECK CONSTRAINT [FK_Adresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([ContinentId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Adresses] FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adresses] ([AdressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Adresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [WorldDB] SET  READ_WRITE 
GO
