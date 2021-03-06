USE [master]
GO
/****** Object:  Database [BaseballLeagueCollection]    Script Date: 12/11/2015 9:44:28 AM ******/
CREATE DATABASE [BaseballLeagueCollection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseballLeagueCollection', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BaseballLeagueCollection.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BaseballLeagueCollection_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BaseballLeagueCollection_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BaseballLeagueCollection] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseballLeagueCollection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseballLeagueCollection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BaseballLeagueCollection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseballLeagueCollection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseballLeagueCollection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BaseballLeagueCollection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseballLeagueCollection] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseballLeagueCollection] SET  MULTI_USER 
GO
ALTER DATABASE [BaseballLeagueCollection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseballLeagueCollection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseballLeagueCollection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseballLeagueCollection] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BaseballLeagueCollection] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BaseballLeagueCollection]
GO
/****** Object:  Table [dbo].[Exception]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exception](
	[ExceptionID] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionType] [nvarchar](100) NOT NULL,
	[ExceptionMessage] [nvarchar](300) NULL,
	[ExceptionDate] [datetime] NOT NULL,
	[Input] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Leagues]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Leagues](
	[LeagueID] [int] IDENTITY(1,1) NOT NULL,
	[LeagueName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Player]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[JerseyNumber] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[LastYearBA] [decimal](3, 3) NULL,
	[YearsPlayed] [int] NULL,
	[PrimaryPositionID] [int] NOT NULL,
	[SecondaryPositionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](30) NULL,
	[ManagerName] [varchar](30) NULL,
	[LeagueID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Leagues] ON 

INSERT [dbo].[Leagues] ([LeagueID], [LeagueName]) VALUES (1, N'National League')
INSERT [dbo].[Leagues] ([LeagueID], [LeagueName]) VALUES (2, N'American League')
SET IDENTITY_INSERT [dbo].[Leagues] OFF
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (1, N'Player1', N'One', 23, 2, CAST(0.297 AS Decimal(3, 3)), 5, 1, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (2, N'Player2', N'Two', 24, 1, CAST(0.248 AS Decimal(3, 3)), 2, 2, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (3, N'Player3', N'Three', 25, 1, CAST(0.268 AS Decimal(3, 3)), 3, 3, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (4, N'Player4', N'Four', 26, 6, CAST(0.304 AS Decimal(3, 3)), 3, 4, 2)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (5, N'Player5', N'Five', 27, 6, CAST(0.293 AS Decimal(3, 3)), 1, 5, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (7, N'Player7', N'Seven', 29, 1, CAST(0.283 AS Decimal(3, 3)), 1, 7, 8)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (8, N'Player8', N'Eight', 30, 1, CAST(0.301 AS Decimal(3, 3)), 1, 8, 7)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (9, N'Player9', N'Nine', 31, 2, CAST(0.293 AS Decimal(3, 3)), 1, 5, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (10, N'Lewis', N'Elliot', 12, 3, CAST(0.256 AS Decimal(3, 3)), 3, 1, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (11, N'Elwood', N'Trenton', 24, 6, CAST(0.269 AS Decimal(3, 3)), 5, 2, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (12, N'Blaze', N'Caelan ', 3, 2, CAST(0.298 AS Decimal(3, 3)), 3, 3, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (13, N'Andrew', N'Tang', 7, 2, CAST(0.278 AS Decimal(3, 3)), 2, 4, 5)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (14, N'Brandon', N'Marshal', 38, 2, CAST(0.278 AS Decimal(3, 3)), 6, 5, 4)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (15, N'Thad', N'Vern', 21, 2, CAST(0.303 AS Decimal(3, 3)), 4, 6, 8)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (16, N'Reginald', N'Kyle', 17, 2, CAST(0.298 AS Decimal(3, 3)), 2, 7, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (17, N'Hadyn', N'Rayner', 9, 2, CAST(0.288 AS Decimal(3, 3)), NULL, 8, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (18, N'Dalton', N'Tobias', 2, 2, CAST(0.314 AS Decimal(3, 3)), 3, 9, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (19, N'Wilkie', N'Finnegan', 3, 3, CAST(0.294 AS Decimal(3, 3)), 4, 1, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (20, N'Kenton', N'Leighton', 16, 3, CAST(0.259 AS Decimal(3, 3)), 1, 2, 5)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (21, N'Stacy', N'Chuck', 44, 3, CAST(0.299 AS Decimal(3, 3)), 3, 3, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (22, N'Mick', N'Rowland', 58, 3, CAST(0.314 AS Decimal(3, 3)), 1, 4, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (23, N'Martin', N'Davis', 24, 3, CAST(0.244 AS Decimal(3, 3)), 7, 5, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (24, N'Lynton', N'Dee', 5, 3, CAST(0.294 AS Decimal(3, 3)), 4, 6, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (25, N'Mervin', N'Anthony', 42, 3, CAST(0.269 AS Decimal(3, 3)), 2, 7, 8)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (26, N'Micky', N'Nat', 27, 3, CAST(0.288 AS Decimal(3, 3)), 1, 8, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (27, N'Dederick', N'Cameron', 14, 3, CAST(0.302 AS Decimal(3, 3)), NULL, 9, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (28, N'Mike', N'Drozda', 23, 4, CAST(0.357 AS Decimal(3, 3)), 4, 1, 3)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (29, N'Rocco', N'Riccardi', 11, 4, CAST(0.302 AS Decimal(3, 3)), NULL, 2, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (30, N'Dee', N'Austin', 8, 4, CAST(0.287 AS Decimal(3, 3)), 3, 3, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (31, N'Jimi', N'Prosper', 14, 4, CAST(0.256 AS Decimal(3, 3)), 8, 4, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (32, N'Cree', N'Kenrick', 27, 4, CAST(0.213 AS Decimal(3, 3)), 1, 5, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (33, N'Jonty', N'Moss', 4, 4, CAST(0.266 AS Decimal(3, 3)), 2, 6, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (34, N'Kolby', N'Dallas', 33, 4, CAST(0.277 AS Decimal(3, 3)), 2, 7, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (35, N'Jervis', N'Abraham', 21, 4, CAST(0.263 AS Decimal(3, 3)), NULL, 8, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (36, N'Allen', N'Tracy', 41, 4, CAST(0.301 AS Decimal(3, 3)), 3, 9, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (37, N'Hoyt', N'Lyle', 22, 5, CAST(0.305 AS Decimal(3, 3)), 2, 1, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (38, N'Carleton', N'Tanner', 42, 5, CAST(0.322 AS Decimal(3, 3)), 1, 2, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (39, N'Scott', N'Benz', 3, 5, CAST(0.288 AS Decimal(3, 3)), 4, 3, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (40, N'Evan', N'Ethelbert', 13, 5, CAST(0.277 AS Decimal(3, 3)), 2, 4, 5)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (41, N'Damon', N'Hyram', 16, 5, CAST(0.302 AS Decimal(3, 3)), 6, 5, 4)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (42, N'Clancy', N'Herbert', 45, 5, CAST(0.312 AS Decimal(3, 3)), 3, 6, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (43, N'Arlo', N'Augustine', 30, 5, CAST(0.269 AS Decimal(3, 3)), 1, 7, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (44, N'Lucas', N'Connell', 6, 5, CAST(0.250 AS Decimal(3, 3)), 1, 8, NULL)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (45, N'Tranter', N'Geoffrey', 28, 5, CAST(0.312 AS Decimal(3, 3)), 3, 9, 8)
INSERT [dbo].[Player] ([PlayerID], [FirstName], [LastName], [JerseyNumber], [TeamID], [LastYearBA], [YearsPlayed], [PrimaryPositionID], [SecondaryPositionID]) VALUES (49, N'Mike', N'Drozda', 25, 1, CAST(0.333 AS Decimal(3, 3)), 9, 3, 4)
SET IDENTITY_INSERT [dbo].[Player] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (1, N'Pitcher')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (2, N'Catcher')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (3, N'First Base')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (4, N'Second Base')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (5, N'Short Stop')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (6, N'Third Base')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (7, N'Left Fielder')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (8, N'Center Fielder')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (9, N'Right Fielder')
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (1, N'Free Agent', NULL, NULL)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (2, N'Cincinnati Reds', N'Bryan Price', 2)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (3, N'Cleveland Indians', N'Terry Francona', 1)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (4, N'Detroit Tigers', N'Brad Ausmus', 1)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (5, N'Arizona Diamondbacks', N'Chip Hale', 2)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (6, N'Boston Red Sox', N'Mike Drozda', 2)
INSERT [dbo].[Teams] ([TeamID], [TeamName], [ManagerName], [LeagueID]) VALUES (7, N'Toronto Blue Jays', N'Andrew Tang', 1)
SET IDENTITY_INSERT [dbo].[Teams] OFF
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_PlayerPosition] FOREIGN KEY([PrimaryPositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_PlayerPosition]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_PlayerPosition2] FOREIGN KEY([SecondaryPositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_PlayerPosition2]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_TeamID] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_TeamID]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_LeagueID] FOREIGN KEY([LeagueID])
REFERENCES [dbo].[Leagues] ([LeagueID])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_LeagueID]
GO
/****** Object:  StoredProcedure [dbo].[AddError]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[AddError]
(
	@ExceptionType nvarchar(100),
	@ExceptionMessage nvarchar(300),
	@ExceptionDate datetime,
	@Input text
)

AS
BEGIN

INSERT INTO Exception
(
	ExceptionType,
	ExceptionMessage,
	ExceptionDate,
	Input
)

VALUES
(
	@ExceptionType,
	@ExceptionMessage,
	GetDate(),
	@Input
)

END

GO
/****** Object:  StoredProcedure [dbo].[AddPlayer]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[AddPlayer]
(
	@FirstName			    varchar(30),
	@LastName				varchar(30),
	@JerseyNumber			int,
	@TeamID					int,
	@LastYearBA				dec(3,3),
	@YearsPlayed			int,
	@PrimaryPositionID		int,
	@SecondaryPositionID	int,
	@PlayerID				int output
)

AS BEGIN

INSERT INTO Player
(
	FirstName,
	LastName,
	JerseyNumber,
	TeamID,
	LastYearBA,
	YearsPlayed,
	PrimaryPositionID,
	SecondaryPositionID
)
VALUES 
(
	@FirstName,
	@LastName,
	@JerseyNumber,
	@TeamID,
	@LastYearBA,
	@YearsPlayed,
	@PrimaryPositionID,
	@SecondaryPositionID
)

SET @PlayerID = SCOPE_IDENTITY();

END

GO
/****** Object:  StoredProcedure [dbo].[CreateTeam]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CreateTeam] 
(	
	@TeamName		varchar(30), 
	@ManagerName	varchar(30), 
	@LeagueID		int,
	@TeamID			int output
)

AS BEGIN

INSERT INTO Teams
(
	TeamName, 
	ManagerName, 
	LeagueID
)

VALUES 
(
	@TeamName, 
	@ManagerName, 
	@LeagueID
)

SET @TeamID = SCOPE_IDENTITY();

END

GO
/****** Object:  StoredProcedure [dbo].[DeletePlayer]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[DeletePlayer]
(
	@PlayerID	int
)

AS BEGIN

DELETE FROM Player

WHERE PlayerID = @PlayerID

END 

GO
/****** Object:  StoredProcedure [dbo].[DisplayFreeAgents]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[DisplayFreeAgents]

AS BEGIN

SELECT 
	pl.PlayerID, 
    pl.FirstName + ' ' + pl.LastName    AS Name, 
	pl.JerseyNumber, 
	pl.LastYearBA, 
	ps1.PositionName					AS PrimaryPosition, 
	ps2.PositionName					AS SecondaryPosition, 
	pl.YearsPlayed,
	pl.TeamID 

FROM Player pl
LEFT JOIN Position ps1 ON pl.PrimaryPositionID = ps1.PositionID 
LEFT JOIN Position ps2 ON pl.SecondaryPositionID = ps2.PositionID

WHERE pl.TeamID = 1

END 

GO
/****** Object:  StoredProcedure [dbo].[LeagueDropDown]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[LeagueDropDown]

AS BEGIN

SELECT 
	LeagueID,
	LeagueName
	
FROM Leagues

END

GO
/****** Object:  StoredProcedure [dbo].[PositionDropDown]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[PositionDropDown]

AS BEGIN

SELECT
	PositionID,
	PositionName

FROM Position

END 

GO
/****** Object:  StoredProcedure [dbo].[ReleasePlayer]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ReleasePlayer]
(
	@PlayerID	 int
)

AS  BEGIN

UPDATE Player
SET TeamID = 1

WHERE PlayerID = @PlayerID

END

GO
/****** Object:  StoredProcedure [dbo].[TeamDropDown]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[TeamDropDown]

AS BEGIN

SELECT
	TeamID,
	TeamName

FROM Teams

END 

GO
/****** Object:  StoredProcedure [dbo].[TradePlayer]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[TradePlayer]
(
	@PlayerID	int,
	@TeamID		int
)

AS BEGIN

UPDATE Player
SET	TeamID = @TeamID

WHERE PlayerID = @PlayerID

END

GO
/****** Object:  StoredProcedure [dbo].[ViewAllPlayers]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ViewAllPlayers]

AS BEGIN

SELECT 
	pl.PlayerID, 
    pl.FirstName + ' ' + pl.LastName    AS Name, 
	pl.JerseyNumber, 
	pl.LastYearBA, 
	ps1.PositionName					AS PrimaryPosition, 
	ps2.PositionName					AS SecondaryPosition, 
	pl.YearsPlayed, 
	pl.TeamID,
	t.TeamName

FROM Player pl
LEFT JOIN Position ps1 ON pl.PrimaryPositionID = ps1.PositionID
LEFT JOIN Position ps2 ON pl.SecondaryPositionID = ps2.PositionID
LEFT JOIN Teams t ON pl.TeamID = t.TeamID

END 

GO
/****** Object:  StoredProcedure [dbo].[ViewRoster]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ViewRoster]
(
	@TeamID	 int
)

AS BEGIN

SELECT 
	pl.PlayerID, 
    pl.FirstName + ' ' + pl.LastName    AS Name, 
	pl.JerseyNumber,
    pl.LastYearBA, 
	ps1.PositionName					AS PrimaryPosition, 
	ps2.PositionName					AS SecondaryPosition, 
	pl.YearsPlayed 

FROM Player pl
LEFT JOIN Position ps1 ON pl.PrimaryPositionID = ps1.PositionID
LEFT JOIN Position ps2 ON pl.SecondaryPositionID = ps2.PositionID

WHERE TeamID = @TeamID

END

GO
/****** Object:  StoredProcedure [dbo].[ViewTeams]    Script Date: 12/11/2015 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ViewTeams]	

AS BEGIN

SELECT 
	t.TeamID, 
	t.TeamName, 
	t.ManagerName,
	l.LeagueID, 
	l.LeagueName

FROM Teams t
LEFT JOIN Leagues l ON t.LeagueID = l.LeagueID

WHERE TeamID != 1

END

GO
USE [master]
GO
ALTER DATABASE [BaseballLeagueCollection] SET  READ_WRITE 
GO
