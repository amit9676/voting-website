USE [master]
GO
/****** Object:  Database [VotingSite]    Script Date: 26/08/2020 17:02:45 ******/
CREATE DATABASE [VotingSite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VotingSite', FILENAME = N'E:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\VotingSite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VotingSite_log', FILENAME = N'E:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\VotingSite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VotingSite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VotingSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VotingSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VotingSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VotingSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VotingSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VotingSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [VotingSite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VotingSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VotingSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VotingSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VotingSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VotingSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VotingSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VotingSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VotingSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VotingSite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VotingSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VotingSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VotingSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VotingSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VotingSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VotingSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VotingSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VotingSite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VotingSite] SET  MULTI_USER 
GO
ALTER DATABASE [VotingSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VotingSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VotingSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VotingSite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VotingSite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VotingSite] SET QUERY_STORE = OFF
GO
USE [VotingSite]
GO
/****** Object:  Table [dbo].[Parties]    Script Date: 26/08/2020 17:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parties](
	[PartyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](15) NOT NULL,
	[Description] [nchar](200) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Votes] [int] NOT NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voters]    Script Date: 26/08/2020 17:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voters](
	[VoterID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[SocialNumber] [nvarchar](9) NOT NULL,
	[Gender] [nvarchar](6) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[City] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[SocialNumberIssueDate] [date] NOT NULL,
	[PartyID] [int] NULL,
 CONSTRAINT [PK_Voters] PRIMARY KEY CLUSTERED 
(
	[VoterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Parties] ON 

INSERT [dbo].[Parties] ([PartyID], [Name], [Description], [Image], [Votes]) VALUES (1, N'הליכוד         ', N'מפלגה המאמינה בשוק חופשי, תחרות, ביטחון, וחירות, ותשאף תמיד למצוינות בכל מה שהיא עושה ותמיד לטובת המדינה תחת הנהגה מוכחת.                                                                               ', N'3293abcc-9486-467b-9b60-5119387b3e81.jpg', 2)
INSERT [dbo].[Parties] ([PartyID], [Name], [Description], [Image], [Votes]) VALUES (3, N'ימינה          ', N'אנחנו מאמינים בחיבור בין עם ישראל ואדמת ישראל ההיסטורית, ושואפים להחלת ריבונות ישראלית על שטחים אלו                                                                                                     ', N'2bddc18d-f207-46e7-8596-bd8e6f9814891.jpg', 2)
INSERT [dbo].[Parties] ([PartyID], [Name], [Description], [Image], [Votes]) VALUES (4, N'כחול לבן       ', N'אנחנו מאמינים באיחוד העם הישראלי על גווניו ושואפים לקידומה ופיתוחה של המדינה לפי חזון הציונות                                                                                                           ', N'a160e6da-b07f-4cbd-8733-3356e7bcbc5d.jpg', 2)
INSERT [dbo].[Parties] ([PartyID], [Name], [Description], [Image], [Votes]) VALUES (5, N'העבודה         ', N'מפלגת העבודה מושתתת על אמונה ובני אדם והשמת האזרח בראש סדר העדיפויות שלנו                                                                                                                               ', N'ba6d927f-b8ed-4200-91ad-7a9586715db9.jpg', 2)
INSERT [dbo].[Parties] ([PartyID], [Name], [Description], [Image], [Votes]) VALUES (6, N'מרצ            ', N'אנחנו מפלגה שמאמינה בשאיפה תמידית לשלום, פלורליזם וצדק חברתי ושיוויוני                                                                                                                                  ', N'8e97b399-5101-4b70-89f9-048cb09412ff.jpg', 2)
SET IDENTITY_INSERT [dbo].[Parties] OFF
SET IDENTITY_INSERT [dbo].[Voters] ON 

INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (1, N'אילן', N'רוזנפלד', N'426812774', N'זכר', N'Ilan777@gmail.com', N'נתניה', N'0547661273', CAST(N'1996-02-10' AS Date), 3)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (2, N'קובי', N'פרג''', N'938475617', N'זכר', N'kobi_f@gmail.com', N'נתניה', N'0524219980', CAST(N'1996-09-09' AS Date), 1)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (4, N'עודד', N'פז', N'289731475', N'זכר', N'pazi@gmail.com', N'נתניה', N'0509989012', CAST(N'1996-07-26' AS Date), 1)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (5, N'נתן', N'קופרמן', N'988012652', N'זכר', N'natanK@gmail.com', N'באר שבע', N'0521776825', CAST(N'1996-10-27' AS Date), 4)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (6, N'אלונה', N'טל', N'859012421', N'נקבה', N'alona@gmail.com', N'תל אביב', N'0581891721', CAST(N'1999-03-07' AS Date), 5)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (7, N'ימית', N'סול', N'121889531', N'נקבה', N'yamitiii@gmail.com', N'ראשון לציון', N'0545531960', CAST(N'1998-12-15' AS Date), 3)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (8, N'דנה', N'פרידר', N'209856121', N'נקבה', N'fridera@gmail.com', N'ראשון לציון', N'0521127629', CAST(N'2003-04-19' AS Date), 6)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (9, N'גרי', N'מנדלבאום', N'216558713', N'זכר', N'ninini@gmail.com', N'פתח תקווה', N'0541854912', CAST(N'1985-08-21' AS Date), 4)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (10, N'רוני', N'מנדלבאום', N'987583123', N'נקבה', N'roni_mendel@gmail.com', N'תל אביב', N'0509915243', CAST(N'2006-02-23' AS Date), 6)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (12, N'ברכה', N'קינשרברג', N'287943451', N'נקבה', N'braha@gmail.com', N'תל אביב', N'0527438693', CAST(N'1951-08-11' AS Date), 5)
INSERT [dbo].[Voters] ([VoterID], [FirstName], [LastName], [SocialNumber], [Gender], [Email], [City], [Phone], [SocialNumberIssueDate], [PartyID]) VALUES (14, N'אברהם', N'לטין', N'743242198', N'זכר', N'mr_latin@gmail.com', N'רחובות', N'7241259742', CAST(N'1963-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Voters] OFF
ALTER TABLE [dbo].[Voters]  WITH CHECK ADD  CONSTRAINT [FK_Voters_Parties] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[Voters] CHECK CONSTRAINT [FK_Voters_Parties]
GO
USE [master]
GO
ALTER DATABASE [VotingSite] SET  READ_WRITE 
GO
