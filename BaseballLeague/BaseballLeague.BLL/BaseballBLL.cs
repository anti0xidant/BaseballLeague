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
        #region Read Methods
        // Retrieves a list of all players that DO NOT belong to a team
        public List<Player> GetFreeAgents()
        {
            var read = new Read();

            return read.GetFreeAgents();
        }

        // Retrieves a list of all players that belong to a team
        public List<Player> GetNonFreeAgentPlayers()
        {
            var read = new Read();

            return read.GetNonFreeAgentPlayers();
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

        #region Delete Methods
        #endregion

        #region Update Methods
        #endregion

        #region Dropdown Methods
        #endregion

    }
}
