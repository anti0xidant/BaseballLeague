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
    public class Delete
    {
        // Hard deletes a player from Player Table
        public void DeletePlayer(int PlayerID)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("PlayerID", PlayerID);

                    cn.Execute("DeletePlayer", p, commandType: CommandType.StoredProcedure);
                }
                catch (Exception e)
                {
                    var ep = new DynamicParameters();

                    ep.Add("ExceptionType", e.GetType());
                    ep.Add("ExceptionMessage", e.Message);
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
