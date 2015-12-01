using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Caching;
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
                var players = new List<Player>();

                try
                {
                    players =
                        cn.Query<Player>("DisplayFreeAgents", commandType: CommandType.StoredProcedure).ToList();
                }
                //catch (Exception e)
                //{
                //    // Write failure to database
                //    var ep = new DynamicParameters();

                //    ep.Add("ExceptionType", e.GetType());
                //    ep.Add("ExceptionMessage", e.Message);
                //    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }

                return players;
            }
        }

        // Retrieves a list of all players that belong to a team
        public List<Player> GetAllPlayers()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var players = new List<Player>();

                try
                {
                    players=
                        cn.Query<Player>("ViewAllPlayers", commandType: CommandType.StoredProcedure).ToList();
                   
                }
                //catch (Exception e)
                //{
                //    // Write failure to database
                //    var ep = new DynamicParameters();

                //    ep.Add("ExceptionType", e.GetType());
                //    ep.Add("ExceptionMessage", e.Message);
                //    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }

                return players;
            }
        }

        // Retrieves a list of all players of a specific team
        public List<Player> GetTeamRoster(int TeamID)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var players = new List<Player>();

                try
                {
                    var p = new DynamicParameters();

                    p.Add("TeamID", TeamID);
                    players= cn.Query<Player>("ViewRoster", p, commandType: CommandType.StoredProcedure).ToList();
                }
                //catch (Exception e)
                //{
                //    // Write failure to database
                //    var ep = new DynamicParameters();

                //    ep.Add("ExceptionType", e.GetType());
                //    ep.Add("ExceptionMessage", e.Message);
                //    ep.Add("Input", "Team ID = " + TeamID);
                //    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }

                return players;
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
                //catch(Exception e)
                //{
                //    var p = new DynamicParameters();

                //    p.Add("ExceptionType", e.GetType());
                //    p.Add("ExceptionMessage", e.Message);
                //    cn.Execute("AddError", p, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }

                return teams;
            }
        }
    }
}
