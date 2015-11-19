--------------------------------------------------------------------
USE BaseballLeagueCollection
GO
--------------------------------------------------------------------

CREATE PROCEDURE CreateTeam 
(	
	@TeamName		varchar(30), 
	@ManagerName	varchar(30), 
	@LeagueID		int,
	@TeamID			int output
)

AS
BEGIN

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

--------------------------------------------------------------------

CREATE PROCEDURE AddPlayer
(
	@FirstName			    varchar(30),
	@LastName				varchar(30),
	@JerseyNumber			int,
	@TeamID					int,
	@LastYearBA				decimal,
	@YearsPlayed			int,
	@PrimaryPositionID		int,
	@SecondaryPositionID	int,
	@PlayerID				int output
)

AS
BEGIN

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

--------------------------------------------------------------------

CREATE PROCEDURE TradePlayer
(
	@PlayerID	int,
	@TeamID		int
)

AS
BEGIN

UPDATE Player
SET	TeamID = @TeamID

WHERE PlayerID = @PlayerID

END
GO

--------------------------------------------------------------------

CREATE PROCEDURE DeletePlayer
(
	@PlayerID	int
)

AS
BEGIN

DELETE FROM Player

WHERE PlayerID = @PlayerID

END 
GO

--------------------------------------------------------------------

CREATE PROCEDURE ReleasePlayer
(
	@PlayerID	 int
)

AS 
BEGIN

UPDATE Player
SET TeamID = 1

WHERE PlayerID = @PlayerID

END
GO

--------------------------------------------------------------------

CREATE PROCEDURE DisplayFreeAgents

AS
BEGIN

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

WHERE pl.TeamID = 1

END 
GO

--------------------------------------------------------------------

CREATE PROCEDURE ViewAllPlayers

AS
BEGIN

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

WHERE pl.TeamID != 1

END 
GO

--------------------------------------------------------------------

CREATE PROCEDURE ViewRoster
(
	@TeamID	 int
)

AS
BEGIN

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

--------------------------------------------------------------------

CREATE PROCEDURE ViewTeams	

AS
BEGIN

SELECT 
	t.TeamID, 
	t.TeamName, 
	t.ManagerName, 
	l.LeagueName 

FROM Teams t
LEFT JOIN Leagues l ON t.LeagueID = l.LeagueID

WHERE TeamID != 1

END
GO

--------------------------------------------------------------------

CREATE PROCEDURE LeagueDropDown

AS
BEGIN

SELECT 
	LeagueID,
	LeagueName
	
FROM Leagues

END
GO

--------------------------------------------------------------------

CREATE PROCEDURE TeamDropDown

AS 
BEGIN

SELECT
	TeamID,
	TeamName

FROM Teams

END 
GO

--------------------------------------------------------------------

CREATE PROCEDURE PositionDropDown

AS
BEGIN

SELECT
	PositionID,
	PositionName

FROM Position

END 
GO

--------------------------------------------------------------------

