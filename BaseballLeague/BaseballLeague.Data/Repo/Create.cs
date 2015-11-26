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
    public class Create
    {
        // Add player to database. Player object is assigned a PlayerID
        public void AddPlayer(Player player)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("FirstName", player.FirstName);
                    p.Add("LastName", player.LastName);
                    p.Add("JerseyNumber", player.JerseyNumber);
                    p.Add("TeamID", player.TeamID);
                    p.Add("LastYearBA", player.LastYearBA);
                    p.Add("YearsPlayed", player.YearsPlayed);
                    p.Add("PrimaryPositionID", player.PrimaryPositionID);
                    p.Add("SecondaryPositionID", player.SecondaryPositionID);
                    p.Add("PlayerID", DbType.Int32, direction: ParameterDirection.Output);

                    cn.Execute("AddPlayer", p, commandType: CommandType.StoredProcedure);

                    player.PlayerID = p.Get<int>("PlayerID");
                }
                catch (Exception e)
                {
                    var ep = new DynamicParameters();

                    ep.Add("ExceptionType", e.GetType());
                    ep.Add("ExceptionMessage", e.Message);
                    ep.Add("Input", String.Format("FirstName = {0}, LastName = {1}, JerseyNumber = {2}," +
                                                  "TeamID = {3}, LastYearBA = {4}, YearsPlayed = {5}, " +
                                                  "PrimaryPositionID = {6}, SecondaryPositionID = {7}",
                        player.FirstName, player.LastName, player.JerseyNumber,
                        player.TeamID, player.LastYearBA, player.YearsPlayed, player.PrimaryPositionID,
                        player.SecondaryPositionID));
                    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);

                }
                finally
                {
                    cn.Close();
                }

            }
        }

        // Add new team to database. Team object receieves a TeamID
        public void AddTeam(Team team)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("TeamName", team.TeamName);
                    p.Add("ManagerName", team.ManagerName);
                    p.Add("LeagueID", team.LeagueID);
                    p.Add("TeamID", DbType.Int32, direction: ParameterDirection.Output);

                    cn.Execute("CreateTeam", p, commandType: CommandType.StoredProcedure);

                    team.TeamID = p.Get<int>("TeamID");
                }
                catch (Exception e)
                {
                    var ep = new DynamicParameters();

                    ep.Add("ExceptionType", e.GetType());
                    ep.Add("ExceptionMessage", e.Message);
                    ep.Add("Input", String.Format("TeamName = {0}, ManagerName = {1}, LeagueID = {2}",
                        team.TeamName, team.ManagerName, team.LeagueID));
                    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                }
                finally
                {
                    cn.Close();
                }
            }
        }
    }
}