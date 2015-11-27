using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseballLeague.Data.Config;
using Dapper;

namespace BaseballLeague.Data
{
    public class Update
    {
        // Releases player by changing TeamID to 1 for 'Free Agent'
        public void ReleasePlayer(int PlayerID)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("PlayerID", PlayerID);

                    cn.Execute("ReleasePlayer", p, commandType: CommandType.StoredProcedure);
                }
                //catch (Exception e)
                //{
                //    // Write failure to database
                //    var ep = new DynamicParameters();

                //    ep.Add("ExceptionType", e.GetType());
                //    ep.Add("ExceptionMessage", e.Message);
                //    ep.Add("Input", "PlayerID = " + PlayerID);
                //    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }
            }
        }
        
        // Swaps player's team by changing TeamID
        public void TradePlayer(int PlayerID, int TeamID)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("PlayerID", PlayerID);
                    p.Add("TeamID", TeamID);

                    cn.Execute("TradePlayer", p, commandType: CommandType.StoredProcedure);
                }
                //catch (Exception e)
                //{
                //    // Write failure to database
                //    var ep = new DynamicParameters();

                //    ep.Add("ExceptionType", e.GetType());
                //    ep.Add("ExceptionMessage", e.Message);
                //    ep.Add("Input", String.Format("PlayerID = {0}, TeamID = {1}", PlayerID, TeamID));
                //    cn.Execute("AddError", ep, commandType: CommandType.StoredProcedure);
                //}
                finally
                {
                    cn.Close();
                }
            }
        }
    }
}
