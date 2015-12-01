--************** Uncomment this section to drop the table*************
USE master
go
DROP DATABASE BaseballLeagueCollection
go
--*********************************************************************


-- **********************************
-- Create All Tables
-- **********************************
USE master
GO
CREATE DATABASE BaseballLeagueCollection
GO

USE BaseballLeagueCollection
GO

CREATE TABLE dbo.Position(
	PositionID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
		PositionName varchar(30) NOT NULL
)
GO

CREATE TABLE dbo.Leagues(
	LeagueID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	LeagueName varchar(50) NOT NULL
)
GO

CREATE TABLE dbo.Teams(
TeamID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
TeamName varchar(30),
ManagerName varchar(30),
LeagueID int,
CONSTRAINT FK_LeagueID FOREIGN KEY (LeagueID)
	REFERENCES dbo.Leagues (LeagueID)
)
GO

CREATE TABLE dbo.Player(
PlayerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
JerseyNumber int NOT NULL,
TeamID int NOT NULL,
CONSTRAINT FK_TeamID FOREIGN KEY (TeamID)
	REFERENCES dbo.Teams (TeamID),
LastYearBA dec(3,3),
YearsPlayed int,
PrimaryPositionID int NOT NULL,
CONSTRAINT FK_PlayerPosition FOREIGN KEY (PrimaryPositionID)
	REFERENCES dbo.Position (PositionID),
SecondaryPositionID int,
CONSTRAINT FK_PlayerPosition2 FOREIGN KEY (SecondaryPositionID)
	REFERENCES dbo.Position (PositionID),
)
GO

CREATE TABLE dbo.Exception
(
	ExceptionID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ExceptionType nvarchar(100) NOT NULL,
	ExceptionMessage nvarchar(300),
	ExceptionDate datetime NOT NULL,
	Input text
)

-- **********************************
-- Insert Sample Data
-- **********************************

INSERT INTO Leagues (LeagueName)
	VALUES
	('National League'),
	('American League');

INSERT INTO Position (PositionName)
	VALUES
	('Pitcher'),
	('Catcher'),
	('First Base'),
	('Second Base'),
	('Short Stop'),
	('Third Base'),
	('Left Fielder'),
	('Center Fielder'),
	('Right Fielder');

	INSERT INTO Teams (TeamName, ManagerName, LeagueID)
	VALUES 
	('Free Agent', NULL, NULL),	
	('Cincinnati Reds', 'Bryan Price', 2),
	('Cleveland Indians', 'Terry Francona', 1),
	('Detroit Tigers', 'Brad Ausmus', 1),
	('Arizona Diamondbacks', 'Chip Hale', 2);

INSERT INTO Player (FirstName, LastName, JerseyNumber, TeamID, LastYearBA, YearsPlayed, PrimaryPositionID, SecondaryPositionID)
	VALUES	
	('Player1', 'One', 23, 1, 0.297, 5, 1, NULL),
	('Player2', 'Two', 24, 1, 0.248, 2, 2, NULL),
	('Player3', 'Three', 25, 1, 0.268, 3, 3, NULL),
	('Player4', 'Four', 26, 1, 0.304, 3, 4, 2),
	('Player5', 'Five', 27, 1, 0.293, 1, 5, NULL),
	('Player6', 'Six', 28, 1, 0.257, 1, 6, NULL),
	('Player7', 'Seven', 29, 1, 0.283, 1, 7, 8),
	('Player8', 'Eight', 30, 1, 0.301, 1, 8, 7),
	('Player9', 'Nine', 31, 1, 0.293, 1, 5, NULL),
	
	('Lewis', 'Elliot', 12, 2, 0.256, 3, 1, NULL),
	('Elwood', 'Trenton', 24, 2, 0.269, 5, 2, NULL),
	('Blaze', 'Caelan ', 3, 2, 0.298, 3, 3, NULL),
	('Andrew', 'Tang', 7, 2, 0.278, 2, 4, 5),
	('Brandon', 'Marshal', 38, 2, 0.278, 6, 5, 4),
	('Thad', 'Vern', 21, 2, 0.303, 4, 6, 8),
	('Reginald', 'Kyle', 17, 2, 0.298, 2, 7, NULL),
	('Hadyn', 'Rayner', 9, 2, 0.288, NULL, 8, NULL),
	('Dalton', 'Tobias', 2, 2, 0.314, 3, 9, NULL),

	('Wilkie', 'Finnegan', 3, 3, 0.294, 4, 1, NULL),
	('Kenton', 'Leighton', 16, 3, 0.259, 1, 2, 5),
	('Stacy', 'Chuck', 44, 3, 0.299, 3, 3, NULL),
	('Mick', 'Rowland', 58, 3, 0.314, 1, 4, NULL),
	('Martin', 'Davis', 24, 3, 0.244, 7, 5, NULL),
	('Lynton', 'Dee', 5, 3, 0.294, 4, 6, NULL),
	('Mervin', 'Anthony', 42, 3, 0.269, 2, 7, 8),
	('Micky', 'Nat', 27, 3, 0.288, 1, 8, NULL),
	('Dederick', 'Cameron', 14, 3, 0.302, NULL, 9, NULL),

	('Mike', 'Drozda', 23, 4, 0.357, 4, 1, 3),	
	('Rocco', 'Riccardi', 11, 4, 0.302, NULL, 2, NULL),
	('Dee', 'Austin', 8, 4, 0.287, 3, 3, NULL),
	('Jimi', 'Prosper', 14, 4, 0.256, 8, 4, NULL),
	('Cree', 'Kenrick', 27, 4, 0.213, 1, 5, NULL),
	('Jonty', 'Moss', 4, 4, 0.266, 2, 6, NULL),
	('Kolby', 'Dallas', 33, 4, 0.277, 2, 7, NULL),
	('Jervis', 'Abraham', 21, 4, 0.263, NULL, 8, NULL),
	('Allen', 'Tracy', 41, 4, 0.301, 3, 9, NULL),

	('Hoyt', 'Lyle', 22, 5, 0.305, 2, 1, NULL),
	('Carleton', 'Tanner', 42, 5, 0.322, 1, 2, NULL),
	('Scott', 'Benz', 3, 5, 0.288, 4, 3, NULL),
	('Evan', 'Ethelbert', 13, 5, 0.277, 2, 4, 5),
	('Damon', 'Hyram', 16, 5, 0.302, 6, 5, 4),
	('Clancy', 'Herbert', 45, 5, 0.312, 3, 6, NULL),
	('Arlo', 'Augustine', 30, 5, 0.269, 1, 7, NULL),
	('Lucas', 'Connell', 6, 5, 0.250, 1, 8, NULL),
	('Tranter', 'Geoffrey', 28, 5, 0.312, 3, 9, 8);
