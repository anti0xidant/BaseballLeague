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
    public class Dropdown
    {
        public List<Team> GetTeamDropDown()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var teams = new List<Team>();

                try
                {
                    teams = cn.Query<Team>("TeamDropDown", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return teams;
            }
        }

        public List<Position> GetPositionDropDown()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var positions = new List<Position>();

                try
                {
                    positions = cn.Query<Position>("PositionDropDown", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return positions;
            }
        }

        public List<League> GetLeagueDropDown()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var leagues = new List<League>();

                try
                {
                    leagues = cn.Query<League>("LeagueDropDown", commandType: CommandType.StoredProcedure).ToList();
                }
                finally
                {
                    cn.Close();
                }

                return leagues;
            }
        }
    }
}
