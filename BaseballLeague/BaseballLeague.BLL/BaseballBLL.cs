using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseballLeague.Models;
using BaseballLeague.Data;

namespace BaseballLeague.BLL
{
    public class BaseballBLL
    {
        #region Create Methods

        // Add player to database. Player object is assigned a PlayerID
        public void AddPlayer(Player player)
        {
            var create = new Create();
            create.AddPlayer(player);
        }

        // Add new team to database. Team object receieves a TeamID
        public void AddTeam(Team team)
        {
            var create = new Create();
            create.AddTeam(team);
        }
        #endregion

        #region Read Methods

        // Retrieves a list of all players that DO NOT belong to a team
        public List<Player> GetFreeAgents()
        {
            var read = new Read();

            return read.GetFreeAgents();
        }

        // Retrieves a list of all players that belong to a team
        public List<Player> GetAllPlayers()
        {
            var read = new Read();

            return read.GetAllPlayers();
        }

        // Retrieves a list of all players of a specific team
        public List<Player> GetTeamRoster(int TeamID)
        {
            var read = new Read();

            return read.GetTeamRoster(TeamID);
        }

        // Retrieves a list of all teams
        public List<Team> GetTeams()
        {
            var read = new Read();
            
            return read.GetTeams();
        }

        #endregion

        #region Update Methods

        // Releases player by changing TeamID to 1 for 'Free Agent'
        public void ReleasePlayer(int PlayerID)
        {
            var update = new Update();

            update.ReleasePlayer(PlayerID);
        }

        // Swaps player's team by changing TeamID
        public void TradePlayer(int PlayerID, int TeamID)
        {
            var update = new Update();

            update.TradePlayer(PlayerID, TeamID);
        }

        #endregion

        #region Delete Methods

        // Hard deletes a player from Player Table
        public void DeletePlayer(int PlayerID)
        {
            var delete = new Delete();

            delete.DeletePlayer(PlayerID);
        }

        #endregion

        #region Dropdown Methods

        // Retrieves TeamID and TeamName for dropdown list
        public List<Team> GetTeamDropDown()
        {
            var dropDown = new Dropdown();

            return dropDown.GetTeamDropDown();
        }

        // Retrieves PositionID and PositionName for dropdown list
        public List<Position> GetPositionDropDown()
        {
            var dropDown = new Dropdown();

            return dropDown.GetPositionDropDown();
        }

        // Retrieves LeagueID and LeagueName fro dropdown list
        public List<League> GetLeagueDropDown()
        {
            var dropDown = new Dropdown();

            return dropDown.GetLeagueDropDown();
        } 

        #endregion

    }
}
