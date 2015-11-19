using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace BaseballLeague.Data
{
    public class Update
    {

        // Releases player by changing TeamID to 1 for 'Free Agent'
        public void ReleasePlayer(int PlayerID)
        {
            using (SqlConnection cn = new SqlConnection())
            {
                var p = new DynamicParameters();

                try
                {
                    p.Add("PlayerID", PlayerID);
                }
            }
        }
        
        // Swaps player's team by changing TeamID
    }
}
