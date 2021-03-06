USE [master]
GO
/****** Object:  Database [MultiLingualDictionaryDB]    Script Date: 6.10.2015 г. 9:34:07 ******/
CREATE DATABASE [MultiLingualDictionaryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MultiLingualDictionaryDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MultiLingualDictionaryDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MultiLingualDictionaryDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MultiLingualDictionaryDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiLingualDictionaryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  MULTI_USER 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MultiLingualDictionaryDB', N'ON'
GO
USE [MultiLingualDictionaryDB]
GO
/****** Object:  Table [dbo].[Explanations]    Script Date: 6.10.2015 г. 9:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanations](
	[ExplanationId] [int] IDENTITY(1,1) NOT NULL,
	[WordExplanation] [nvarchar](200) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[WordId] [int] NOT NULL,
 CONSTRAINT [PK_Explanations] PRIMARY KEY CLUSTERED 
(
	[ExplanationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 6.10.2015 г. 9:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Synonyms]    Script Date: 6.10.2015 г. 9:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synonyms](
	[SynonymWordId] [int] NOT NULL,
	[WordId] [int] NOT NULL,
 CONSTRAINT [PK_Synonyms] PRIMARY KEY CLUSTERED 
(
	[SynonymWordId] ASC,
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Translations]    Script Date: 6.10.2015 г. 9:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[TranslationWordId] [int] NOT NULL,
	[WordId] [int] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[TranslationWordId] ASC,
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 6.10.2015 г. 9:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordId] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Explanations] ON 

INSERT [dbo].[Explanations] ([ExplanationId], [WordExplanation], [LanguageId], [WordId]) VALUES (12, N'A relatively small, usually open craft of a size that might be carried aboard a ship.', 1, 2)
INSERT [dbo].[Explanations] ([ExplanationId], [WordExplanation], [LanguageId], [WordId]) VALUES (13, N'A vessel of considerable size for deep-water navigation.', 1, 1)
INSERT [dbo].[Explanations] ([ExplanationId], [WordExplanation], [LanguageId], [WordId]) VALUES (14, N'Голям плавателен съд (каран отначало с платна, сега с машинен двигател) за пренасяне на хора или товари.', 2, 5)
INSERT [dbo].[Explanations] ([ExplanationId], [WordExplanation], [LanguageId], [WordId]) VALUES (15, N'Малък плавателен съд за близки разстояния, каран с помощта на гребла, платна или мотор. ', 2, 4)
SET IDENTITY_INSERT [dbo].[Explanations] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (1, N'English')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (2, N'Bulgarian')
SET IDENTITY_INSERT [dbo].[Languages] OFF
INSERT [dbo].[Synonyms] ([SynonymWordId], [WordId]) VALUES (1, 2)
INSERT [dbo].[Synonyms] ([SynonymWordId], [WordId]) VALUES (2, 1)
INSERT [dbo].[Synonyms] ([SynonymWordId], [WordId]) VALUES (4, 5)
INSERT [dbo].[Synonyms] ([SynonymWordId], [WordId]) VALUES (5, 4)
INSERT [dbo].[Translations] ([TranslationWordId], [WordId]) VALUES (1, 5)
INSERT [dbo].[Translations] ([TranslationWordId], [WordId]) VALUES (2, 4)
INSERT [dbo].[Translations] ([TranslationWordId], [WordId]) VALUES (4, 2)
INSERT [dbo].[Translations] ([TranslationWordId], [WordId]) VALUES (5, 1)
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([WordId], [Word], [LanguageId]) VALUES (1, N'Ship', 1)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId]) VALUES (2, N'Boat', 1)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId]) VALUES (4, N'Лодка', 2)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId]) VALUES (5, N'Кораб', 2)
SET IDENTITY_INSERT [dbo].[Words] OFF
/****** Object:  Index [WordId]    Script Date: 6.10.2015 г. 9:34:07 ******/
ALTER TABLE [dbo].[Explanations] ADD  CONSTRAINT [WordId] UNIQUE NONCLUSTERED 
(
	[ExplanationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Synonyms]    Script Date: 6.10.2015 г. 9:34:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Synonyms] ON [dbo].[Synonyms]
(
	[SynonymWordId] ASC,
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Translations]    Script Date: 6.10.2015 г. 9:34:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Translations] ON [dbo].[Translations]
(
	[TranslationWordId] ASC,
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Explanations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Explanations] CHECK CONSTRAINT [FK_Explanations_Languages]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words] FOREIGN KEY([SynonymWordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words1] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words1]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words] FOREIGN KEY([TranslationWordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words1] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words1]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
USE [master]
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  READ_WRITE 
GO
