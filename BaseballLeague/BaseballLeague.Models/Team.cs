using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseballLeague.Models
{
    public class Team
    {
        public int TeamID { get; set; }
        public string TeamName { get; set; }
        public string ManagerName { get; set; }
        public int LeagueID { get; set; }
        public string LeagueName { get; set; }
    }
}
