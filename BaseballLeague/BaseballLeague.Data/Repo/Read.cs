using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseballLeague.Data.Config;
using BaseballLeague.Models;
using Dapper;

namespace BaseballLeague.Data
{
    public class Read
    {
        // Retrieves a list of all players that DO NOT belong to a team
        public List<Player> GetFreeAgents()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var freeAgents = new List<Player>();

                try
                {
                    freeAgents =
                        cn.Query<Player>("DisplayFreeAgents", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return freeAgents;
            }
        }

        // Retrieves a list of all players that belong to a team
        public List<Player> GetNonFreeAgentPlayers()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var nonFreeAgents = new List<Player>();

                try
                {
                    nonFreeAgents =
                        cn.Query<Player>("ViewAllPlayers", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return nonFreeAgents;
            }
        }

        // Retrieves a list of all players of a specific team
        public List<Player> GetTeamRoster(int TeamID)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var teamRoster = new List<Player>();
                var p = new DynamicParameters();

                try
                {
                    p.Add("TeamID", TeamID);
                    teamRoster = cn.Query<Player>("ViewRoster", p, commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return teamRoster;
            }
        } 

        // Retrieves a list of all teams
        public List<Team> GetTeams()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var teams = new List<Team>();

                try
                {
                    teams = cn.Query<Team>("ViewTeams", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return teams;
            }
        }
    }
}
